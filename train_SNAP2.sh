#!/bin/bash
#PBS -q debug
#PBS -k oe
#PBS -m abe
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Retrain_SNAP
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=00:59:00

module load maker
cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir/SNAP_training_workdir2
fathom -categorize 1000 genome.ann2 genome.dna
fathom -export 1000 -plus uni.ann uni.dna
forge export.ann export.dna
hmm-assembler.pl TswallowMaker2 . > TswallowMaker2_2.hmm


