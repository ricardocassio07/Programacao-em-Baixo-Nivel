# 11.Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles
#estão nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar
#quando for lido um número negativo.
#*Sabe-se que a entrada deve ser um número entre 0 e 100, validar a entrada para que não permita
#números fora deste intervalo

.data
msgOrientacao: .asciiz "\nDigite um numero inteiro entre 0 e 100. O programa sera encerrado quando voce digitar um numero negativo!!!\n"
msgEntrada:    .asciiz "\nDigite um numero: "
msgFaixa1:     .asciiz "\nQuantidade no intervalo [0-25]: "
msgFaixa2:     .asciiz "\nQuantidade no intervalo [26-50]: "
msgFaixa3:     .asciiz "\nQuantidade no intervalo [51-75]: "
msgFaixa4:     .asciiz "\nQuantidade no intervalo [76-100]: "

.text
main:
# mensagem inicial
li $v0, 4
la $a0, msgOrientacao
syscall

# inicializa contadores em 0
li $s0, 0   # contador [0-25]
li $s1, 0   # contador [26-50]
li $s2, 0   # contador [51-75]
li $s3, 0   # contador [76-100]

enquanto:
# Ler numero:
li $v0, 4
la $a0, msgEntrada
syscall

li $v0, 5
syscall
move $t0, $v0      

# condição de parada
blt $t0, $zero, mostrar

# verifica intervalos
ble $t0, 25, faca1
ble $t0, 50, faca2
ble $t0, 75, faca3
ble $t0, 100, faca4
# caso nenhuma condicao seja satisfeita...:
j enquanto          

faca1:
addi $s0, $s0, 1    
j enquanto

faca2:
addi $s1, $s1, 1   
j enquanto

faca3:
addi $s2, $s2, 1   
j enquanto

faca4:
addi $s3, $s3, 1    
j enquanto

mostrar:
# imprime contadores:
# contador [0-25]:
li $v0, 4
la $a0, msgFaixa1
syscall
li $v0, 1
move $a0, $s0
syscall

# contador [26-50]:
li $v0, 4
la $a0, msgFaixa2
syscall
li $v0, 1
move $a0, $s1
syscall

# contador [51-75]:
li $v0, 4
la $a0, msgFaixa3
syscall
li $v0, 1
move $a0, $s2
syscall

# contador [76-100]:
li $v0, 4
la $a0, msgFaixa4
syscall
li $v0, 1
move $a0, $s3
syscall

fim:
li $v0, 10
syscall