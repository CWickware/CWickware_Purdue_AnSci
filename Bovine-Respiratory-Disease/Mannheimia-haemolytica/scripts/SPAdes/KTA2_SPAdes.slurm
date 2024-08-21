#!/bin/sh -l
#FILENAME: KTA2_SPAdes.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=24:00:00
#SBATCH --job-name KTA2_SPAdes
#SBATCH --mail-type=abort,begin,end

#change directory to where job was submitted
cd $SLURM_SUBMIT_DIR

#load modules
ml bioinfo
ml spades/3.13.0

sh KTA2_individual.sh