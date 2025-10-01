# 9.Fazer um algoritmo que leia 2 números inteiros e exiba a divisão destes. Sabe-se que o 2o número
#não pode ser zero, portanto, deve-se insistir na solicitação do 2o número até ele ser diferente de 0.

.data
msg1: .asciiz "\nDigite um numero: "
msg2: .asciiz "\nDigite mais um numero: "

msgErro: .asciiz "\nNAO PODEMOS DIVIDIR NADA POR ZERO!!!!\nDigite o segundp numero novamente: "

msgResul: .asciiz "\nO resultado e "

.text
main:
# Receber o primeiro numero:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

enquanto:

# Receber o segundo numero:
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t2, $v0

# Caso ele seja igual a zero, retorna para o loop:
beq $t2, $zero, enquanto

# Realizar a divisao:
div $t3, $t1, $t2

# Resultado:
li $v0, 4
la $a0, msgResul
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall