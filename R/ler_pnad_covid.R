#' Carregar os microdados da PNAD COVID
#'
#' Carregar (para o R) os microdados da PNAD COVID
#' @param mes Mês da PNAD COVID (número)
#' @param caminho_pnadcovid A pasta na qual os arquivos de microdados estão guardados (em geral a mesma utilizada na função baixar_pnad_covid)
#' @return Um dataframe com todos os microdados
#' @examples ler_pnad_covid(7, "./pasta_microdados");
#' @seealso baixar_pnad_covid
#' @export

ler_pnad_covid <- function(mes){
  mes <- as.character(mes)
  mes <- str_pad(mes, 2, "left", "0")

  pnad <- glue("./dados/PNAD_COVID_{mes}2020.csv")

  pnad_covid <- read_csv(as.character(pnad),
                         col_types = cols(.default = "c")) %>%
    mutate(ID_dom = str_c(UPA,V1008),
           id = str_c(Ano,V1013,UF)) %>%
    mutate(across(.fns = as.numeric))

  deflatores <- deflatores %>%
    filter(MES == mes) %>%
    mutate(id = as.numeric(str_c(Ano,MES,UF))) %>%
    select(id,Habitual,Efetivo)

  pnad <- pnad_covid %>%
    left_join(deflatores, by = "id")


}
