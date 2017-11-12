
# functions to install the required packages
#if (!require("ghit")) {
#  install.packages("ghit")
#}
# on 64-bit Windows
#ghit::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch")
# elsewhere
#ghit::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))


# read pdf and export to csv
#setwd("E:\\teste_pdf_marcia/milho")
setwd("D:\\Dropbox (DadosTanguro)\\colaboracoes\\Marcia\\teste_pdf_marcia\\milho")

pdf=list.files(pattern = '*.pdf')



for(i in 1:length(pdf)){
  cat('\n ',pdf[i],'numero ',i,'\n')
  PDFtoCSV(pdf[i])
}


head(p2)


View(p2)
dir()
xx=read.csv("23102017170006-1.csv")
View(xx)
head(xx,10)
dim(xx)
names(xx)

for(i in 1: length(out)){
  final <- do.call(rbind, out[i])
  
}
##########Area de teste de ideia ############
setwd("C:/Users/Jairo Matos Rocha/Desktop")
dir()
p1=read.csv()



xx=data.frame(n=1:10,vf=c(rep("v",5),rep("f",5)))
x2=subset(xx,vf=="v")
vec=as.vector(paste0(x2$n,collapse = ","))
c(vec)
as.vector(x2$n)

t1=table[,as.vector(x2$n)]
dim(table)
dim(t1)
