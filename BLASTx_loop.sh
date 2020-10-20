#!/bin/sh

for i in *.txt
do

blastx -query $i -db COx_III_db1.txt -out $(name).txt

done

<<<<<<< HEAD
# after -db argument, put your database file here
=======

>>>>>>> f3d999e712b0d9b3cbb29b7b92df2f0e2a5e8c97
