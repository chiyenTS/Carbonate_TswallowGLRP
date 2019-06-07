#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_run3
#PBS -l nodes=1:ppn=16,vmem=96gb,walltime=10:00:00

module load star/2.6.1a

## Run star with the digitalnormalizatoin result and try decrease score too for Braker input. 

cd /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/ARC_star_result2

STAR --genomeDir /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index_withAnnotation/ \
--runThreadN 16 \
--readFilesIn left.fq right.fq \
--outFileNamePrefix Renamed_tswallow_contig_withAnnotation_plusDigitalnormalization_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard 

STAR --genomeDir /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index_withAnnotation/ \
--runThreadN 16 \
--readFilesIn left.fq right.fq \
--outFileNamePrefix Renamed_tswallow_contig_withAnnotation_plusDigitalnormalization_score0.3_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--outFilterScoreMinOverLread 0.3 \
--outFilterMatchNminOverLread 0.3

