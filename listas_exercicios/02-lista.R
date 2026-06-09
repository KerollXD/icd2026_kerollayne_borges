# Arquivo: 02-lista.R
# Autor(a): Kerollayne Borges de Oliveira Souza
# Data: 08/03/2026
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# Carrega os pacotes necessários
library(here)
library(tidyverse)
library(janitor)

# Exercicio 1 -------------------------------------------------------------


## a)


## b) 


caminho_csv <- here("dados/brutos/dados-marketing.csv")

dados_marketing <- read_csv(caminho_csv)


## c)


glimpse(dados_marketing)
dados_marketing


# Exercicio 2 -------------------------------------------------------------

## a) Cada linha (observação) do arquivo representa uma semana de
##    observação da empresa com informações sobre os gastos em diferentes
##    canais de marketing (TV, radio, redes sociais e e-mail), a ocorrência
##    de promoçaao, a atividade da concorrência e a receita de vendas
##    obtida naquela semana.


## b) o objeto dados_marketing possui 156 observacoes e 9 variaveis

# Exercicio 3 -------------------------------------------------------------

## a) 

dados_marketing_limpos <- dados_marketing |>
clean_names()

## b)

names(dados_marketing_limpos)

# Exercicio 4 -------------------------------------------------------------

dados_marketing_limpos |>
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)


# Exercicio 5 -------------------------------------------------------------

dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email)

dados_marketing_limpos |>
  select(data, mes, gasto_total, receita_vendas)

View(dados_marketing_limpos)

# Exercicio 6 -------------------------------------------------------------

dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(
    status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
    status_concorrencia = ifelse(atividade_concorrente == 1, "Com concorrência", "Sem concorrência")
  )

dados_marketing_limpos |>
  select(promocao, status_promocao, atividade_concorrente, status_concorrencia)

View(dados_marketing_limpos)

# Exercicio 7 -------------------------------------------------------------

caminho_rds <- here ("dados/limpos/dados_marketing_limpos.rds")
readr::write_rds(dados_marketing_limpos, caminho_rds)

View(dados_marketing_limpos)


# Exercicio 8 -------------------------------------------------------------

dados_marketing_limpos |>
  filter(promocao == 1 & receita_vendas > 1000) |>
  select(data, mes, receita_vendas, status_promocao)

# Exercicio 9 -------------------------------------------------------------

resumo_mensal <- dados_marketing_limpos |>
  group_by(mes) |>
  summarise(
    receita_media = mean(receita_vendas),
    receita_total = sum(receita_vendas),
    gasto_total_medio = mean(gasto_total),
    semanas_com_promocao = sum(promocao)
  ) |>
  arrange(desc(receita_media))

resumo_mensal

View(resumo_mensal)



































