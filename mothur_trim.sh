#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J mo_trim
#SBATCH -p defq,short
#SBATCH --array=1-10
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/mo_trim_%A_%a.out
#SBATCH -e out_err_files/mo_trim_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list_short.txt)
name2=$(sed -n "$SLURM_ARRAY_TASK_ID"p oligo_list.txt)
cd ../data/seq
module load mothur
#mothur "#fastq.info(fastq=${name1}_denoised_contiged.fastq)"
mothur "#trim.seqs(fasta=${name1}_denoised_contiged.fasta,oligos=${name2},maxambig=0, maxhomop=8, processors=16, bdiffs=0, pdiffs=0, minlength=300, maxlength=350, checkorient=t)"
