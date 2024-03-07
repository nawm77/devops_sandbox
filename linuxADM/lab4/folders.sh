#!/bin/sh

mkdir -p /home/vagrant/shared/project
echo "Created dir /home/vagrant/shared/project"
cd /home/vagrant/shared/project
mkdir -p stage{1..3}/documents stage{1..3}/budget && \
for i in {1..3}; do echo "STAGE $i" > stage$i/documents/document.txt; echo "BUDGET FOR STAGE $i" > stage$i/budget/readme.txt; done