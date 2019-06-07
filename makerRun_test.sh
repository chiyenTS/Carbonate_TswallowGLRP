#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Run_Maker
#PBS -l nodes=2:ppn=4,walltime=00:30:00

module load maker/2.31.9
module load openmpi/intel/2.1.0
MAKERDIR="TswallowMaker_test"

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir
mpiexec  -n 8 maker -base ${MAKERDIR} -fix_nucleotides
#rm ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
maker -base ${MAKERDIR} -fix_nucleotides -dsindex
gff3_merge  -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
fasta_merge -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
