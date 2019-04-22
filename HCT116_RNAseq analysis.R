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

#plot pathway annotation
library("ggplot2")
data=read.delim("D:/demo/demo.txt",head=T,sep="\t")
ls(data)
data$Gene.Set.Name=factor(data$Gene.Set.Name,levels=data$Gene.Set.Name)
p=ggplot(data,aes(x=Gene.Set.Name,y=overlap,size=log10q,color=group))+theme_bw()+geom_point()+coord_flip()
pp=p+ylim(-0.3,0.3)
pp+theme(axis.text.x=element_blank(),axis.text.y=element_blank(),axis.title.x=element_blank(),axis.title.y=element_blank(),axis.ticks.x=element_blank(),axis.ticks.y=element_blank())

###plot x1 & x2
library("ggplot2")
data=read.delim("D:/demo/demo.txt",head=T,sep="\t")
ls(data)
p=ggplot(data,aes(x=value_1,y=value_2,color=group))+geom_point(size=2)+theme_bw()
pp=p+scale_x_continuous(trans='log10')+scale_y_continuous(trans='log10')
pp+geom_abline(intercept=0,slope=1)
















