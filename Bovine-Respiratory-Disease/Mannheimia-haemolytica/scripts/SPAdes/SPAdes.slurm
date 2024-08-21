#this is from Carmen#

#!/bin/sh -l
#FILENAME: SPAdes_test.slurm
#SBATCH -A john2185
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=02:00:00
#SBATCH --job-name BRDPractice_SPAdes
#SBATCH --mail-type=abort,begin,end
#change directory to where job was submitted
cd $SLURM_SUBMIT_DIR
#load modules
ml bioinfo
ml spades/3.13.0

spades.py -o PM_SPAdes_SRR5133040_out -1 TrimmedSeqs/SRR5133040.1_1_P.fastq -2 TrimmedSeqs/SRR5133040.1_2_P.fastq -s TrimmedSeqs/SRR5133040.1_1_U.fastq -s TrimmedSeqs/SRR5133040.1_2_U.fastq

spades.py -o PM_SPAdes_SRR5133044_out -1 TrimmedSeqs/SRR5133044.1_1_P.fastq -2 TrimmedSeqs/SRR5133044.1_2_P.fastq -s TrimmedSeqs/SRR5133044.1_1_U.fastq -s TrimmedSeqs/SRR5133044.1_2_U.fastq

spades.py -o PM_SPAdes_SRR5133086_out -1 TrimmedSeqs/SRR5133086.1_1_P.fastq -2 TrimmedSeqs/SRR5133086.1_2_P.fastq -s TrimmedSeqs/SRR5133086.1_1_U.fastq -s TrimmedSeqs/SRR5133086.1_2_U.fastq

spades.py -o PM_SPAdes_SRR5133109_out -1 TrimmedSeqs/SRR5133109.1_1_P.fastq -2 TrimmedSeqs/SRR5133109.1_2_P.fastq -s TrimmedSeqs/SRR5133109.1_1_U.fastq -s TrimmedSeqs/SRR5133109.1_2_U.fastq
         