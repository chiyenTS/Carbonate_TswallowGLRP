#PBS -k oe
#PBS -m abe 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Repeat_Library_Construction
#PBS -l nodes=1:ppn=16,vmem=32gb,walltime=05:00:00:00

cd /N/u/tsengch/Carbonate/Tswallow_GLRP/CT/Tswallow_annotation/work_dir_2

module load repeatmodeler/1.0.10
BuildDatabase -name tswallow0db -engine ncbi tswallow.contig.fa
nohup RepeatModeler -database tswallow0db >& tswallow.out


