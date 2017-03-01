#!/bin/bash
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH -J sap
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/sap_%A_%a.out
#SBATCH -e out_err_files/sap_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list.txt)
cd ../data/seq
module load python/2.7.6
module load clustalw2
module load blast+
sap --database /groups/cbi/bryan/COI_all.fasta --project BCS1_all2 macse.precluster.pick.pick.redundant_CROP.cluster.fasta
