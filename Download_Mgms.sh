#!/bin/sh

for mgm in $(cat MGM_ID_List1.txt) #read list of MGM Ids
do

curl -o "$mgm"_650.txt http://api.metagenomics.anl.gov/1/download/"$mgm"?file=650.1

    while read md5id
    do
    cut -f 2 > "$mgm"_md5id_list.txt
    echo
    done < "$mgm"_650.txt
done



