#!/bin/bash
#SBATCH -N 1
#SBATCH -t 02:00:00
#SBATCH -J MACSE
#SBATCH -p defq,short 
#SBATCH --array=1-58
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/macse_export_%A_%a.out
#SBATCH -e out_err_files/macse_export_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p split_files.txt)
cd ../data/seq
module load jdk
module load macse
java -Xmx512m -jar /groups/cbi/shared/apps/macse/1.2/macse_v1.2.jar -prog enrichAlignment -seq BIOCODE2014_MACSE_313.fasta -align BIOCODE2014_MACSE_313.fasta -seq_lr ${name1} -maxFS_inSeq 0 -maxSTOP_inSeq 0 -maxINS_inSeq 0 -maxDEL_inSeq 0 -gc_def 5 -fs_lr -10 -stop_lr -10 -out_NT ${name1}_NT -out_AA ${name1}_AA -seqToAdd_logFile ${name1}_log.csv
