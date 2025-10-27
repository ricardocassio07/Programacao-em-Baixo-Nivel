.data
    msgContexto: .asciiz "\nSabendo que: Ax² + Bx + C = 0"

    msgDigiteA: .asciiz "\nDigite o valor do coeficiente 'A': "
    msgDigiteB: .asciiz "\nDigite o valor do coeficiente 'B': "
    msgDigiteC: .asciiz "\nDigite o valor do coeficiente 'C': "

    msgDeltaPositivo: .asciiz "\nA equação possui duas raizes reais!"
    msgDeltaNulo: .asciiz "\nA equação possui uma raiz real!"
    msgDeltaNegativo: .asciiz "\nA equação não possui raízes reais!"

.text
main:
    leitura:
    # Contexto:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgContexto
    syscall # Executar

    # Coeficiente 'A':
    # Mensagem
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDigiteA # Colocar msgDigiteA em $a0
    syscall # Executar

    # Ler:
    li $v0, 5 # Execução 5: leitura de Inteiro
    syscall # Executar
    move $t0, $v0

    # Coeficiente 'B':
    # Mensagem
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDigiteB # Colocar msgDigiteB em $a0
    syscall # Executar

    # Ler:
    li $v0, 5 # Execução 5: leitura de Inteiro
    syscall # Executar
    move $t1, $v0

    # Coeficiente 'C':
    # Mensagem
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDigiteC # Colocar msgDigiteC em $a0
    syscall # Executar

    # Ler:
    li $v0, 5 # Execução 5: leitura de Inteiro
    syscall # Executar
    move $t2, $v0

    calculo:
    # Coeficiente 'A' está em $t0
    # Coeficiente 'B' está em $t1
    # Coeficiente 'C' está em $t2
    # Primeira parte do delta (B²) está em $t3 
    # Segunda parte do delta (4*A*C) está em $t4

    # Primeira parte do delta:
    mul $t3, $t1, $t1

    # Segunda parte do delta:
    li $s0, 4
    mul $t4, $s0, $t0
    mul $t4, $t4, $t2

    # Resultado: Delta = (primeira parte (B²) - segunda parte (4*A*C))
    sub $t3, $t3, $t4

    # Se for maior que zero:
    bgt $t3, $zero, positivo
    # Se for igual a zero:
    beq $t3, $zero, nulo
    # Se for menor que zero:
    blt $t3, $zero, negativo

    positivo:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDeltaPositivo # Colocar em msgDeltaPositivo em $a0
    syscall # Executar

    j finalizar

    nulo:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDeltaNulo # Colocar em msgDeltaPositivo em $a0
    syscall # Executar

    j finalizar
    
    
    negativo:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgDeltaNegativo # Colocar em msgDeltaPositivo em $a0
    syscall # Executar

    finalizar:
    li $v0, 10 # Execução 10: Finalizar Programa
    syscall # Executar