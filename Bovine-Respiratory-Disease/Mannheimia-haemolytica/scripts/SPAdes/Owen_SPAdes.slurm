#!/bin/sh -l
#FILENAME: Owen_SPAdes.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=24:00:00
#SBATCH --job-name Owen_SPAdes
#SBATCH --mail-type=abort,begin,end

#change directory to where job was submitted
cd $SLURM_SUBMIT_DIR

#load modules
ml bioinfo
ml spades/3.13.0

sh Owen_individual.sh