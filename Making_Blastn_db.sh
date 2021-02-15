#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=20G  # max you can get in batch nodes
#SBATCH --time=24:00:00     # 24 hours
##SBATCH --output=Check_Seq_Quality_Scores.stdout
#SBATCH --mail-user=hfreu002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="Check Sequence Quality Scores"
#SBATCH -p intel,batch # This is the default partition, you can use any of the following: intel, batch, highmem, gpu

module load ncbi-blast/2.9.0+

# Make the Blastn database
makeblastdb -in Silva_All_DBPrep_Ready_10.25.txt -dbtype nucl

