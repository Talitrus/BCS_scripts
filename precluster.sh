#!/bin/bash
#SBATCH -N 1
#SBATCH -t 04:00:00
#SBATCH -J precluster
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/precluster_%A_%a.out
#SBATCH -e out_err_files/precluster_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list.txt)
cd ../data/seq
module load mothur
mothur "#count.seqs(name=CombinedRuns_denoised_contiged.trim.pick.names, group=CombinedRuns_denoised_contiged.pick.groups); pre.cluster(fasta=macse.fasta,count=CombinedRuns_denoised_contiged.pick.count_table,diffs=3); chimera.uchime(fasta=macse.precluster.fasta,count=macse.precluster.count_table); split.abund(fasta=macse.precluster.pick.fasta,count=macse.precluster.pick.count_table, cutoff=1,accnos=true); remove.seqs(accnos=rare.accnos,fasta=macse.precluster.pick.fasta,count=macse.precluster.pick.count_table)"
