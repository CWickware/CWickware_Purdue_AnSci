#!/bin/sh -l
# FILENAME: TET_kover.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name TET_KOVER
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

kover dataset create from-tsv --genomic-data /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TET/Input/TET_kmer.tsv --phenotype-description "TET at breakpoint" --phenotype-metadata /scratch/bell/clwickwa/BRD_Working/MannheimiaGenomes/KOVER/ABX/TET/Input/TET_meta.tsv --output TET.kover --progress

kover dataset info --dataset TET.kover --genome-count --kmer-count

kover dataset split --dataset TET.kover --id TET_split --train-size 0.666 --folds 20 --random-seed 3 --progress

kover learn scm --dataset TET.kover --split TET_split --model-type conjunction disjunction --p 0.2044 0.2055 0.2759 0.2910 0.2950 0.2970 0.3156 0.3256 0.4392 0.5045 0.5436 0.5637 0.5652 0.6105 0.7476 0.7741 0.8040 0.8247 0.8328 0.8578 0.8782 0.9371 0.9445 0.9497 0.9555 --max-rules 10 --hp-choice cv --n-cpu 2 --progress

#log end time
echo "end KOVER" >> log
date >> log