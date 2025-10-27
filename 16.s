.data:
    msgDigiteSalario: .asciiz "\nDigite o valor de seu salário R$: "

    msgErro: .asciiz "\nVoce inseriu alguma informacao invalida... Por favor, insira todos os dados novamente!"

    msgMostraResultado: .asciiz "\nO salário do funcionário com acrescimo de 25% é R$ "

.text
main:

    Enquanto:
        # Condição para pular a mensagem de erro na primeira vez que o código rodar:
        beq $zero, $zero, primeiraVez

        mensagemErro:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgErro # Colocar msgErro em $a0
            syscall # Executar
        
        primeiraVez:
            # Ler salário:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgDigiteSalario # Colocar msgDigiteSalario em $a0
            syscall # Executar

            li $v0, 5 # Execução 5: Leitura de Escrita
            syscall # Executar
            move $t0, $v0 # Colocar em $t0 o valor de $v0 (valor do salário do funcionário)

            ble $t0, $zero, msgErro # Se o salário for menor ou igual a zero, repita a inserção
    
    # Salário em $t0
    # Acréscimo em $t1

    # Porcentagem:
    li $t2, 25
    li $t3, 100

    # Acréscimo: Acrèscimo = ((salário * 25) / 100)
    mul $t1, $t0, $t2
    div $t1, $t1, $t3

    # Novo salário: nv = (salário * acréscimo)
    add $t0, $t0, $t1

    Mostrar:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgMostraResultado # Colocar em msgMostraResultado em $a0
    syscall # Executar

    li $v0, 1 # Execução 1: Escrita de Inteiro
    move $a0, $t0 # Colocar em $a0 o valor de $t0 (novo salário)
    syscall # Executar

    Finalizar:
    li $v0, 10 # Execução 10: Finalizar programa
    syscall # Executar