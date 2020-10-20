#!/bin/sh

for i in *.txt
do

blastx -query $i -db COx_III_db1.txt -out $(name).txt

done

# after -db, put your specific database

