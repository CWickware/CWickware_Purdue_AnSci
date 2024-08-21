#!/bin/sh -l
# FILENAME: TULA_kover.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name TULA_KOVER
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

kover dataset create from-tsv --genomic-data Input/TULA_kmer.tsv --phenotype-description "TULA at breakpoint" --phenotype-metadata Input/TULA_meta.tsv --output TULA.kover --progress

kover dataset info --dataset TULA.kover --genome-count --kmer-count

kover dataset split --dataset TULA.kover --id TULA_split --train-size 0.666 --folds 10 --random-seed 3 --progress

kover learn scm --dataset TULA.kover --split TULA_split --model-type conjunction disjunction --p 0.1 0.178 0.316 0.562 1.0 1.778 3.162 5.623 10.0 --max-rules 10 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log