# Arquivo: 04-lista-resolucao.R
# Autor(a): seu nome
# Data: dd/mm/aaaa
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100,20)
total_resultados


# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50,20)
resultados_favoraveis


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- resultados_favoraveis / total_resultados
prob_acertar_20

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 / 20
uma_chance_em


# d)
# Escreva sua interpretação como comentário.



# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE,
  prob = rep(1/6,6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <- mean(evento_A)
freq_relativa

# Depois de completar para n = 100, altere n para 1000 e 10000.



# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- prob_incendio * indenizacao

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- valor_esperado * (1 + carregamento)

# exibe o resultado
premio


# a)
# O valor esperado de indenização é R$ 1.500,00 por residencia por ano.
# Ele representa a média téorica das indenizações por residencia em
# uma carteira grande de risco semelhantes.


# b)
# O valor esperado não signifiva que toda residencia terá indenizaçãi de
# R$ 1.500,00. Para uma residencia individual, a indenização será R$ 0 se
# não houver incendio ou R$ 150.00 se houver incendio.


# c)
# O calculo é simplificado. Ele ignora administrativas, impostos,
# corretagem, inadimplencia, capital regulatorio. resseguro, eventos extremos
# e possiveis erros na estimativa da probabilidade de incendio.



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0,indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira

# Depois de completar para n = 100, altere n para 10000 e 100000.

# a)
# Quando n aumenta, a média das indenizações por residencia tende a ficar
# mais proxima do valor esperado terico, conforme previsto pelalei dos
# grandes numeros


# b)
# A media das indenizações tende a se aproximar de R$ 1.500,00 que é o valor
# esperado de indenização por residencia.


# c)
# Uma carteira maior tende a tornar a media das indenizações mais previsevel
# porque a frequencia relativa de incendio tende a se aproximar da [# probabilidade teorica de 1 %.
# Isso é uma aplicação da Lei dos Grandes Números.

# d)
# O risco não desaparece completamente. A seguradora aind apode ser afetada por
# eventos extremos, dependencias entre riscos, erro na estimativa da
# probabilidade de ncendio e custos que não foram incluidos neste modelo simples.
