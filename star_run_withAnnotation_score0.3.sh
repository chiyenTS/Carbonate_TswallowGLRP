#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_run_withannotation_score0.3
#PBS -l nodes=1:ppn=16,vmem=64gb,walltime=3:00:00

module load star/2.6.1a

## Run star with the left and right from about 10 birds and then using score 0.3 for filtering   

cd /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/ARC_star_result

STAR --genomeDir /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index_withAnnotation/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix Renamed_tswallow_contig_withAnnotation_score0.3_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--outFilterScoreMinOverLread 0.3 \
--outFilterMatchNminOverLread 0.3

