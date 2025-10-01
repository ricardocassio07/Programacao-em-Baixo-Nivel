# 6.Faça um algoritmo que leia dois valores inteiros A e B se os valores forem iguais deverá se somar
#os dois, caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o
#resultado para uma variável C e mostrar seu conteúdo na tela.

.data
msg1: .asciiz "\nDigite um numero inteiro: "
msg2: .asciiz "\nDigite outro numero: "

msgIgual: .asciiz"\nOs numeros sao iguais, logo, o resultado da soma e "
msgDiferente: .asciiz "\nOs numeros sao diferentes, logo, o resultado da multiplicacao e "

.text
main: 

# Num 1:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
add $t1, $v0, $zero

# Num 2:
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
add $t2, $v0, $zero

# Se forem iguais...
beq $t1, $t2, igual

diferente:

mul $t3, $t1, $t2
li $v0, 4
la $a0, msgDiferente
syscall
j mostrar

igual: 

add $t3, $t1, $t2
li $v0, 4
la $a0, msgIgual
syscall

mostrar:
# Resultado:
li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall