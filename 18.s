.data
    msgDigitePrimeiroNum: .asciiz "\nDigite um número: "
    msgDigiteSegundoNum: .asciiz "\nDigite outro número: "

    msgNumIguais: .asciiz "\nOs números inseridos são iguais!"

    msgNumMaior: .asciiz "\nO maior número inserido é: "
    msgNumMenor: .asciiz "\nO menor número inserido é: "

.text
main:
    # Leitura do primeiro número:
    # Mensagem:
    li $v0, 4 # Execução 4: Leitura de Caracteres
    la $a0, msgDigitePrimeiroNum # Colocar msgDigitePrimeiroNum em $a0
    syscall # Executar
    # Leitura:
    li $v0, 5 # Execução 5: Leitura de Inteiro
    syscall # Executar
    move $t0, $v0 # Mover para o registrador $t0 o valor de $v0 (valor inserido pelo usuário para ser o primeiro valor)

    # Leitura do segundo número:
    # Mensagem:
    li $v0, 4 # Execução 4: Leitura de Caracteres
    la $a0, msgDigiteSegundoNum # Colocar msgDigiteSegundoNum em $a0
    syscall # Executar
    # Leitura:
    li $v0, 5 # Execução 5: Leitura de Inteiro
    syscall # Executar
    move $t1, $v0 # Mover para o registrador $t1 o valor de $v0 (valor inserido pelo usuário para ser o segundo valor)

    # Primeiro número está em $t0
    # Segundo número está em $t1

    # Se os números forem diferentes, devemos ir até a comparação:
    bne $t0, $t1, numDigitadosSaoDiferentes

    # Os números são iguais, então, vamos mostrar a mensagem ao usuário:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgNumIguais # Colocar msgNumIguais em $a0
    syscall # Executar

    # Após mostrar a mensagem, devemos ir ao final do programa:
    j finalizar

    numDigitadosSaoDiferentes:
        # Se o segundo número inserido pelo usuário, não precisamos realizar nenhuma troca, vamos direto mostrar o maior e o menor valor:
        bgt $t0, $t1, mostrar

        # Se não, devemos trocar os valores da variáveis:
        # Colocando o menor valor em um registrador temporário:
        move $t2, $t0
        # Colocando o maior valor em $t0
        move $t0, $t1
        # Colocando o menor valor em $t1
        move $t1, $t2

    mostrar:
        # Mostrar o maior valor:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgNumMaior # Colocar msgNumMaior em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Execução 1: Escrita de Inteiro
        move $a0, $t0 # Colocar em $a0 o maior valor inserido alocado em $t0
        syscall # Executar

        # Mostrar o menor valor:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgNumMenor # Colocar msgNumMenor em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Execução 1: Escrita de Inteiro
        move $a0, $t1 # Colocar em $a0 o menor valor inserido alocado em $t1
        syscall # Executar

    finalizar:
        li $v0, 10 # Execução 10: Finalizar Programa
        syscall # Executar
