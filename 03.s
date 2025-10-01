#3.A empresa Hipotheticus paga R$10,00 por hora normal trabalhada, e R$15,00 por hora extra. Faça
#um algoritmo para calcular e imprimir o salário bruto e o salário líquido de um determinado
#funcionário. Considere, também, uma entrada de desconto para calcular o salário líquido.

.data
msgHT: .asciiz "\nDigite quantas horas o funcionario trabalhou: "
msgHE: .asciiz "\nDigite quantas horas extras esse funcionqrio fez: "
msgDesc: .asciiz "\nDigite o valor da porcentagem que e descontada do salario desse funcionario em decimal (Ex.: 100% = 0.10): "

msgFinal1: .asciiz "\nO salario bruto desse fiuncionario e R$" # Primeira parte da mensagem final 
msgFinal2: .asciiz " e o salario liquido desse funcionario e R$" # Segunda parte da mensagem final
msgFinal3: .asciiz "!!!" # Terceira parte da mensagem final

valHoraNormal: .float 10.0
valHoraExtra:  .float 15.0


.text
main:

# Salario Bruto:

# Ler horas normais:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgHT # Colocar msgHT em $a0
syscall # Executar
# Leitura:
li $v0, 6 # Execucao 6: Leitura de ponto flutuante
syscall # Executar
mov.s $f1, $f0 # Colocar o que o user digitou em $f1

# Valor total das horas normais trabalhadas:
l.s $f8, valHoraNormal # Colocando no registrador $f8 o valor da hora normal
mul.s $f1, $f1, $f8 # Multiplicar a quantidade de horas trabalhadas pelo valor da hora (R$10.00)

# Ler horas extras:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgHE # Colocar msgHE em $a0
syscall # Executar
# Leitura:
li $v0, 6 # Execucao 6: Leitura de ponto flutuante
syscall # Executar
mov.s $f2, $f0 # Colocar o que o user digitou em $f2

# Valor total das horas extras trabalhadas:
l.s $f9, valHoraExtra # Colocando no registrador $f9 o valor da hora extra
mul.s $f2, $f2, $f9 # Multiplicar a quantidade de horas extras trabalhadas pelo valor da hora extra (R$15.00)

# Valor do Salario Bruto:
add.s $f3, $f1, $f2 # Colocar em $f3 a soma de $f1 (VALOR DAS HORAS NORMAIS TRABALHADAS) com $f2 (VALOR DAS HORAS EXTRAS TRABALHADAS)

# Salario Liquido:
# Ler desconto:
# Mensagem:
li $v0, 4 # Execucao 4: Escrita de caracteres
la $a0, msgDesc # Colocar msgDesc em $a0
syscall # Executar
# Leitura:
li $v0, 6 # Execucao 6: Leitura de ponto flutuante
syscall # Executar
mov.s $f4, $f0 # Colocar o que o user digitou em $f4

# Valor do desconto:
mul.s $f4, $f4, $f3 # Valor do desconto multiplicado pelo salario bruto = ao valor que sera descontado do salario bruto

# Valor do Salario Liquido:
sub.s $f5, $f3, $f4


# Mostrar salario bruto
li $v0, 4
la $a0, msgFinal1
syscall

li $v0, 2
mov.s $f12, $f3
syscall

# Mostrar salario liquido
li $v0, 4
la $a0, msgFinal2
syscall

li $v0, 2
mov.s $f12, $f5
syscall

li $v0, 4
la $a0, msgFinal3
syscall

# Finalizar programa:
li $v0, 10
syscall
