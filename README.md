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
```
###BFC.sh
Run BFC to denoise.

###eestats2.sh
Use this to check the read quality by basepair.

###trunc.sh
Use this to truncate reads if the ends are low quality.

###usearch.sh

