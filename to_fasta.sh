#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J to_fasta
#SBATCH -p defq,short
#SBATCH --array=1-10
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/to_fasta_%A_%a.out
#SBATCH -e out_err_files/to_fasta_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list_short.txt)
cd ../data/seq
module load mothur
mothur "#fastq.info(fastq=${name1}_denoised_contiged.fastq)"
#usearch -fastq_mergepairs ${name1}1.corrected.fastq -reverse ${name1}2.corrected.fastq -fastqout ${name1}_denoised_contiged.fastq
