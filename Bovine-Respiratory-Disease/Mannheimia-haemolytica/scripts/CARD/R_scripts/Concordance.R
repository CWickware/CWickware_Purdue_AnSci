#The only library we will need is tidyverse
library(tidyverse)

#clear environment
rm(list = ls ())

#set working directory
setwd("~/Documents/PurdueLabStuff/Collaborations/BRD/Resistance/MachineLearning/Multispecies/ARG_annotation/Owen/ARG_Contig_Info")

#read in files
ARG_profile <- read.delim("ARG_Rsort.txt", header = TRUE, stringsAsFactors = FALSE, sep = "\t")
AST_profile <- read.delim("AST_Rsort.txt", header = TRUE, stringsAsFactors = FALSE, sep = "\t")
ARG_class <- read.delim("ARG_Classes.txt", header = FALSE, stringsAsFactors = FALSE, sep = "\t")
AST_class <- read.delim("AST_Classes.txt", header = FALSE, stringsAsFactors = FALSE, sep = "\t")

#manipulate files for ease in later steps
ARG_profile[ARG_profile == "+"] <- "1"
ARG_profile[ARG_profile == "-"] <- "0"

#Change MICs to breakpoint interpretations (no intermediate)
AST_profile$Gentamicin <- if_else(AST_profile$Gentamicin > 4000, "R", "S")
AST_profile$Neomycin <- if_else(AST_profile$Neomycin > 8000, "R", "S")
AST_profile$Spectinomycin <- if_else(AST_profile$Spectinomycin > 32000, "R", "S")
AST_profile$Ampicillin <- if_else(AST_profile$Ampicillin > 1000, "R", "S")
AST_profile$Ceftiofur <- if_else(AST_profile$Ceftiofur > 4000, "R", "S")
AST_profile$Penicillin <- if_else(AST_profile$Penicillin > 500, "R", "S")
AST_profile$Danofloxacin <- if_else(AST_profile$Danofloxacin > 250, "R", "S")
AST_profile$Enrofloxacin <- if_else(AST_profile$Enrofloxacin > 1000, "R", "S")
AST_profile$Clindamycin <- if_else(AST_profile$Clindamycin > 2000, "R", "S")
AST_profile$Tilmicosin <- if_else(AST_profile$Tilmicosin > 8000, "R", "S")
AST_profile$Tulathromycin <- if_else(AST_profile$Tulathromycin > 32000, "R", "S")
AST_profile$Tylosin.tartrate <- if_else(AST_profile$Tylosin.tartrate > 16000, "R", "S")
AST_profile$Florfenicol <- if_else(AST_profile$Florfenicol > 4000, "R", "S")
AST_profile$Tiamulin <- if_else(AST_profile$Tiamulin > 16000, "R", "S")
AST_profile$Sulfadimethoxine <- if_else(AST_profile$Sulfadimethoxine > 256000, "R", "S")
AST_profile$Trimeth.sulfa <- if_else(AST_profile$Trimeth.sulfa > 2000, "R", "S")

r <-1
for(r in 1:nrow(ARG_class)){
  temp <- subset(ARG_class[r,])
  temp_class <- temp[1]
  temp_levels <-factor(temp_class, levels = temp[c(2:ncol(temp))])
  if(exists(ARG_levels)){
    ARG_levels <- 
  }
  
}
factor(ARG_class[1], levels = ARG_class)


c <- 1
for(a in 1:nrow()){
  
}
