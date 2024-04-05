cqlsh -e 'CREATE KEYSPACE student_keyspace WITH replication = {"class": "SimpleStrategy", "replication_factor": "1"}  AND durable_writes = true;'
cqlsh -e '
CREATE TABLE student_keyspace.students (id uuid PRIMARY KEY, birthday date, "group" text, name text, surname text);
WITH additional_write_policy = "99p"
    AND bloom_filter_fp_chance = 0.01
    AND caching = {"keys": "ALL", "rows_per_partition": "NONE"}
    AND cdc = false
    AND comment = ""
    AND compaction = {"class": "org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy", "max_threshold": "32", "min_threshold": "4"}
    AND compression = {"chunk_length_in_kb": "16", "class": "org.apache.cassandra.io.compress.LZ4Compressor"}
    AND memtable = "default"
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND extensions = {}
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = "BLOCKING"
    AND speculative_retry = "99p";'
cqlsh -e '
CREATE MATERIALIZED VIEW student_keyspace.students_by_age AS
SELECT id, birthday, "group", name, surname
FROM student_keyspace.students
WHERE id IS NOT NULL
PRIMARY KEY (id);
'
cqlsh -e '
INSERT INTO student_keyspace.students (id, "group", surname, name, birthday)
          VALUES (uuid(), "УВП-272", "Сидоров", "Иван", "2001-09-15");
          (uuid(), 'УВП-273', 'Кузнецова', 'Ольга', '1998-03-08'),
          (uuid(), 'УВП-272', 'Смирнов', 'Андрей', '2000-11-28'),
          (uuid(), 'УВП-271', 'Васильева', 'Анна', '2001-07-04'),
          (uuid(), 'УВП-273', 'Соколов', 'Михаил', '1999-02-19'),
          (uuid(), 'УВП-272', 'Ковалева', 'Мария2000-06-12', 'УВП-271'),
          (uuid(), 'Николаев', 'Дмитрий', '2001-01-30', 'УВП-273'),
          (uuid(), 'Морозова', 'Софья', '1998-10-05', 'УВП-271'),
          (uuid(), 'Лебедев', 'Артем', '2000-04-17', 'УВП-272'),
          (uuid(), 'Новикова', 'Юлия', '1999-11-03', 'УВП-273'),
          (uuid(), 'Козлов', 'Илья', '2001-06-25', 'УВП-272'),
          (uuid(), 'Попова', 'Ксения', '1998-08-14', 'УВП-272'),
          (uuid(), 'Семенов', 'Роман', '2000-09-02', 'УВП-273'),
          (uuid(), 'Виноградова', 'Дарья', '2001-03-11', 'УВП-271'),
          (uuid(), 'Алексеев', 'Максим', '1999-07-20', 'УВП-272'),
          (uuid(), 'Федорова', 'Елена', '2000-01-28', 'УВП-273'),
          (uuid(), 'Степанов', 'Егор', '2001-12-06', 'УВП-271'),
          (uuid(), 'Гаврилова', 'Вероника', '1998-05-31', 'УВП-271'),
          (uuid(), 'Борисов', 'Никита', '2000-02-09', 'УВП-272'),
          (uuid(), 'Михайлова', 'Анастасия', '1999-09-16', 'УВП-273'),
          (uuid(), 'Волков', 'Данила', '2001-08-23', 'УВП-272'),
          (uuid(), 'УВП-271', 'Прохоров', 'Тимофей', '2000-07-13'),
          (uuid(), 'УВП-271', 'Тихонова', 'Валерия', '2001-04-29'),
          (uuid(), 'УВП-272', 'Денисов', 'Марк', '1999-10-05'),
          (uuid(), 'УВП-271', 'Орлова', 'Таисия', '2000-06-18'),
          (uuid(), 'УВП-272', 'Куликов', 'Савелий', '2001-02-21'),
          (uuid(), 'УВП-271', 'Владимирова', 'Кира', '1998-11-08'),
          (uuid(), 'УВП-271', 'Петрова', 'Мария', '2001-05-22'),
          (uuid(), 'УВП-273', 'Сидоров', 'Иван', '2002-03-08'),
          (uuid(), 'УВП-272', 'Кузнецова', 'Анастасия', '2000-01-15'),
          (uuid(), 'УВП-271', 'Иванов', 'Михаил', '2001-07-11'),
          (uuid(), 'УВП-271', 'Михайлова', 'Ольга', '2002-09-25'),
          (uuid(), 'УВП-272', 'Смирнов', 'Алексей', '2000-04-04'),
          (uuid(), 'УВП-272', 'Егорова', 'Дарья', '2001-11-23'),
          (uuid(), 'УВП-272', 'Павлов', 'Сергей', '2002-06-17'),
          (uuid(), 'УВП-273', 'Андреев', 'Андрей', '2001-08-07'),
          (uuid(), 'УВП-273', 'Васильева', 'Ирина', '2002-02-14'),
          (uuid(), 'УВП-273', 'Петров', 'Николай', '2003-05-01'),
          (uuid(), 'УВП-273', 'Соколова', 'Елена', '2001-12-18'),
          (uuid(), 'УВП-273', 'Кузнецов', 'Дмитрий', '2002-04-25'),
          (uuid(), 'УВП-273', 'Иванова', 'Ольга', '2003-07-02'),
          (uuid(), 'УВП-271', 'Максимов', 'Сергей', '2001-10-09'),
          (uuid(), 'УВП-272', 'Попова', 'Анна', '2002-03-16'),
          (uuid(), 'УВП-272', 'Михайлов', 'Владимир', '2003-06-23'),
          (uuid(), 'УВП-271', 'Романов', 'Михаил', '2002-09-05');
'

'INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Сидоров', 'Иван', '2001-09-15');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Кузнецова', 'Ольга', '1998-03-08');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Смирнов', 'Андрей', '2000-11-28');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Васильева', 'Анна', '2001-07-04');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Соколов', 'Михаил', '1999-02-19');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Ковалева', 'Мария2000-06-12', 'УВП-271');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Николаев', 'Дмитрий', '2001-01-30', 'УВП-273');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Морозова', 'Софья', '1998-10-05', 'УВП-271');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Лебедев', 'Артем', '2000-04-17', 'УВП-272');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Новикова', 'Юлия', '1999-11-03', 'УВП-273');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Козлов', 'Илья', '2001-06-25', 'УВП-272');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Попова', 'Ксения', '1998-08-14', 'УВП-272');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Семенов', 'Роман', '2000-09-02', 'УВП-273');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Виноградова', 'Дарья', '2001-03-11', 'УВП-271');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Алексеев', 'Максим', '1999-07-20', 'УВП-272');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Федорова', 'Елена', '2000-01-28', 'УВП-273');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Степанов', 'Егор', '2001-12-06', 'УВП-271');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Гаврилова', 'Вероника', '1998-05-31', 'УВП-271');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Борисов', 'Никита', '2000-02-09', 'УВП-272');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Михайлова', 'Анастасия', '1999-09-16', 'УВП-273');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'Волков', 'Данила', '2001-08-23', 'УВП-272');



 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Прохоров', 'Тимофей', '2000-07-13');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Тихонова', 'Валерия', '2001-04-29');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Денисов', 'Марк', '1999-10-05');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Орлова', 'Таисия', '2000-06-18');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Куликов', 'Савелий', '2001-02-21');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Владимирова', 'Кира', '1998-11-08');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Петрова', 'Мария', '2001-05-22');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Сидоров', 'Иван', '2002-03-08');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Кузнецова', 'Анастасия', '2000-01-15');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Иванов', 'Михаил', '2001-07-11');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Михайлова', 'Ольга', '2002-09-25');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Смирнов', 'Алексей', '2000-04-04');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Егорова', 'Дарья', '2001-11-23');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Павлов', 'Сергей', '2002-06-17');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Андреев', 'Андрей', '2001-08-07');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Васильева', 'Ирина', '2002-02-14');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Петров', 'Николай', '2003-05-01');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Соколова', 'Елена', '2001-12-18');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Кузнецов', 'Дмитрий', '2002-04-25');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-273', 'Иванова', 'Ольга', '2003-07-02');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Максимов', 'Сергей', '2001-10-09');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Попова', 'Анна', '2002-03-16');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-272', 'Михайлов', 'Владимир', '2003-06-23');
 INSERT INTO student_keyspace.students (id, "group", surname, name, birthday) VALUES (uuid(), 'УВП-271', 'Романов', 'Михаил', '2002-09-05');'




 CREATE TABLE student_keyspace.students (
     name text,
     surname text,
     birthday date,
     id uuid,
     "group" text,
     PRIMARY KEY ((name, surname), id)
 );
CREATE MATERIALIZED VIEW student_keyspace.students_by_age AS SELECT id, birthday, "group", name, surname FROM student_keyspa ce.students WHERE id IS NOT NULL AND name IS NOT NULL AND surname IS NOT NULL PRIMARY KEY (surname, id, name);


UPDATE student_keyspace.students SET birthday = '2000-04-04' WHERE name = 'Полина' AND surname = 'Комарова' AND id = 380390ff-d4e5-44f4-ad17-3511e4fbbf5a;


UPDATE student_keyspace.students SET email = surname || '.' || name || '-' || "group" || '@miit.ru' WHERE "group" = 'УВП-271';

UPDATE student_keyspace.students SET email = name || '.' || surname || '-' || "group" || '@miit.ru' WHERE "group" = 'УВП-272';

UPDATE student_keyspace.students SET email = "group" || '-' || surname || '.' || name || '@miit.ru' WHERE "group" = 'УВП-273';


UPDATE student_keyspace.students SET email = surname || '.' || name || '-' || "group" || '@miit.ru' WHERE "group" = 'УВП-271';
