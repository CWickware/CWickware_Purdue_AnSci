#The only library we will need is tidyverse
library(tidyverse)

#clear environment
rm(list = ls ())

#set working directory
setwd("~/Documents/PurdueLabStuff/Collaborations/BRD/Resistance/MachineLearning/MannheimiaGenomes/Assembly/ARG_Annotation/CARD/CARD_output/ARG_only")
#read in file
ARG_list <- read.delim("MH_Rsort.txt", header = FALSE, sep = "\t", stringsAsFactors = FALSE)

#save unique ARGs as vector
ARG_noID <- ARG_list[,-1]
ARG_unique <- unique(unlist(ARG_noID))
ARG_unique <- ARG_unique[!ARG_unique %in% ""]

#save isolates names as vector
ARG_onlyID <- ARG_list[,1]

#make empty dataframe with columns as ARGs and rows as isolates
ARG_table <- data.frame(matrix(nrow = length(ARG_onlyID), ncol = length(ARG_unique)))
colnames(ARG_table) <- as.character(ARG_unique)
rownames(ARG_table) <- as.character(ARG_onlyID)
#Check
head(ARG_table)

#variable for loop
c <- 1

while(c < 1+length(ARG_unique)){ #loop for every unique ARG found
  print(ARG_unique[c]) #print to check which ARG is being checked
  for (r in 1:nrow(ARG_list)){ #loop for every isolate
    ARGu <- ARG_unique[c] #variable for current ARG
    ARGi <- ARG_onlyID[r] #variable for current isolate
    if (ARG_unique[c] %in% ARG_noID[r,]){ #conditional section for recording isolate-ARG combination
      print("ARG found") #prints if ARG is found on isolate line
      ARG_table[ARGi,ARGu] <- "+" #records "+" in isolate-ARG cell
      } else { #condition if ARG not found in isolate
        ARG_table[ARGi,ARGu] <- "-"  #records "-" in isolate-ARG cell
      }
  }  
  c<-c+1 #increase c for next ARG
}

#save file
write.table(ARG_table, file = "~/Documents/PurdueLabStuff/Collaborations/BRD/Resistance/MachineLearning/MannheimiaGenomes/Assembly/ARG_Annotation/CARD/CARD_output/ARG_only/MH_ARG_final_unsort.tsv", sep = "\t", quote = FALSE, row.names = TRUE)


