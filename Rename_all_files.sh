#!/bin/sh

for file in *.txt

do

mv "$file" "${file/.txt/$file_COxIII.txt}"

done
