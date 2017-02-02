#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J mo_merge
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/mo_merge_%A_%a.out
#SBATCH -e out_err_files/mo_merge_%A_%a.err
ls ../data/seq/*R_denoised_contiged.trim.fasta > mothur_trim_files.txt
ls ../data/seq/*R_denoised_contiged.groups > mothur_groups_files.txt
trim_string=$(cat mothur_trim_files.txt | paste -s -d"-")
group_string=$(cat mothur_groups_files.txt | paste -s -d"-")
module load mothur
mothur "#merge.files(input=${trim_string}, output=../data/seq/CombinedRuns_denoised_contiged.trim.fasta); merge.files(input=${group_string}, output=../data/seq/CombinedRuns_denoised_contiged.groups); unique.seqs(fasta=../data/seq/CombinedRuns_denoised_contiged.trim.fasta)"
