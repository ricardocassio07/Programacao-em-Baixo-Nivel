#2.Uma fábrica de camisetas produz os tamanhos pequeno, médio e grande, cada uma sendo vendida
#respectivamente por 10, 12 e 15 reais. Construa um algoritmo em que o usuário forneça a
#quantidade de camisetas pequenas, médias e grandes referentes a uma venda, e a máquina informe
#quanto será o valor arrecadado.

.data
msgCPeq: .asciiz "\nDigite a quantidade de camisas de tamanho pequeno vendidas: "
msgCMed: .asciiz "\nDigite a quantidade de camisas de tamanho medio vendiadas: "
msgCGran: .asciiz "\nDigite a quantidade de camisas de tamanho grande vendidas: "
msgResul: .asciiz "\nO resultado e "
msgReais: .asciiz " reais!!!" 

.text
main:

# Quantidade de camisas pequenas:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgCPeq # Colocar msgCPeq em $a0
syscall # Executar
# Leitura:
li $v0, 5 # Execucao 1: Leitura de inteiros
syscall # Executar
move $t0, $v0 # Colocar numero ins'erido pelo user em $t0

# Quantidade de camisas medias:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgCMed # Colocar msgCMed em $a0
syscall # Executar
# Leitura:
li $v0, 5 # Execucao 1: Leitura de inteiros
syscall # Executar
move $t1, $v0 # Colocar numero inserido pelo user em $t1

# Quantidade de camisas grandes:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgCGran # Colocar msgCGran em $a0
syscall # Executar
# Leitura:
li $v0, 5 # Execucao 1: Leitura de dados
syscall # Executar
move $t2, $v0 # Colocar numero inserido pelo user em @t2

# Valor total de camisas pequenas vendidas:
mul $t0, $t0, 10 # Armazenar em $t0 o seu valor multiplicado por 10

# Valor total de camisas medias vendidas:
mul $t1, $t1, 12 # Armazenar em $t1 o seu valor multiplicado por 12

# Valor total de camisas grandes vendidas:
mul $t2, $t2, 15 # Armazenar em $t2 o seu valor multiplicado por 15

# Valor total de arrecadacao:
add $t3, $t0, $t1
add $t3, $t3, $t2

# Mostrar resultado:
# Inicio da mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgResul # Colocar msgResul em $a0
syscall # Executar
# Mostrar valor
li $v0, 1 # Execucao 1: Escrita de inteiros
move $a0, $t3 # Colocar em $a0 o que está em $t3
syscall # Executar
# Final da mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgReais # Colocar msgReais em $a0
syscall # Executar

# Finalizar progrma:
li $v0, 10 # Execucao 10: Encerrar programa
syscall # Executar