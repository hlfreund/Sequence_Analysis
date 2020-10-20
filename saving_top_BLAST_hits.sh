#!/bin/sh

while read line
do

if [[$num -lt 0]]; then
cat mgm_COx_B_Results_All_1_9.23.txt | echo $line >> good_BLAST_hits_COx.txt
else
echo
fi
done < mgm_COx_B_Results_All_1_9.23.txt
