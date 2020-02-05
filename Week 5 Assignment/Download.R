#install.packages("rentrez")

library(rentrez)
# rentrez library allows the user to search for and download data from the NCBI database

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
# ncbi_ids is a string containing three sequences downloaded from the NCBI database
  
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
# Bburg is a data fram containing the three DNA sequneces from the database "nuccore"
# The three sequences are inputted in the id argument as the string above "ncbi_ids"
# rettype is arguing which format to get the data as

head(Bburg)

Sequences <- strsplit(Bburg, '\n\n')
# strsplit is used to split the characters in bburg intot the three seperate sequences

print(Sequences)

Sequences <- unlist(Sequences)
# the character Sequences is initially in a list and and we want to remove it from a list and convert them into three seperate entities in a data frame

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
seq <- gsub("\n","", seq)
Sequences<-data.frame(Name=header,Sequence=seq)
# above lines seperate the sequence from the sequence ID and header information and recombine them as two seperate entities in the data frame

write.csv(Sequences, file = "Sequences.csv")
