#!/bin/bash
#PBS -k oe
#PBS -m abe
#PBS -o /N/dc2/projects/Tswallow_GLRP/CT/scripts/error_output
#PBS -e /N/dc2/projects/Tswallow_GLRP/CT/scripts/error_output
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Run_Maker_Augustus1
#PBS -l nodes=8:ppn=12,vmem=96gb,walltime=1:00:00:00

##Run_Maker_Augustus1 uses Augustus species from Braker Run6 which has the highest accuracy rate of 72% but lower complete gene number of 472 which is lower than requred 600 

module load maker/2.31.9
module load openmpi/intel/2.1.0

export AUGUSTUS_CONFIG_PATH=/N/u/tsengch/Carbonate/.augustus_config_CT

MAKERDIR="TswallowMaker4_1"
## add augustus training 

cd /N/dc2/projects/Tswallow_GLRP/CT/Tswallow_annotation/maker_work_dir
mpiexec  -n 96 maker -base ${MAKERDIR} -fix_nucleotides
#rm ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
maker -base ${MAKERDIR} -fix_nucleotides -dsindex
gff3_merge  -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
fasta_merge -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
