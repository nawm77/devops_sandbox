#!/bin/bash

# Запускаем cqlsh
cqlsh -e "

CREATE KEYSPACE student_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true; 
CREATE TABLE student_keyspace.students (
    id uuid PRIMARY KEY,
    age int,
    email text,
    name text
) WITH additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND cdc = false
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND memtable = 'default'
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND extensions = {}
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p'; 
CREATE MATERIALIZED VIEW student_keyspace.students_by_age AS
SELECT id, age, email, name
FROM student_keyspace.students
WHERE id IS NOT NULL AND age IS NOT NULL
PRIMARY KEY (age, id);
"
