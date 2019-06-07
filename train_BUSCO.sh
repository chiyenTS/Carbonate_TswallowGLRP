#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N train_RunBUSCO
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=2:00:00:00

module load busco

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir
 run_BUSCO.py -i TswallowMaker2.all.maker.transcripts1000.fasta -o TswallowMaker2_BUSCO_maker -l aves_odb9/ \
  -m genome -c 8 --long -sp human -z --augustus_parameters='--progress=true'
