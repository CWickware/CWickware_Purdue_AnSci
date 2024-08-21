#!/bin/sh -l
# FILENAME: TILDIP_kover.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name TILDIP_KOVER
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

kover dataset create from-tsv --genomic-data /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TILDIP/Input/TILDIP_kmer.tsv --phenotype-description "TILDIP at breakpoint" --phenotype-metadata /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TILDIP/Input/TILDIP_meta.tsv --output TILDIP.kover --progress

kover dataset info --dataset TILDIP.kover --genome-count --kmer-count

kover dataset split --dataset TILDIP.kover --id TILDIP_split --train-size 0.666 --folds 20 --random-seed 3 --progress

kover learn scm --dataset TILDIP.kover --split TILDIP_split --model-type conjunction disjunction --p 1.0824 1.0873 1.1298 1.1821 1.2148 1.3416 1.3847 1.4186 1.4924 1.5481 1.5509 1.6683 1.7707 1.8063 1.8722 1.9358 2.0056 2.0814 2.0877 2.1066 2.2066 2.2260 2.2990 2.3956 2.4277 --max-rules 10 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log