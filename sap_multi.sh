#!/bin/bash
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH -J sap
#SBATCH -p defq,short
#SBATCH --array=1-197
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/sap_%A_%a.out
#SBATCH -e out_err_files/sap_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p sap_split_files.txt)
cd ../data/seq
module load python/2.7.6
module load clustalw2
module load blast+
sap --database /groups/cbi/bryan/COI_all.fasta --project BCS1_all070_${name1} --minidentity 0.70 -x 80 $name1 --assignment ConstrainedNJ
