# functional-programmming

## ATV1
Faça um programa em Python, utilizando os conceitos de programação do paradigma funcional, que leia dois inteiros x e y, sendo que x é menor que y, e imprima o comprimento do maior intervalo entre dois números primos consecutivos maiores ou iguais a x e menores ou iguais a y.

## ATV2
Faça um programa em Haskell, utilizando os conceitos de programação do paradigma funcional, que leia dois inteiros x e y, sendo que x é menor que y, e imprima o comprimento do maior intervalo entre dois números primos consecutivos maiores ou iguais a x e menores ou iguais a y.

## ATV3
Faça um programa em Haskell que leia N números inteiros de uma lista e imprima o comprimento de um segmento crescente de tamanho máximo. Por exemplo, na sequência [3, 7, 4, 3, 6, 8, 9, 2, 5], o segmento crescente máximo é [3, 6, 8, 9], portanto seu comprimento é 4. Considere que um segmento de tamanho N é crescente quando X1 < X2 < ... < XN.

## ATV4
O boliche é um esporte praticado com uma bola pesada e tem como objetivo lançar a bola por uma pista, derrubar 10 pinos do lado oposto da pista dispostos em formação triangular (https://www.infoescola.com/esportes/boliche/).

A fórmula da contagem de pontos no boliche tem as seguintes variáveis (https://boliche.com.br/esporte-boliche/contagem-dos-pontos-no-boliche/): Os pontos são a soma dos pinos derrubados. Exceto quando fizer Strike (derrubar 10 pinos na 1.ª bola) ou Spare (derrubar 10 pinos nas duas bolas jogadas) Se fizer Strike ganha bônus nas 2 bolas jogadas a seguir. Se fizer Spare ganha bônus na próxima bola jogada. O bônus é igual ao número de pinos derrubados. O total de 1 partida pode variar de zero a 300 pontos.

A pontuação pode ir de zero (quando nenhum pino é derrubado nas dez jogadas ou “frames”) até o máximo possível de 300 pontos, ou seja, 12 “strikes” consecutivos. Supostamente, como cada partida tem 10 “frames” (jogadas), só seriam possíveis 10 “strikes”. Porém, se o jogador derrubar todos os pinos no primeiro arremesso do 10.º “frame”, tem o direito de jogar mais duas bolas, podendo completar 12 “strikes” numa mesma linha.

Faça um programa que leia a quantidade de pinos derrubados por um praticante de boliche em cada jogada e imprima: A sequência de pinos derrubados (de acordo com os exemplos de entrada e saída e as anotações de contagem de pontos - https://boliche.com.br/esporte-boliche/contagem-dos-pontos-no-boliche/); A pontuação final do jogador.

Dica: Para testar seu programa, sugere-se utilizar o seguinte simulador de pontos: https://www.bowlinggenius.com/

## ATV5
Faça UM programa (Haskell), que leia uma linha com 4 inteiros separados por espaço. Sejam esses inteiros n1, n2, n3 e n4. Ele deve imprimir as seguintes informações:

1) A soma de "Active" de todos os países em que "Confirmed" é maior o igual que n1.

2) Dentre os n2 países com maiores valores de "Active", a soma das "Deaths" dos n3 países com menores valores de "Confirmed".

3) Os n4 países com os maiores valores de "Confirmed". Os nomes devem estar em ordem alfabética.

O programa deve ler um arquivo "dados.csv", que já estará disponível no run.codes no diretório que o programa vai ser executado (não precisa inclui-lo no trabalho). Para teste, uma cópia do arquivo está disponível em https://drive.google.com/file/d/1n39FcIjQkYmGgngSRoYnZ0k5WrL5zAQZ/view?usp=sharing

As colunas do arquivo são: Country, Confirmed, Deaths, Recovery, Active.

## ATV6
Faça UM programa, que leia uma linha com 4 inteiros separados por espaço. Sejam esses inteiros n1, n2, n3 e n4. Implementação em Java, sem utilizar laços, utilizando stream. Nessa versão, a existência de qualquer estrutura de laço no programa acarretará em zero nesse item. Ele deve imprimir as seguintes informações:

1) A soma de "Active" de todos os países em que "Confirmed" é maior o igual que n1.

2) Dentre os n2 países com maiores valores de "Active", a soma das "Deaths" dos n3 países com menores valores de "Confirmed".

3) Os n4 países com os maiores valores de "Confirmed". Os nomes devem estar em ordem alfabética.

O programa deve ler um arquivo "dados.csv", que já estará disponível no run.codes no diretório que o programa vai ser executado (não precisa inclui-lo no trabalho). Para teste, uma cópia do arquivo está disponível em https://drive.google.com/file/d/1n39FcIjQkYmGgngSRoYnZ0k5WrL5zAQZ/view?usp=sharing

As colunas do arquivo são: Country, Confirmed, Deaths, Recovery, Active.

## ATV7
Faça UM programa, que leia uma linha com 4 inteiros separados por espaço. Sejam esses inteiros n1, n2, n3 e n4. Implementação em Java, sem utilizar stream, utilizando laços. Nessa versão, não se deve utilizar conceitos de programação funcional, e sim linguagem imperativa. Ele deve imprimir as seguintes informações:

1) A soma de "Active" de todos os países em que "Confirmed" é maior o igual que n1.

2) Dentre os n2 países com maiores valores de "Active", a soma das "Deaths" dos n3 países com menores valores de "Confirmed".

3) Os n4 países com os maiores valores de "Confirmed". Os nomes devem estar em ordem alfabética.

O programa deve ler um arquivo "dados.csv", que já estará disponível no run.codes no diretório que o programa vai ser executado (não precisa inclui-lo no trabalho). Para teste, uma cópia do arquivo está disponível em https://drive.google.com/file/d/1n39FcIjQkYmGgngSRoYnZ0k5WrL5zAQZ/view?usp=sharing

As colunas do arquivo são: Country, Confirmed, Deaths, Recovery, Active.
