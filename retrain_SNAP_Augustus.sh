#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N retrain_SNAP_Augustus
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=4:00:00

## using TswallowMaker4_2.all.gff results after MakerRun4 (Augustus predictor) and retrain SNAP ; TESTRUN 

module load maker/2.31.9

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir/SNAP_retrain_augustus_trialRUN
maker2zff TswallowMaker4_2.all.gff
fathom genome.ann genome.dna -validate > snap_validate_output.txt
fathom -categorize 1000 genome.ann genome.dna
fathom -export 1000 -plus uni.ann uni.dna
forge export.ann export.dna
hmm-assembler.pl TswallowMaker4 . > TswallowMaker4.hmm
