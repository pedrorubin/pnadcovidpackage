#' Baixa e descompacta os microdados da PNAD COVID
#'
#' Baixa e descompacta os microdados da PNAD COVID (é preciso acesso a internet)
#' @param ano Mês da PNAD COVID (número)
#' @param caminho_pasta A pasta (o caminho para a pasta) na qual os arquivos serão guardados (se não existir, a pasta será criada)
#' @return Os arquivos de microdados (txt) na pasta designada
#' @examples baixar_pnad_covid(mes = 5, caminho_pasta = "./microdata");
#' @export


baixar_pnad_covid <- function(mes, caminho_pasta){

  mes <- as.character(mes)
  mes <- str_pad(mes, 2, "left", "0")

  if(mes == "05"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_052020.zip"
  }
  else if(mes == "06"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_062020.zip"
  }
  else if(mes == "07"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_072020.zip"
  }
  else if(mes == "08"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_082020.zip"
  }
  else if(mes == "09"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_092020.zip"
  }
  else if(mes == "10"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_102020.zip"
  }
  else if(mes == "11"){
    url <- "https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Dados/PNAD_COVID_112020.zip"
  }

  tempFile <- tempfile()

  download.file(url,tempFile,quiet=TRUE,mode="wb")

  unzip(file.path(tempFile), exdir = caminho_pasta)

}


