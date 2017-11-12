# Author: Jairo Matos and Divino Silverio
# November, 2017
# function to read pdf and export as a csv spreadsheet
# it was criated to work with files from:
#http://www.imea.com.br/imea-site/relatorios-mercado-detalhe?c=4&s=3

PDFtoCSV<- function(pdfFile,page=NULL, overwrite=FALSE) {
  library(tabulizer)
  if(!file.exists('csv')) {
    dir.create('csv')
  }
  if(is.null(page)){
    Npage<-get_n_pages(pdfFile)
    for (page in 1:Npage){
      privatePdfToCsv_page(pdfFile,page,overwrite)
    }  
  }else{
    privatePdfToCsv_page(pdfFile,page,overwrite)
  }
  
}


privatePdfToCsv_page<-function(pdfFile,page,overwrite){
  if(!file.exists( paste('csv/',pdfFile,'-page-',page,'.csv'))|overwrite){
    out<-extract_tables(pdfFile, pages=page,method = "data.frame")
    cat('Create csv from pdf ',pdfFile,', from page ',page,'\n')
    table=out[[1]]
    list=data.frame(n=1)
    j=2
    for(coll in 2:dim(table)[2]){
      if(!all(grepl('[[:digit:]]',table[,coll])==F )){
        list[j,1]=coll
        j=j+1
      } 
    }
    p2=table[,as.vector(list$n)]
    
    for (coll in 2:dim(p2)[2]){
      p2[,coll]=gsub("[,]",".",gsub("[[:space:]]|[.]|[-]|[R$]","",p2[,coll]))
    }
    p2$file=pdfFile
    p2$page=page
    
    write.csv(p2,paste('csv/',pdfFile,'-page-',page,'.csv'))
  }else{
    cat('File on page ',page,' exists, and override this disabled\n')
  }
}