library(tidyverse)

# CARREGANDO OS DADOS DE OUTROS RENDIMENTOS POR INDIVIDUO
outros_rendimentos = readRDS('DADOS - IBGE/OUTROS_RENDIMENTOS.rds')

# FILTRANDO ABONO
outros_rendimentos=outros_rendimentos %>%
  filter(V9001 == 5500901)

# PESSOAS QUE RECEBEM ABONO
sum(outros_rendimentos$PESO_FINAL) # 2235089

# ABONO POR UNIDADE DE CONSUMO
outros_rendimentos_uc=outros_rendimentos %>% 
  distinct(UF, ESTRATO_POF, TIPO_SITUACAO_REG, COD_UPA, NUM_DOM, NUM_UC, PESO_FINAL, .keep_all = TRUE)

sum(outros_rendimentos_uc$PESO_FINAL) #2075308

# REGIOES
norte = c(11:17)
nordeste = c(21:29)
sudeste = c(31,32,33,35)
sul = c(41:43)
centro_oeste = c(50:53)

norte_abono = outros_rendimentos_uc%>%
  filter(UF %in% norte)
sum(norte_abono$PESO_FINAL) #39544.98

nordeste_abono = outros_rendimentos_uc%>%
  filter(UF %in% nordeste)
sum(nordeste_abono$PESO_FINAL) #342839.9

sudeste_abono = outros_rendimentos_uc%>%
  filter(UF %in% sudeste)
sum(sudeste_abono$PESO_FINAL) #1222875

sul_abono = outros_rendimentos_uc%>%
  filter(UF %in% sul)
sum(sul_abono$PESO_FINAL) #279913.4

centro_oeste_abono = outros_rendimentos_uc%>%
  filter(UF %in% centro_oeste)
sum(centro_oeste_abono$PESO_FINAL) #190135.1

############ TOTAL DE DOMICILIOS

morador_uc <- 
  unique( 
    readRDS( 
      "Dados - IBGE/MORADOR.rds" 
    ) [ ,
        c( "UF","ESTRATO_POF","TIPO_SITUACAO_REG","COD_UPA","NUM_DOM","NUM_UC",
           "PESO_FINAL"
        ) # Apenas vari?veis com informa??es das UC's no arquivo "MORADOR.rds"
    ] ) # Apenas um registro por UC
sum( morador_uc$PESO_FINAL )


morador_uc_norte = morador_uc %>%
  filter(UF %in% norte)
sum(morador_uc_norte$PESO_FINAL) #5015651

morador_uc_nordeste = morador_uc %>%
  filter(UF %in% nordeste)
sum(morador_uc_nordeste$PESO_FINAL) #17874197

morador_uc_sudeste = morador_uc %>%
  filter(UF %in% sudeste)
sum(morador_uc_sudeste$PESO_FINAL) #30127752

morador_uc_sul = morador_uc %>%
  filter(UF %in% sul)
sum(morador_uc_sul$PESO_FINAL) #10645721

morador_uc_centro_oeste = morador_uc %>%
  filter(UF %in% centro_oeste)
sum(morador_uc_centro_oeste$PESO_FINAL) #5354383
