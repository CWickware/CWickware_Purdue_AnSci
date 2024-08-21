#!/bin/sh -l
#FILENAME: CARD.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=10:00:00
#SBATCH --job-name CARD
#SBATCH --mail-type=abort,begin,end

#change directory to where job was submitted
cd $SLURM_SUBMIT_DIR

#Get latest version of CARD database
#Make sure the json file is in the correct directory 
wget https://card.mcmaster.ca/latest/data
tar -xvf data ./card.json

#load modules
ml purge; ml bioinfo rgi

#load rgi database locally through json file downloaded in previous step
rgi load --card_json card.json --local

#run commands
for asm in /scratch/bell/clwickwa/BRD_Working/MH_genomes/Assemblies/contigs/Testing/*fasta
do
	rgi main --input_sequence $asm \
  --output_file ${asm/_contigs.}_card.out --input_type contig -d wgs --local \
  --exclude_nudge --clean
done
