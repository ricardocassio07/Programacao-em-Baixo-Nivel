.data
msg1: .asciiz "\nDigite o valor da base do terreno em metros: "
msg2: .asciiz "\nDigite o valor da altura do terreno em metros: "
msg3: .asciiz "\nO resultado e: "

.text
main:
# Exibe msg1
li $v0, 4   # Execução 4:Escrita de Caracteres
la $a0, msg1 # Colocar msg1 em $a0
syscall  # Executar

# Lê a base
li $v0, 5 # Execução 5:Leitura de Inteiro
syscall   # Executar
move $t0, $v0       # Colocando o valor de $v0 (BASE) em $t0

# Exibe msg2
li $v0, 4   # Execução 4:Escrita de Caracteres
la $a0, msg2  # Colocar msg2em $a0
syscall   # Executar

# Lê a altura
li $v0, 5 # Execução 5:Leitura de Inteiro
syscall   # Executar
move $t1, $v0        # Colocando o valor de $v0 (ALTURA) em $t1

# Calcula a área
mul $t2, $t0, $t1   # Colocando em t2 = base * altura

# Exibe msg3
li $v0, 4    # Execução 4:Escrita de Caracteres
la $a0, msg3 # Colocar msg3em $a0
syscall  # Executar

# Exibe o resultado da área
li $v0, 1        # código de serviço para imprimir inteiros
move $a0, $t2        # resultado em $a0
syscall

# Encerra o programa
li $v0, 10
syscall