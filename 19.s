.data
    msgDigiteNum: .asciiz "\nDigite um número inteiro entre 100 e 999:\n-> "

    msgErro: .asciiz "\nVocê deve inserir um número inteiro entre 100 e 999!"

    msgValorDigitadoFoi: .asciiz "\nO valor inserido foi: "
    msgCentena: .asciiz "\nCentena: "
    msgDezena: .asciiz "\nDezena: "
    msgUnidade: .asciiz "\nUnidade: "

.text
main:
    enquanto:
        # Condição para pular a mensagem de erro na primeira vez que o código rodar:
        beq $zero, $zero, inserirDado

        mensagemErro:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgErro # Colocar msgErro em $a0
            syscall # Executar

        inserirDado:
            # Leitura do número:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgDigiteNum # Colocar msgDigiteNum em $a0
            syscall # Executar
            # Leitura:
            li $v0, 5 # Execução 5: Leitura de Inteiro
            syscall # Executar
            move $s0, $v0 # Colocar valor inserido pelo usuário no registrador $t0

            # Registradores para futura comparação:
            li $t0, 100
            li $t1, 999

            # Se o número for menor que 100 e maior que 999, o usuário deve digitar novamente o valor:
            blt $s0, $t0, mensagemErro
            bgt $s0, $t1, mensagemErro
    
    dividirNúmero:
        # O valor completo está em $s0
        # $t0 vai armazenar 10
        # $t1 vai armazenar 100
        # Unidade do valor vai ser armazenado em $s2
        # Dezena do valor vai ser armazenado em $s3
        # Centena do valor vai ser armazenado em $s4

        li $t0, 10
        li $t1, 100

        # Exemplo de entrada: 597

        # Unidade:
            # Se dividirmos 597 por 10, vamos ter 597,7, como o assembly realiza apenas divisões com quociente resultando em um número inteiro, vamos ter: quociente = 59 e o resto = 7. Logo se colhetarmos o resto, vamos ter o valor da unidade do número:
            div $s0, $t0
            # Pegando o resto da divisão, que será igual o valor da unidade:
            mfhi $s2

        # Dezena:
            # Para facilitar vamos subtrair o valor da unidade do valor inserido: 597 - 7 = 590. Depois vamos pegar o resto da divisão por 100, logo, vamos ter: quociente = 5 e resto = 90, sendo o rsto igual as dezenas do número. Para fins de formatação, vamos dividir por por 10 para retiramos o 0 do resultado das dezenas.
            # Devemos subtrair o valor da unidade do valor total para facilitar separar a dezena:
            sub $s3, $s0, $s2
            # Dividindo o valor por 100 para encontrarmos o valor da dezena:
            div $s3, $t1
            # Pegando o resto que é equivalente a dezena:
            mfhi $s3
            # Dividindo o valor por 10 para retirarmos o 0:
            div $s3, $t0
            # Pegando o quociente da divisão por 10:
            mflo $s3

        # Centena:
            # Para encontrarmos a centena vamos subtrair a soma das dezenas com a unidades e dividirmos por 100 para retirarmos os zeros: num - ((dezenas * 10) + unidade) -> 597 - ((9 * 10) + 7) = 597 - 97 = 500. E dividirmos por 100 para retirarmos os 2 zeros, para fins de formatação...
            # Registrador $t2 irá armazanar a soma ((dezena * 10) + unidades):
            # Dezena x 10:
            mul $t2, $s3, $t0
            # Multiplicação + unidades:
            add $t2, $t2, $s2
            # Subtrair do valor inserido a soma
            sub $s4, $s0, $t2
            # Dividir por 100 para dirarmos os zeros:
            div $s4, $t1
            # Pegando quociente da divisão:
            mflo $s4

    mostrar:
        # Mostrar valor inserido:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgValorDigitadoFoi # Colocar msgValorDigitadoFoi em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Execução 1: Escrita de Inteiro
        move $a0, $s0 # Colocar em $a0 o valor de $s0 (valor inserido pelo usuário)
        syscall # Executar

        # Mostrar centena do valor inserido:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgCentena # Colocar msgCentena em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Escrita de Inteiro
        move $a0, $s4 # Colocar o valor de $s2 (valor da centena do número) em $a0
        syscall # Executar

        # Mostrar dezena do valor inserido:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgDezena # Colocar msgDezena em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Execução 1: Escrita de Caracteres
        move $a0, $s3 # Colocar o valor de $s3 (valor da dezena do número) em $a0
        syscall # Executar

        # Mostrar unidade do valor inserido:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de Caracteres
        la $a0, msgUnidade # Colocar msgUnidade em $a0
        syscall # Executar
        # Valor:
        li $v0, 1 # Execução 1: Escrita de Inteiro
        move $a0, $s2 # Colocar valor de $s2 (valor da unidade do número) em $a0
        syscall # Executar

    finalizar:
        li $v0, 10 # Execução 10: Finalizar Programa
        syscall # Executar