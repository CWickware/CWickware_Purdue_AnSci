#!/bin/sh -l
#FILENAME: CARD_parse.slurm

#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=24:00:00
#SBATCH --job-name CARD_parse
#SBATCH --mail-type=abort,end,begin

#change directory to where job was submitted

cd $SLURM_SUBMIT_DIR

for file in ../textfiles/*.txt; do awk '{print $2 "," $9 "," $11 "," $15 "," $16 "," $17 "," $21}' FS='\t' $file > ../CARD_abbrev/${file%*_contigs.*txt}_CARDabbrev.txt; done