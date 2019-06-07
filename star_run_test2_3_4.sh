#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_run_test_parameter
#PBS -l nodes=1:ppn=16,vmem=96gb,walltime=8:00:00

module load star/2.6.1a

cd /N/dc2/projects/Tswallow_GLRP/CT/Braker_annotation/star_work_dir/star_parameter_test

## test 2 is to test of reducing filter score from 0.66 to 0.3 
STAR --genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix star_test2_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--outFilterScoreMinOverLread 0.3 \
--outFilterMatchNminOverLread 0.3

## test 3 is to test of reducing alignIntronMin from 10 to 3
STAR --genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix star_test3_ \
--alignIntronMin 3 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard

## test 4 is to test of reducing filter score from 0.66 to 0.3 and test of reducing alignIntronMin from 10 to 3 both
STAR --genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix star_test4_ \
--alignIntronMin 3 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--outFilterScoreMinOverLread 0.3 \
--outFilterMatchNminOverLread 0.3

