#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N train_SNAP
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=3:00:00:00

module load maker/2.31.9

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir/SNAP_training_workdir
maker2zff TswallowMaker2.all.gff
fathom genome.ann genome.dna -validate > snap_validate_output.txt
fathom -categorize 1000 genome.ann genome.dna
fathom -export 1000 -plus uni.ann uni.dna
forge export.ann export.dna
hmm-assembler.pl TswallowMaker2 . > TswallowMaker2.hmm
