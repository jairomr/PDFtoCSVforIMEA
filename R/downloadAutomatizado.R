
getPDF<-function(file){
  url<-paste('http://www.imea.com.br/upload/publicacoes/arquivos/',file,sep = '')
  cat('Baixando ',file,'\n')
  download.file(url,file)
  cat('COMPLETO\n')
}

numeroDePagina<-function(categoria){
  library("rjson")
  json_file <-paste('http://www.imea.com.br/imea-site/relatorios-mercado-detalhe/buscarPublicacoes?categoria=',categoria,'&subcategoria=3&page=1',sep = '')
  json_data <- fromJSON(file=json_file)
  return(1+(floor(as.numeric(json_data$data$rows_total)/16)))
}

getAllPDFbyCategoria <- function(categoria) {
  library("rjson")
  for (i in 1:numeroDePagina(categoria)){
    json_file <-paste('http://www.imea.com.br/imea-site/relatorios-mercado-detalhe/buscarPublicacoes?categoria=',as.character(categoria),'&subcategoria=3&page=',as.character(i),sep = '')
    json_data <- fromJSON(file=json_file)
    cat(json_file,'\n')
    for (row in 1:length(json_data$data$rows)){
      file=json_data$data$rows[[row]]$arquivo
      if (!file.exists(file)) {
        getPDF(file)
      }
    } 
  } 
}