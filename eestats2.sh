#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:20:00
#SBATCH -J eestats2
#SBATCH -p defq,short
#SBATCH --array=1-11
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/eestats2_%A_%a.out
#SBATCH -e out_err_files/eestats2_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list_short.txt)
cd ../data/seq
module load usearch/9.2.64
usearch -fastq_eestats2 ${name1}2_001.corrected.fastq -output ${name1}2_eestats2.txt -length_cutoffs 150,300,10 -ee_cutoffs 0.5,1.0,2.0,3.0,4.0,5.0
usearch -fastq_eestats2 ${name1}1_001.corrected.fastq -output ${name1}1_eestats2.txt -length_cutoffs 150,300,10 -ee_cutoffs 0.5,1.0,2.0,3.0,4.0,5.0
