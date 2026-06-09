# Arquivo: 07-analise-exploratoria.R
# Autor(a): <seu nome>
# Data: 25/05/2026
# Objetivos:
# 1. Calcular estatísticas descritivas amostrais.
# 2. Visualizar a distribuição empírica dos dados.
# 3. Comparar padrões entre grupos.

# 0. Configurações globais ---------------------------------------------

# Controla a forma como os valores numéricos aparecem no console.
options(digits = 5, scipen = 999)

# Carrega os pacotes usados para caminhos, manipulação e visualização.
library(here)
library(tidyverse)
library(tidyplots)

# Permite que os gráficos do tidyplots usem o espaço disponível.
tidyplots_options(width = NA, height = NA)

# Carregando dados

caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

dados_marketing <- read_rds(caminho_dados)

glimpse(dados_marketing)

# 2. Inspeção inicial -----------------------------------------------

# Verifica o tamanho dos dados: quantidade de linhas e colunas.
dim(dados_marketing)

# Lista os nomes das variáveis disponíveis.
names(dados_marketing)

# Mostra as primeiras linhas para uma inspeção rápida dos dados.
head(dados_marketing)

# Conta quantas semanas aparecem em cada status de promoção.
dados_marketing |>
  count(status_promocao)