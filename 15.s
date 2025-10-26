.data
msgDigiteMesNas: .asciiz "\nDigite o mes de nascimento: "
msgDigiteAnoNas: .asciiz "\nDigite o ano de nascimento: "
msgDigiteMesAtual: .asciiz "\nDigite o mes atual: "
msgDigiteAnoAtual: .asciiz "\nDigite o ano atual: "

msgErro: .asciiz "\nVoce inseriu alguma informacao invalida... Por favor, insira todos os dados novamente!"

msgResultado: .asciiz "\nA pessoa tem "
msgResultado2: .asciiz " meses de vida!"

.text
main:

    enquanto:
        # Condição para pular a mensagem de erro na primeira vez que o código rodar:
        beq $zero, $zero, primeiraVez

        mensagemErro:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgErro # Colocar msgErro em $a0
            syscall # Executar

        primeiraVez:
        # Ler mes de nascimento:
        # Mensagem
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgDigiteMesNas # Colocar msgDigiteMesNas em $a0
        syscall # Executar
        # Leitura:
        li $v0, 5 # Execução 5: Leitura de Inteiro
        syscall # Executar
        move $t1, $v0 # Colocar em $t1 o valor inserido pelo usuário

        # Ler ano de nascimento:
        # Mensagem
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgDigiteAnoNas # Colocar msgDigiteAnoNas em $a0
        syscall # Executar
        # Leitura:
        li $v0, 5 # Execução 5: Leitura de Inteiro
        syscall # Executar
        move $t2, $v0 # Colocar em $t2 o valor inserido pelo usuário

        # Ler mês atual:
        # Mensagem
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgDigiteMesAtual # Colocar msgDigiteMesAtual em $a0
        syscall # Executar
        # Leitura:
        li $v0, 5 # Execução 5: Leitura de Inteiro
        syscall # Executar
        move $t3, $v0 # Colocar em $t3 o valor inserido pelo usuário

        # Ler ano atual:
        # Mensagem
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgDigiteAnoAtual # Colocar msgDigiteAnoAtual em $a0
        syscall # Executar
        # Leitura:
        li $v0, 5 # Execução 5: Leitura de Inteiro
        syscall # Executar
        move $t4, $v0 # Colocar em $t4 o valor inserido pelo usuário

        # Mes de Nascimento está em $t1
        # Ano de Nascimento está em $t2
        # Mes Atual está em $t3
        # Ano Atual está em $t4

        # Verificação:

        # Qualquer valor ente 1 e 12 para os meses são válidas:
        # Colocando o valor 1 no registrador $s1 para futura comparação dos meses:
        li $s1, 1
        # Colocando o valor 12 no registrador $s2 para futura comparação dos meses e multiplicação dos meses equivalente a um ano:
        li $s2, 12

        # Verificando se o ano de nascimento não é menor que zero:
        blt $t2, $zero, mensagemErro
        # Verificando se o mês de nascimento não é menor que 1:
        blt $t1, $s1, mensagemErro
        # Verificando se o mês de nascimento não é maior que 12:
        bgt $t1, $s2, mensagemErro

        # Verificando se o ano atual não é menor que zero:
        blt $t4, $zero, mensagemErro
        # Verificando se mês atual não é menor que 1:
        blt $t3, $s1, mensagemErro
        # Verificando se o mês atual não é maior que 12:
        bgt $t3, $s2, mensagemErro

        # Se o ano atual for maior que de nascimento, vai direto ao cálculo:
        bgt $t4, $t3, calculo
        # Se não, eles são iguais... então devemos verificar os meses inseridos, pois o mes de nascimento não pode ser maior que o atual:
        bgt $t1, $t3, mensagemErro

    calculo:

        # Fórmula: ((diferença de anos * 12) + (diferença de meses)) -> diferença de anos = (ano atual - ano de nascimento) -> diferença de anos = (ano atual - ano de nascimento)

        # Diferenca de anos será guardada em $s3:
        sub $s3, $t4, $t2

        # Se mes atual for menor que o mes de nascimento:
        blt $t3, $t1, mesAtualMenor


        mesAtualMaior:
        # Diferenca de meses em $s4:
        # Diferença de meses = (mes atual($t3) - mes de nascimento($t1))
        sub $s4, $t3, $t1

        j Resultado


    mesAtualMenor:
        # Diferenca de meses em $s4:
        # Diferença de meses = (mes de nascimento($t1) - mes atual($t3))
        sub $s4, $t1, $t3


    Resultado:
        # Convertendo a quantidade de anos em meses:
        # Diferença de anos = 'x' anos -> diferença de anos = 'x' anos * 12 = 'y' meses
        mul $s3, $s3, $s2
        # Idade em meses:
        # Idade em meses = (diferença de anos($s3) + diferença de meses($s4))
        add $s3, $s3, $s4

    Mostrar:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgResultado # Colocar msgResultado em $a0
        syscall # Executar

        li $v0, 1 # Execução 1: Escrita de Inteiro
        move $a0, $s3 # Colocar em $a0 o valor de $s4
        syscall # Executar

        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgResultado2 # Colocar msgResultado2 em $a0
        syscall # Executar

    Finalizar:
        li $v0, 10 # Execução 10: Finalizar
        syscall # Executar
