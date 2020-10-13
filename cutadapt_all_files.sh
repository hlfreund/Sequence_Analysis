#!/bin/bash

for i in *_R1_001.fastq;
do
    SAMPLE=$(echo ${i} | sed "s/_R1_\001\.fastq//")
    echo ${SAMPLE}_R1_001.fastq ${SAMPLE}_R2_001.fastq
    cutadapt --pair-adapters -b ACTGCGAA -B TTCGCAGT -o ${SAMPLE}_R1_001_trim.fastq -p ${SAMPLE}_R2_001_trim.fastq  ${SAMPLE}_R1_001.fastq ${SAMPLE}_R2_001.fastq

done

#--untrimmed-output ${SAMPLE}_R1_untrimmed.fastq --untrimmed-paired-output ${SAMPLE}_R2_untrimmed.fastq
