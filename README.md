#BCS1 COI pipeline
These scripts are built to run on a server with SLURM.

##Script run order
```bash
BFC.sh
(trunc.sh)
usearch.sh
mothur_trim.sh
mothur_merge.sh <-> merge_split.sh
MACSE_align.sh <-> mACSE_align_split.sh
update_names.sh
```
###BFC.sh
Run BFC to denoise.

###eestats2.sh
Use this to check the read quality by basepair.

###trunc.sh
Use this to truncate reads if the ends are low quality.

###usearch.sh

###mothur\_trim.sh

###merge\_split.sh

###mACSE\_align\_split.sh

###update\_names.sh
Removes sequence labels that are no longer in the aligned FASTA file. This step preps for removal in MOTHUR.
