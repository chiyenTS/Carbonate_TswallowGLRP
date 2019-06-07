#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_run
#PBS -l nodes=1:ppn=16,vmem=96gb,walltime=8:00:00

module load star/2.6.1a

## Run star with the digitalnormalizatoin result and try decrease score too for Braker input. 

cd /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/ARC_star_result

STAR --genomeDir /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index_withAnnotation/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix Renamed_tswallow_contig_withAnnotation_plusDigitalnormalization_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard
