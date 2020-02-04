#install.packages("rentrez")

library(rentrez)

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
  
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
head(Bburg)

Sequences <- strsplit(Bburg, '\n\n')
print(Sequences)

Sequences <- unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
seq <- gsub("\n","", seq)

Sequences<-data.frame(Name=header,Sequence=seq)


write.csv(Sequences, file = "Sequences.csv")
