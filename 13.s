.data
msgInsiraValor: .asciiz "\nDigite o valor em R$ (reais): "

msgMostraValor1: .asciiz "\nR$"
msgMostraValor2: .asciiz " (reais) e igual a US$"
msgMostraValor3: .asciiz " (dólares)!!!"

.text
main:
# Exibir msgInsiraValor
li $v0, 4 # Execução 4: Mostra Caracteres
la $a0, msgInsiraValor # Colocar msgInsiraValor no registrador $a0
syscall # Executar

# Ler valor em reais
li $v0, 5 # Execução 5: Leitura de Inteiro
syscall # Executar
move $t0, $v0

# Conversão: valor_em_dólar = (valor_em_real / 5)
# Colocando o divisor em um registrador:
li $t1, 5
# Realizando a divisão:
div $t0, $t1
# Pegando o quociente da divisão:
mflo $t2

# Mostrando o quociente (o resultado da conversão):
li $v0, 4 # Execução 4: Mostra Caracteres
la $a0, msgMostraValor1 # Colocar msgMostraValor1 no registrador $a0
syscall # Executar

li $v0, 1 # Execução 1: Escrita de números
move $a0, $t0 # Colocar o valor de $t0 (valor em reais) no registrador $a0
syscall # Executar

li $v0, 4 # Execução 4: Mostra Caracteres
la $a0, msgMostraValor2 # Colocar msgMostraValor2 no registrador $a0
syscall # Executar

li $v0, 1 # Execução 1: Escrita de números
move $a0, $t2 # Colocar o valor de $t2 (valor em dólares) no registrador $a0
syscall # Executar

li $v0, 4 # Execução 4: Mostra Caracteres
la $a0, msgMostraValor3 # Colocar msgMostraValor3 no registrador $a0
syscall # Executar

# Finalizar
li $v0, 10 # Execução 10: Encerrar programa
syscall # Executar