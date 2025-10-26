.data
msgDigiteX: .asciiz "\nDigite um numero 'X': "
msgDigiteY: .asciiz "\nDigite um numero 'Y': "

msgMostraX: .asciiz "\nX = "
msgMostraY: .asciiz "\nY = "


.text
main:
# Exibe msgDigiteX
li $v0, 4 # Execução 4: Escrita de Caracteres
la $a0, msgDigiteX # Colocar msgDigiteX em $a0
syscall # Executar

# Ler valor de 'X'
li $v0, 5 # Execução 5: Leitura de Inteiro
syscall # Executar
move $t0, $v0

# Exibe msgDigiteY
li $v0, 4 # Execução 4: Escrita de Caracteres
la $a0, msgDigiteY # Colocar msgDigiteY em $a0
syscall # Executar

# Ler valor de 'Y'
li $v0, 5 # Execução 5: Leitura de Inteiro
syscall # Executar
move $t1, $v0

# Usando registrador temporario para armazanar o valor original de 'X':
move $t2, $t0

# Atribuindo a 'X' o valor originalmente de 'Y':
add $t0, $zero, $zero
move $t0, $t1

# Atribuindo a 'Y' o valor originalmente de 'X':
add $t1, $zero, $zero
move $t1, $t2

# Mostrar valor de 'X' atualizado:
# Mensagem:
li $v0, 4 # Execução 4: Escrita de Caracteres
la $a0, msgMostraX # Colocar msgMostraX em $a0
syscall # Executar
# Numero:
li $v0, 1 # Execução 1: Escrita de números
move $a0, $t0 # Colocar o valor do registrador $t0 (X) em $a0
syscall # Executar

# Mostrar valor de 'Y' atualizado:
# Mensagem:
li $v0, 4 # Execução 4: Escrita de Caracteres
la $a0, msgMostraY # Colocar msgMostraY em $a0
syscall # Executar
# Numero:
li $v0, 1 # Execução 1: Escrita de números
move $a0, $t1 # Colocar em $a0 o valor do registrador $t1 (Y)
syscall # Executar

# Finalizar
li $v0, 10 # Execução 10: Encerrar programa
syscall # Executar
