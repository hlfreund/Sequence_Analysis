#!/bin/sh

FILES=/Users/Hannahfreund/Desktop/THESIS/MGM_Seqs/MGMs_COx_md5IDs/*.txt

for f in $FILES
do

grep -F -f "$f" Result_stat_xak_.txt > "$f"_COx_xak_matches.txt

echo "meow"
done

