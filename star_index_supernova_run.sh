#PBS -k oe
#PBS -m abe 
#PBS -o /N/u/tsengch/Carbonate/CT/scripts/error_output
#PBS -e /N/u/tsengch/Carbonate/CT/scripts/error_output 
#PBS -M chi-yen_tseng@baylor.edu
#PBS -N Star_index_supernova
#PBS -l nodes=1:ppn=6,vmem=72gb,walltime=6:00:00


module load star/2.6.1a

cd /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir

STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_supernova_tswallow_contig_index \
--genomeFastaFiles /N/u/tsengch/Carbonate/CT/Braker_annotation/star_work_dir/Renamed_supernova_tswallow_contig.fasta
