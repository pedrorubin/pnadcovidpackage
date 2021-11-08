#' Calcular a população
#'
#' Calcular a população
#' @param df_pnad_covid O dataframe com os dados da PNAD COVID (ver ler_pnad_covid)
#' @return Um dataframe com 2 colunas: mês e o total da população
#' @examples calcular_populacao(dados_pnad_covid)
#' @seealso ler_pnad_covid
#' @export





calcular_populacao <- function(df_pnad){


  df_pnad %>%
    summarise(mes = unique(V1013),
              total = sum(V1032))

}
