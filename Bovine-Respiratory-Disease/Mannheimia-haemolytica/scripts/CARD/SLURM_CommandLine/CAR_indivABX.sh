#!/bin/sh -l
#FILENAME: CARD_indivABX.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=24:00:00
#SBATCH --job-name CARD_indivABX_search
#SBATCH --mail-type=abort,end,begin

#change directory to where job was submitted

cd $SLURM_SUBMIT_DIR

cat CARD_ABX_subset.txt