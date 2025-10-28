.data
    msgBoasVindas: .asciiz "------------Seja muito bem-vindo(a)!------------"
    msgDigiteValorCompra: .asciiz "\n-> A LOJA VENDE APENAS PRODUTOS NA FAIXA DE R$ 1.000,00 A R$ 9.999,99! <-\nDigite o valor da compra: R$ "
    msgDigiteValorPrimeiraParcela: .asciiz "\n-> AS PARCELAS DEVEEM SER NO MINIMO R$ 100,00 E NO MAXIMO R$ 500,00! <-\nO valor da primeira parcela corresponderá ao valor de todas as parcelas menos da ultima que pode ser diferente das demais!\nDigite o valor da primeira parcela da compra: "
    msgDigiteValorUltimParcela: .asciiz "\nO valor da ultima parcela podera ser igual ou menor ao valor das outras!\nDigite o valor da ultima parcela da compra: "
    msgQuantidadeDeParcelas: .asciiz "\nTotal de Parcelas: "

    msgErro: .asciiz "\nCom os valores das parcelas inseridas, o cliente nao poderia quitar a divida sem pagar a mais para a loja! Por favor, insira novamente: "

.text
main:
    # Boas vindas:
    li $v0, 4 # Execução 4: Escrita de Caracteres
    la $a0, msgBoasVindas # Colocar msgBoasVindas em $a0
    syscall # Executar

    enquanto_nao_eh_possivel_quitar_a_divida_com_os_valores_digitados:
        # Comando 'jump' para pular a mensagem de erro na primeira vez que o código rodar:
        j enquanto_valorCompra_invalido

        msgvaloresDasParcelasInvalidas:
            # Mostrar mensagem de erro:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgErro # Colocar msgErro em $a0
            syscall # Executar

        enquanto_valorCompra_invalido:
            # Ler valor da primeira compra:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgDigiteValorCompra # Colocar msgDigiteValorCompra em $a0
            syscall # Executar
            # Leitura:
            li $v0, 5 # Execução 5: Leitura de Inteiro
            syscall # Executar
            move $s0, $v0 # Colocar no registrador $s0 o valor de $v0 (valor inserido pelo usuário)

            # Verficar se o valor inserido pelo usuário não é maior que R$9999.99, nem menor que R$1000.00:
            li $t0, 9999
            li $t1, 1000

            bgt $s0, $t0, enquanto_valorCompra_invalido
            blt $s0, $t1, enquanto_valorCompra_invalido

        enquanto_valorPrimeiraParcela_invalido:
            # Ler valor da primeira parcela:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgDigiteValorPrimeiraParcela # Colocar msgDigiteValorPrimeiraParcela em $a0
            syscall # Executar
            # Leitura:
            li $v0, 5 # Execução 5: Leitura de Inteiro
            syscall # Executar
            move $s1, $v0 # Colocar no registrador $s1 o valor de $v0 (valor inserido pelo usuário)

            # Verificar se o valor inserido pelo usuário não é menor que 100, nem maior que 500:
            li $t0, 100
            li $t1, 500

            blt $s1, $t0, enquanto_valorPrimeiraParcela_invalido
            bgt $s1, $t1, enquanto_valorPrimeiraParcela_invalido

        enquanto_valorUltimaParcela_invalido:
            # Ler valor da última parcela:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgDigiteValorUltimParcela # Colocar msgDigiteValorUltimParcela em $a0
            syscall # Executar
            # Leitura:
            li $v0, 5 # Execução 5: Leitura de Inteiro
            syscall # Executar
            move $s2, $v0 # Colocar em $s2 o valor de $v0 (valor inserido pelo usuário)

            # Verificar se o valor inserido pelo usuário não é menor que 100, nem maior que 500 e nem maior que o restante das parcelas:
            li $t0, 100
            li $t1, 500

            blt $s2, $t0, enquanto_valorUltimaParcela_invalido
            bgt $s2, $s1, enquanto_valorUltimaParcela_invalido
            bgt $s2, $t1, enquanto_valorUltimaParcela_invalido
            

        # Valor total da compra está em $s0
        # Valor da primeira parcela está em $s1
        # Valor da última parcela está em $s2
        # Quantidade de parcelas será armazenado em $s3:
        li $s3, 0
        # Iterador com valor igual a 1, será armazenado em $t0:
        li $t0, 1

        enquanto:
            # Na primeira vez que looping executar, vamos retirar do valor total o da última parcela:
            primeiraVez:
                sub $s0, $s0, $s2
                add $s3, $s3, $t0
            # Das outras vezes, vamos subtrair o valor da primira parcela até que o valor de $s0 seja igual a zero e vamos acrescentar mais uma parcela ao contador ($s3):
            segundaVezEmDiante:
                sub $s0, $s0, $s1
                add $s3, $s3, $t0

                # Verificando se $s0 é maior que zero:
                bgt $s0, $zero, segundaVezEmDiante
                # Caso o registrador $s0 esteja armazenando um valor menor que 0, significa que o cliente digitou o valor errado de alguma parcela que resultou com que ele pagasse "a mais" para a loja:
                blt $s0, $zero, msgvaloresDasParcelasInvalidas
        
        mostrar:
            # Mostrar total de parcelas:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de Caracteres
            la $a0, msgQuantidadeDeParcelas # Colocar msgQuantidadeDeParcelas em $a0
            syscall # Executar
            # Valor:
            li $v0, 1 # Execução 1: Escrita de Inteiro
            move $a0, $s3 # Colocar em $a0 o valor de $s3 (quantidade de parcelas da compra)
            syscall # Executar


    finalizar:
        li $v0, 10 # Execução 10: Finalizar programa
        syscall # Executar