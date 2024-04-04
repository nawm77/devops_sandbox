#!/bin/bash
current_date=$(date +"%Y%m%d")
echo "db name"
read dbname
backup_file="/backup/backup-$dbname-$current_date.sql"
pg_dump -U $POSTGRES_USERNAME -d $dbname > $backup_file
echo "Dumped file with name $backup_file for db $dbname"