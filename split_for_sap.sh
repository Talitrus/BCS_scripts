#!/bin/bash
#SBATCH -N 1
#SBATCH -t 00:30:00
#SBATCH -J split_sap
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/sap_split_%A_%a.out
#SBATCH -e out_err_files/sap_split_%A_%a.err
cd ../data/seq
split -l 50 macse.precluster.pick.pick.redundant_CROP.cluster.fasta sap_split_
ls sap_split_* > ../../scripts/sap_split_files.txt
