#8.Encontrar o dobro de um número caso ele seja positivo e o seu triplo caso seja negativo,
#imprimindo o resultado.

.data
msg1: .asciiz "\nDigite um numero inteiro positivo ou negativo: "
msgNulo: .asciiz "\nO NUMERO DEVE SER MAIOR OU MENOR QUE ZERO!!!"

.text
main:
# Receber numero
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

# Verificar se ele nao e igual a zero:
beq $t1, $zero, nulo

# Caso ele seja positivo...
bgt $t1, $zero, positivo

negativo:
mul $t2, $t1, 2
j mostrar

positivo:
mul $t2, $t1, 3
j mostrar

nulo:
li $v0, 4
la $a0, msgNulo
syscall
j fim

mostrar:

li $v0, 1
move $a0, $t2
syscall

fim:

li $v0, 10
syscall