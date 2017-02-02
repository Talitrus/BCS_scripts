#!/bin/bash
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH -J MACSE
#SBATCH -p short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/macse_align_%A_%a.out
#SBATCH -e out_err_files/macse_align_%A_%a.err
name1=CombinedRuns
cd ../data/seq
module load jdk
module load macse
java -Xmx16g -jar /groups/cbi/shared/apps/macse/1.2/macse_v1.2.jar -prog enrichAlignment -seq BIOCODE2014_MACSE_313.fasta -align BIOCODE2014_MACSE_313.fasta -seq_lr ${name1}_denoised_contiged.trim.unique.fasta -maxFS_inSeq 0 -maxSTOP_inSeq 0 -maxINS_inSeq 0 -maxDEL_inSeq 0 -gc_def 5 -fs_lr -10 -stop_lr -10 -out_NT ${name1}_NT -out_AA ${name1}_AA -seqToAdd_logFile ${name1}_log.csv
