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

kover dataset split --dataset TILM.kover --id TILM_split --train-size 0.666 --folds 5 --random-seed 9 --progress

kover learn scm --dataset TILM.kover --split TILM_split --model-type conjunction disjunction --p 0.1 0.178 0.316 0.562 1.0 1.778 3.162 5.623 10.0 --max-rules 5 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log