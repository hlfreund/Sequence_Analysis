#!/bin/bash

## HELPFUL if you want to run multiple BLASTs to compare sequences to different databases!
rm result1_seq.txt
rm result1_stat.txt

for mgm in $(cat MGM_ID_List.txt)
do
rm temp.txt
rm temp2.txt
rm test.txt
rm test2.txt

curl -o temp.txt http://api.metagenomics.anl.gov/1/download/"$mgm"?file=350.1 # download mgm
n=$(grep ">" temp.txt | wc -l | tr -d "\t") # count sequences based on >
n2=$(echo -e $n $mgm) # give us # for each mgm specifically based on line before ^^

tr '\n' '@' < temp.txt | sed 's/@>/\n>/g' > temp2.txt

    while read seq
    do
    echo $seq | cut -d "@" -f 1
    echo $seq | tr '@' '\n' > temp3.txt
    blastp -query temp3.txt -db COx_db1_all.txt -outfmt 6 -evalue 1e-3 -out test.txt

if [[ -s test.txt ]] ; then
blastp -query temp3.txt -db COx_SuperDB_2.txt -outfmt 6 -evalue 1e-3 -out test2.txt
    if [[ -s test2.txt ]] ; then

    cat test2.txt | sed "s/^/$n2\t$n4/g" >> result1_stat.txt
    cat temp3.txt >> result1_seq.txt
    else
    echo
    fi
else
echo
fi

    done < temp2.txt

done

#while read mgm
#do

#echo $mgm

#| sed '/^\s*$/d' | sed 's/@/\n/g'
