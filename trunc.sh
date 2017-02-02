#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:20:00
#SBATCH -J trunc
#SBATCH -p defq,short
#SBATCH --array=1-11
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/trunc_%A_%a.out
#SBATCH -e out_err_files/trunc_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list_short.txt)
cd ../data/seq
module load usearch/9.2.64
usearch -fastx_truncate ${name1}1_001.corrected.fastq -trunclen 250 -fastqout ${name1}1.corr_250.fq -padlen 250
usearch -fastx_truncate ${name1}2_001.corrected.fastq -trunclen 215 -fastqout ${name1}2.corr_215.fq -padlen 215
