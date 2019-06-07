#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_run_test
#PBS -l nodes=1:ppn=16,vmem=160gb,walltime=1:00:00

module load star/2.6.1a

cd /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/star_result

STAR --genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index/ \
--runThreadN 16 \
--readFilesIn all.left.fq all.right.fq \
--outFileNamePrefix Renamed_tswallow_contig_ \
--alignIntronMin 10 \
--alignIntronMax 250000 \
--alignMatesGapMax 250000 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard 

