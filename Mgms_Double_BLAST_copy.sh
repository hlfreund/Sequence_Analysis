#!/bin/bash
rm result1_seq.txt
rm result1_stat.txt

for mgm in $(cat MGM_ID_List.txt) # for each metagenome in the list MGM_ID_List.txt (will read each object in this txt file)
do
rm temp.txt # (rm is remove, so it will remove all of these files from the last run of the loop)
rm temp2.txt
rm test.txt
rm test2.txt

curl -o temp.txt http://api.metagenomics.anl.gov/1/download/"$mgm"?file=350.1 #curl is to transfer (down/up load) a file; -o means to write an output file from whatever we download - in this case, the mgm 350 file (refer ot MGrast manual to remember what that is)
n=$(grep ">" temp.txt | wc -l | tr -d "\t") # n = # of sequences in each mgm file; calling for n will search for the carrot in the txt file, count the words by line, and delete the tabs -- making everything one file but still separating all of the sequences and knowing how many there are per mgm
n2=$(echo -e $n $mgm) # n2 = # of sequences in each file, and the mgm ID; echo -e will "echo" this information into the text file in a new line because of the -e
### -e option is used to enable echo's interpretation of additional instances of the newline character as well as the interpretation of other special characters

tr '\n' '@' < temp.txt | sed 's/@>/\n>/g' > temp2.txt # transform each new line w/ @ from temp.txt file; then stream edit (sed) + replace every @> with \n> so that each sequence is separated with the caret --> putting back in FASTA format for the BLAST

while read seq # while read seq aka sequence from temp2.txt [ if else loops are nested in the while read loop]
    do
    echo $seq | cut -d "@" -f 1 # echo sequence, then cut based on the @ delimiter from field 1
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
