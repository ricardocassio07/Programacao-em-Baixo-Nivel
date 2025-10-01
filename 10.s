# 10. No Assembly MIPS, existe a operação REM que apresenta o resto da divisão de 2 valores inteiros.
#SEM UTILIZAR A OPERAÇÃO REM, faça um algoritmo usando DIV, MUL e SUB que receba 2 valores
#inteiros e exiba o resto da divisão do maior pelo menor (Condição que deve ser verificada no início
#do algoritmo).

.data
msg0; .asciiz "\nO SEGUNDO NUMERO DEVE SER MAIOR QUE O PRIMEIRO E DIFERENTE DE ZERO!!!"
msg1: .asciiz "\nDigite um numero inteiro: "
msg2: .asciiz "\nDigite outro numero inteiro: "

msgResul: .asciiz "\nO resultado e "


.text
main:

enquanto:

# msgOrientacao:
li $v0, 4
la $a0, msg0
syscall

# Numero 1:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

# Numero 2:
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t2, $v0

bgt $t1, $t2, calculo
beq $t2, $zero, enquanto
blt $t1, $t2, enquanto


calculo:
# formula: resto = (maior - ((maior/menor) * menor))
div $t3, $t1, $t2
mul $t4, $t3, $t2
sub $t5, $t1, $t4

mostrar:
# Resultado
li $v0, 4
la $a0, msgResul
syscall

li $v0, 1
move $a0, $t5
syscall

fim:

li $v0, 10
syscall