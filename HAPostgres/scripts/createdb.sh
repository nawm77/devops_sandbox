#!/bin/bash
echo "enter db name"
read dbname
createdb -U $POSTGRES_USERNAME $dbname
echo "enter filename"
read filename
psql -d $dbname -U $POSTGRES_USERNAME -f /backup/$filename