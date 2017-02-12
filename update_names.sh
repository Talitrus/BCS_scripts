#!/bin/bash
#SBATCH -N 1
#SBATCH -t 04:00:00
#SBATCH -J outfile.accnos
#SBATCH -p defq,short
#SBATCH --mail-type=all
#SBATCH --mail-user=bnguyen@gwu.edu
#SBATCH -o out_err_files/outfile_%A_%a.out
#SBATCH -e out_err_files/outfile_%A_%a.err
name1=$(sed -n "$SLURM_ARRAY_TASK_ID"p seq_list.txt)
cd ../data/seq
grep ">" CombinedRuns_denoised_contiged.trim.unique.fasta > FastaHeaders.txt
grep ">" macse.fasta > FastaHeaders.MACSE.txt
sort -d FastaHeaders.txt > FastaHeaders.sorted.txt
sort -d FastaHeaders.MACSE.txt > FastaHeaders.MACSE.sorted.txt
#comm -23 FastaHeaders.sorted.txt FastaHeaders.MACSE.sorted.txt  > outfile.accnos
join -v 2 FastaHeaders.MACSE.sorted.txt FastaHeaders.sorted.txt > outfile.accnos 
sed -ibak -E 's/^>//' outfile.accnos
module load mothur
mothur "#remove.seqs(accnos=outfile.accnos,name=CombinedRuns_denoised_contiged.trim.names,group=CombinedRuns_denoised_contiged.groups)"
