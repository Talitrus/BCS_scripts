#!/bin/bash
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -J final_otu
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/final_%A_%a.out
#SBATCH -e out_err_files/final_%A_%a.err
cd ../data/seq
module load mothur
mothur "#count.seqs(name=macse.precluster.pick.pick.redundant_CROP.cluster.list,group=macse.precluster.pick.pick.redundant.groups)"
