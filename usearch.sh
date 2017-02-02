#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J USEARCH
#SBATCH -p defq,short
#SBATCH --array=1-11
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/USEARCH_%A_%a.out
#SBATCH -e out_err_files/USEARCH_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list_short.txt)
cd ../data/seq
#gzip -d *corrected*.gz
module load usearch/9.2.64
usearch -fastq_mergepairs ${name1}1.corrected.fastq -reverse ${name1}2.corrected.fastq -fastqout ${name1}_denoised_contiged.fastq
#-fastq_mergepairs 16_S10_L001_R1_001_run1.corrected.fq -reverse 16_S10_L001_R2_001_run1.corrected.fq -fastqout Mock_Run1_denoised_contiged.fastq -fastq_merge_maxee 1.0
