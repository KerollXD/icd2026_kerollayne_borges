# Arquivo: 02-avaliacao-resolucao.R
# Integrante 1: Evellyn Leal
# Integrante 2: Isadora Faria
# Integrante 3: Kerollayne
# Integrante 4: Sara Pamela 
# Data: 09/06/2026
# Objetivo: Resolução da Avaliação 2 — Introdução à Ciência de Dados


# Configurações globais ---------------------------------------
options(digits = 5, scipen = 999)

# Exercício 1 -------------------------------------------------

# a) Um possível espaço amostral é: S = {renovou ou não renovou}
#

# b) Um evento associado à renovação do contrato. é: A = {renovação}
# Em palavras: A é o evento "o cliente realiza a renovação".
#

# c) A probabilidade desse evento pode ser escrita como:
# P(A)

# d) Antes de definir uma variável aleatória, o resultado observado não é
# diretamente numérico.
# Ele é qualitativo/binário: renova ou não renova
# Ele só passa a ser representado numericamente depois que definimos X.

# e) Uma variável aleatória indicadora adequada é:
# X = 1 se o cliente realiza a renovação;
# X = 0 se o cliente não realiza a renovação
#
# Com essa definição, o evento A = {renovação} também pode ser escrito
# como X = 1. Assim, P(A) = P(X = 1).

# f) A distribuição de probabilidade que mais se adequa para representar essa 
# variavel é a Bernoulli, pois ela é usada para uma unica observação,
# com dois resultados possíveis, sucesso ou fracasso
# (No caso, renova ou não renova).


# Exercício 2 -------------------------------------------------

# a) 
# X pode assumir dois valores:
# X = 12, quando o cupom é utilizado;
# X = 0, quando o cupom não é utilizado


# b) 
# P(X = 12) = 0,1

# c)
# P(X = 0) = 1 - 0,1 = 0,9


# d)
# valor esperado de X:
# E(X) = X1 * P(X = 12) + X2 * P(X = 0)
# E(X) = 12 * 0,1 + 0 * 0,9
# E(X) = R$ 1,20


# e)
# O custo esperado do uso do cupom é de R$ 1,20 por produto vendido.
# Isso não significa que cada produto terá custo de R$ 1,20
# Individualmente, o custo será R$ 0 ou R$ 12
# O valor esperado resume o custo médio por produto quando pensamos
# em muitos produtos vendidos sob as mesmas condições.



# Exercício 3 -------------------------------------------------

set.seed(123)

# a) 

lambda <- 10
capacidade <- 13
n_simulacoes <- 1000


# b) 

clientes <- rpois(n = n_simulacoes, lambda = lambda)
head(clientes)


# c) 

media_simulada <- mean(clientes)
media_simulada


# d)

prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade


# e) 

percentil_95 <- quantile(clientes, 0.95)
percentil_95


#f) 

# A média simulada ficou coerente com a média do modelo?
# R: A média simulada ficou perto de 10 clientes p/ hora, como esperado
# no modelo (Poisson(lambda = 10).)  

# Em que proporção das simulações a contagem de clientes 
# ficou acima da capacidade atual de 13 clientes?
# R: A capacidade de 13 clientes foi ultrapassada em cerca de 12,5% dos valores
# simulados. Em uma hora de pico nesse modelo, a unidade ficaria 
# acima da capacidade com frequência.    

# O que significa o percentil 95 da contagem de clientes por hora de pico?
# R: Nessa simulação o percentil 95 foi igual a 15, e isso indica
# que uma capacidade de 15 clientes p/ hora cobriria cerca de 95% das simulações.

# Esse percentil está próximo ou acima da capacidade atual?
# R: Esse percentil está acima da capacidade atual, que no caso, seria 13.

# Com base nesses resultados, a capacidade atual parece suficiente para a
# maior parte das situações de pico, ou parece limitada?
# R: Parece limitada, seria melhor, aumentar a capácidade para 15 clientes 
# p/ hora, porque 15 atenderia aproximadamente 95% das situações simuladas.






















