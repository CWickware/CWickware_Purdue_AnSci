#!/bin/sh -l
# FILENAME: TILM_kover.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name TILM_KOVER
#SBATCH --mail-type=abort,begin,end


#change directory to where job was submitted
cd $SLURM_SUBMIT_DIR

#load modules
ml bioinfo
ml kover

#log time before start
echo "start KOVER" >> log
date >> log

#run commands

kover dataset create from-tsv --genomic-data /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TILM/Input/TILM_kmer.tsv --phenotype-description "TILM at breakpoint" --phenotype-metadata /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TILM/Input/TILM_meta.tsv --output TILM.kover --progress

kover dataset info --dataset TILM.kover --genome-count --kmer-count

kover dataset split --dataset TILM.kover --id TILM_split --train-size 0.666 --folds 20 --random-seed 3 --progress

kover learn cart --dataset TILM.kover --split TILM_split --class-importance 0.25 0.5 0.75 1.0 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log