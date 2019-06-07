#PBS -k oe
#PBS -m abe
#PBS -o /N/dc2/projects/Tswallow_GLRP/CT/scripts/error_output
#PBS -e /N/dc2/projects/Tswallow_GLRP/CT/scripts/error_output
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Braker_run5
#PBS -l nodes=1:ppn=8,vmem=64gb,walltime=7:00:00:00

## Run5 uses only RNA-Seq data for Braker Run 
## installation of Braker 2.1.2 on carbonate following https://github.com/Gaius-Augustus/BRAKER except for loading augustus 3.3 from module

## load conda_env
module unload python
module load anaconda/python3.6/4.3.1
source activate /N/dc2/projects/Tswallow_GLRP/CT/program/conda_env/braker-env

## load Braker 2.1.2 and GeneMark-ES / ET v.4.38
PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/BRAKER/scripts:/N/dc2/projects/Tswallow_GLRP/CT/program/gm_et_linux_64/gmes_petap:$PATH
export PATH
export GENEMARK_PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/gm_et_linux_64/gmes_petap

## load Augustus 3.3
export PATH=$PATH:/N/dc2/projects/Tswallow_GLRP/CT/program/Augustus/bin:/N/dc2/projects/Tswallow_GLRP/CT/program/Augustus/scripts
export AUGUSTUS_CONFIG_PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/Augustus/config/

## load Bamtools 2.5.1
export BAMTOOLS_PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/bamtools/usr/local/bin

## load NCBI Blast+ 2.6.0+
module load blast/2.6.0+

## load GenomeThreader 1.7.1
export BSSMDIR=/N/dc2/projects/Tswallow_GLRP/CT/program/gth-1.7.1-Linux_x86_64-64bit/bin/bssm
export GTHDATADIR=/N/dc2/projects/Tswallow_GLRP/CT/program/gth-1.7.1-Linux_x86_64-64bit/bin/gthdata
export ALIGNMENT_TOOL_PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/gth-1.7.1-Linux_x86_64-64bit/bin

## load MakeHub
export MAKEHUB_PATH=/N/dc2/projects/Tswallow_GLRP/CT/program/MakeHub

## load Eval
export PATH=$PATH:/N/dc2/projects/Tswallow_GLRP/CT/program/eval-2.2.8

## load samtools 1.9
module load samtools
export SAMTOOLS_PATH=/N/soft/rhel7/samtools/1.9/bin:/N/soft/rhel7/samtools/1.9/htslib-1.9/bin

cd /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/Run5
braker.pl --species=Tachycineta_bicolor_run5 --genome=Renamed_tswallow_contig.fasta \
       --bam=Renamed_tswallow_contig.bam \
       --softmasking --cores=8


