#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N retrain_SNAP
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=4:00:00

## using TswallowMaker3.all.gff results after MakerRun2 (SNAP predictor) and retrain SNAP, suggested by Bhavya

module load maker/2.31.9

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir/SNAP_retraining_workdir
maker2zff TswallowMaker3.all.gff
fathom genome.ann genome.dna -validate > snap_validate_output.txt
fathom -categorize 1000 genome.ann genome.dna
fathom -export 1000 -plus uni.ann uni.dna
forge export.ann export.dna
hmm-assembler.pl TswallowMaker3 . > TswallowMaker3.hmm

