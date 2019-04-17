# zscore transformation of gene expression data 
ls(data)
n=ncol(data)
output=matrix(data=NA,6)

i=2
for (i in 2:n){
  number=data[,i:i]
  zscore=(number-mean(number))/sd(number)
  output=cbind(output,zscore)
}
write.csv(output,"D:/demo/zscore.csv")

#Plot differentially expressed genes
library("pheatmap")
data=read.delim("D:/demo/demo.txt",head=T,sep="\t")
data2=data[,2:ncol(data)]
row.names(data2)=data[,1:1]
pheatmap(data2,cluster_cols=TRUE,cellwidth=25,colorRampPalette(c("green","black","red"))(50))


















