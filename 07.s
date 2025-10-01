#7.Faça um algoritmo que leia uma variável e some 5, caso seja par ou some 8, caso seja ímpar,
#imprimir o resultado desta operação.

.data
msg1: .asciiz "\nDigite um numero inteiro: "

.text
main:

# Mostrar mensagem
li $v0, 4
la $a0, msg1
syscall

# Ler número
li $v0, 5
syscall
move $t1, $v0  

# Verificar se par usando AND
andi $t2, $t1, 1    
bne $t2, $zero, ehimpar  

ehpar:
addi $t3, $t1, 5     
j mostrar

ehimpar:
addi $t3, $t1, 8     

mostrar:
li $v0, 1
move $a0, $t3
syscall

# Finalizar
li $v0, 10
syscall
