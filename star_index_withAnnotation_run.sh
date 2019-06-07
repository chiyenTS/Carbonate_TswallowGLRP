#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_index_addAnnotation
#PBS -l nodes=1:ppn=6,vmem=64gb,walltime=8:00:00

## Star_index_test1 add TswallowMaker3.all.gff from maker2 output (after training with SNAP)  annotation file in generating index

module load star/2.6.1a

cd /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir

STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig_index_withAnnotation \
--genomeFastaFiles /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_tswallow_contig.fasta \
--sjdbGTFfile /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/TswallowMaker3.all.gff \
--sjdbGTFtagExonParentTranscript Parent


