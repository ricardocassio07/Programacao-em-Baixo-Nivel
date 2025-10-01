# 5.Faça um algoritmo que receba o valor dos catetos de um triângulo, calcule e mostre o valor da
#hipotenusa.

.data
msgC1: .asciiz "\nDigite o valor de um dos catetos do triangulo: "
msgC2: .asciiz "\nDigite o valor do outro cateto do triangulo: "
msgResul: .asciiz "\nA hipotenusa vale "


.text
main:

# Cateto 1:
li $v0, 4
la $a0, msgC1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

# Cateto 1 ao quadrado
mul.s $f1, $f1, $f1

# Cateto 2
li $v0, 4
la $a0, msgC2
syscall

li $v0, 6
syscall
mov.s $f2, $f0

# Cateto 2 ao quadrado
mul.s $f2, $f2, $f2

# Soma dos catetos ao quadrado
add.s $f1, $f1, $f2

# Raiz da soma dos catetos ao quadrado:
sqrt.s $f1, $f1

# Resultado:
li $v0, 4
la $a0, msgResul
syscall

li $v0, 2
mov.s $f12, $f1
syscall

li $v0, 10
syscall