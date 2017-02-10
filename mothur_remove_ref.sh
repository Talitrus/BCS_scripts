#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J mo_merge
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/mo_remove_ref_%A_%a.out
#SBATCH -e out_err_files/mo_remove_ref_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p split_files.txt)
module load mothur
cd ../data/seq
mothur "#remove.seqs(accnos=BIOCODE2014_MACSE_313_headers.accnos, fasta=${name1}_NT_macse.fasta)"
