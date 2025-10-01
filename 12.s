# 12.Desenvolver um algoritmo que leia a altura, em centímetros de 15 pessoas. Este programa deverá
#calcular e mostrar:
#a. A menor altura do grupo;
#b. A maior altura do grupo;

.data
msgOrientacao: .asciiz "\nDigite a altura sem ponto ou virgula. Exemplo: 1.80 = 180!!!!"
msg: .asciiz "\nDigite a altura: "

msgMaior: .asciiz "\nA maior altura digitada foi: "
msgMenor: .asciiz "\nA menor altura digitada foi: "

.text
main:
# msgOrientacao:
li $v0, 4
la $a0, msgOrientacao
syscall

# Iniciando contadores:
li $t1, 15 # Contador de parada
li $t2, 0  # Contador de alturas digitadas
li $s0, 0 # Maior altura
li $s1, 0 # Menor altura

enquanto:
# Ler altura
li $v0, 4
la $a0, msg
syscall

li $v0, 5
syscall
move $t3, $v0

# Caso seja a primeira entrada...:
beq $t2, $zero, entrada1

# Caso a altura digitada for menor que a menor altura, devemos modifica-la:
blt $t3, $s1, modificarMenor
# Caso a altura digitada for maior que a maior altura, devemos modifica-la:
bgt $t3, $s0, modificarMaior

# Caso nenhuma das alternativass forem satisfeitas, ignoramos e continuamos o programa...
j continua


entrada1:
# Colocamos a altura digitada como a maior e a menor altura digitada para podermos comparar com as proximas entradas do usuario:
move $s0, $t3
move $s1, $t3 
add $t2, $t2, 1
j continua

modificarMaior:
move $s0, $t3
j continua

modificarMenor:
move $s1, $t3
j continua

continua:
add $t2, $t2, 1
blt $t2, $t1, enquanto
j fim

fim:
# Mostrar menor altura:
li $v0, 4
la $a0, msgMenor
syscall

li $v0, 1
move $a0, $s1
syscall

# Mostrar maior altura:
li $v0, 4
la $a0, msgMaior
syscall

# Fim:
li $v0, 1
move $a0, $s0
syscall