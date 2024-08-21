#!/bin/sh -l
# FILENAME: DANO_kover.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name DANO_KOVER
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

kover dataset create from-tsv --genomic-data /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/DANO/Input/DANO_kmer.tsv --phenotype-description "DANO at breakpoint" --phenotype-metadata /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/DANO/Input/DANO_meta.tsv --output DANO.kover --progress

kover dataset info --dataset DANO.kover --genome-count --kmer-count

kover dataset split --dataset DANO.kover --id DANO_split --train-size 0.666 --folds 20 --random-seed 3 --progress

kover learn scm --dataset DANO.kover --split DANO_split --model-type conjunction disjunction --p 0.0962 0.1129 0.1318 0.2930 0.3116 0.3394 0.3483 0.3830 0.5177 0.6570 0.7220 0.7679 0.8582 0.9398 1.2295 1.3656 1.3765 1.4310 1.5210 1.7164 1.8093 1.8345 1.9173 1.9239 1.9462 --max-rules 10 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log