# Ex. nº47. Criar um algoritmo que leia um número maior que zero e diga se o número é octal ou não. Garanta que os números lidos sejam maiores que zero e, caso não seja, deve ser novamente solicitado.
.data
    msgTitulo:      .asciiz "----------- SISTEMA DE VERIFICACAO DE NUMEROS OCTAIS -----------"
    msgOrientacao1: .asciiz "\n-> DIGITE OS DIGITOS DO NUMERO DA DIREITA PARA A ESQUERDA! <-"
    msgOrientacao2: .asciiz "\n->           O NUMERO PODERA TER ATE 16 DIGITOS!           <-"
    msgOrientacao3: .asciiz "\n->         O NUMERO DEVERA SER DIFERENTE DE ZERO!          <-"
    msgInserirIninio: .asciiz "\nDigite o "
    msgInserirFinal: .asciiz "º digito do numero!\n->"

    msgDesejoAddCaractere: .asciiz "\nO numero possui mais algum digito?\nDigite:\n1- Sim\n2- Não\n-> "

    msgTodosDigitosInseridos: .asciiz "\n-> TODOS OS 16 DIGITOS JA FORAM INSERIDOS! <-"

    msgNumIgualZero: .asciiz "\nLEMBRE-SE: O NUMERO DEVE SER DIFERENTE DE ZERO!!!"

    msgDigitoInvalido: .asciiz "\nDIGITE: 0, 1, 2, 3, 4, 5, 6, 7, 8 OU 9!!!"

    msgEhOctal1: .asciiz "\nO NUMERO ("
    msgEhOctal2: .asciiz ") EH OCTAL!!!\n"

    msgNaoEhOctal1: .asciiz "\nO NUMERO ("
    msgNaoEhOctal2: .asciiz ") NAO EH OCTAL!!!\n"

    msgDesejoContinuar: .asciiz "\nVoce deseja verificar mais algum numero?\nDigite:\n1- Sim\n2- Nao\n-> "

    msgDespedida: .asciiz "\nTudo bem... foi bom ter voce conosco!!! (^_^)"


.text
main:
    # Mostrar título do programa:
    li $v0, 4 # Execução 4: Mostrar caracteres
    la $a0, msgTitulo # Colocar msgTitulo em $a0
    syscall # Executar

    # Mostrar orientações:
    li $v0, 4 # Execução 4: Mostrar caracteres
    la $a0, msgOrientacao1 # Colocar msgOrientacao1 em $a0
    syscall # Executar
    li $v0, 4 # Execução 4: Mostrar caracteres
    la $a0, msgOrientacao2 # Colocar msgOrientacao2 em $a0
    syscall # Executar
    li $v0, 4 # Execução 4: Mostrar caracteres
    la $a0, msgOrientacao3 # Colocar msgOrientacao3 em $a0
    syscall # Executar

    enquanto:
        j inicializandoRegistradores
        # Mensagem caso o usuário tenha digitado um número igual a zero:
        numIgualZero:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgNumIgualZero # Colocar msgNumIgualZero em $a0
            syscall # Executar

        inicializandoRegistradores:
            # Registradores livres: $t0 a $t9 e $s0 a $s7
            # $t0 será o contador auxiliar que será responsável por contablizar a quantidade de dígitos inseridos pelo usuário:
            li $t0, 0
            # $s7 também será utilizado como registrador auxiliar
            li $s7, 0 
            # O usuário irá inserir os digitos do número da direita para a esquerda, a partir disso:
            # $t1 irá armazenar o 1º dígito
            # $t2 irá armazenar o 2º dígito
            # $t3 irá armazenar o 3º dígito
            # $t4 irá armazenar o 4º dígito
            # $t5 irá armazenar o 5º dígito
            # $t6 irá armazenar o 6º dígito
            # $t7 irá armazenar o 7º dígito
            # $t8 irá armazenar o 8º dígito
            # $t9 irá armazenar o 9º dígito
            # $s0 irá armazenar o 10º dígito
            # $s1 irá armazenar o 11º dígito
            # $s2 irá armazenar o 12º dígito
            # $s3 irá armazenar o 13º dígito
            # $s4 irá armazenar o 14º dígito
            # $s5 irá armazenar o 15º dígito
            # $s6 irá armazenar o 16º dígito
            # Inicializando todos os registradores com o valor 0:
                li $t1, 0
                li $t2, 0
                li $t3, 0
                li $t4, 0
                li $t5, 0
                li $t6, 0
                li $t7, 0
                li $t8, 0
                li $t9, 0
                li $s0, 0
                li $s1, 0
                li $s2, 0
                li $s3, 0
                li $s4, 0
                li $s5, 0
                li $s6, 0

        insercao:
            # Adicionar 1 ao contador de dígitos:
            add $t0, $t0, 1

            # Ler número:
            lerNumero:
                j leitura
                digitoInvalido:
                    # Mensagem:
                    li $v0, 4 # Execução 4: Escrita de caracteres
                    la $a0, msgDigitoInvalido # Colocar msgDigitoInvalido em $a0
                    syscall # Executar

                leitura:
                    # Mensagem:
                        # Início da mensagem:
                        li $v0, 4 # Execução 4: Escrita de caracteres
                        la $a0, msgInserirIninio # Colocar msgInserirIninio em $a0
                        syscall # Executar
                        # Mostrar contador de dígitos:
                        li $v0, 1 # Execução 1: Escrita de inteiro
                        move $a0, $t0 # Colocar em $a0 o valor de $t0 (dígito a ser inserido)
                        syscall # Executar
                        # Final da mensagem:
                        li $v0, 4 # Execução 4: Escrita de caracteres
                        la $a0, msgInserirFinal # Colocar msgInserirFinal em $a0
                        syscall # Executar
                    # Leitura:
                        li $v0, 5 # Execução 5: Leitura de inteiro
                        syscall # Executar

                    # Caso o valor inserido seja maior que 9 ou menor que 0, ele é inválido:
                        bgt $v0, 9, digitoInvalido
                        blt $v0, $zero, digitoInvalido

                        # Adicionar dígito ao seu devido registrador:
                        # Caso seja o 1º dígito inserido deve colocá-lo em $t1:
                            beq $t0, 1, digitoUm
                        # Caso seja o 2º dígito inserido deve colocá-lo em $t2:
                            beq $t0, 2, digitoDois
                        # Caso seja o 3º dígito inserido deve colocá-lo em $t3:
                            beq $t0, 3, digitoTres
                        # Caso seja o 4º dígito inserido deve colocá-lo em $t4:
                            beq $t0, 4, digitoQuatro
                        # Caso seja o 5º dígito inserido deve colocá-lo em $t5:
                            beq $t0, 5, digitoCinco
                        # Caso seja o 6º dígito inserido deve colocá-lo em $t6:
                            beq $t0, 6, digitoSeis
                        # Caso seja o 7º dígito inserido deve colocá-lo em $t7:
                            beq $t0, 7, digitoSete
                        # Caso seja o 8º dígito inserido deve colocá-lo em $t8:
                            beq $t0, 8, digitoOito
                        # Caso seja o 9º dígito inserido deve colocá-lo em $t9:
                            beq $t0, 9, digitoNove
                        # Caso seja o 10º dígito inserido deve colocá-lo em $s0:
                            beq $t0, 10, digitoDez
                        # Caso seja o 11º dígito inserido deve colocá-lo em $s1:
                            beq $t0, 11, digitoOnze
                        # Caso seja o 12º dígito inserido deve colocá-lo em $s2:
                            beq $t0, 12, digitoDoze
                        # Caso seja o 13º dígito inserido deve colocá-lo em $s3:
                            beq $t0, 13, digitoTreze
                        # Caso seja o 14º dígito inserido deve colocá-lo em $s4:
                            beq $t0, 14, digitoQuatorze
                        # Caso seja o 15º dígito inserido deve colocá-lo em $s5:
                            beq $t0, 15, digitoQuinze
                        # Caso seja o 16º dígito inserido deve colocá-lo em $s6:
                            beq $t0, 16, digitoDezesseis

                        # Colocando nos registradores:
                        digitoUm:
                            move $t1, $v0
                            j desejoAddCaractere
                        digitoDois:
                            move $t2, $v0
                            j desejoAddCaractere
                        digitoTres:
                            move $t3, $v0
                            j desejoAddCaractere
                        digitoQuatro:
                            move $t4, $v0
                            j desejoAddCaractere
                        digitoCinco:
                            move $t5, $v0
                            j desejoAddCaractere
                        digitoSeis:
                            move $t6, $v0
                            j desejoAddCaractere
                        digitoSete:
                            move $t7, $v0
                            j desejoAddCaractere
                        digitoOito:
                            move $t8, $v0
                            j desejoAddCaractere
                        digitoNove:
                            move $t9, $v0
                            j desejoAddCaractere
                        digitoDez:
                            move $s0, $v0
                            j desejoAddCaractere
                        digitoOnze:
                            move $s1, $v0
                            j desejoAddCaractere
                        digitoDoze:
                            move $s2, $v0
                            j desejoAddCaractere
                        digitoTreze:
                            move $s3, $v0
                            j desejoAddCaractere
                        digitoQuatorze:
                            move $s4, $v0
                            j desejoAddCaractere
                        digitoQuinze:
                            move $s5, $v0
                            j desejoAddCaractere
                        digitoDezesseis:
                            move $s6, $v0
                            j desejoAddCaractere

            # Verificar se serão inseridos mais digitos:
            desejoAddCaractere:
                # Colocando o último valor inserido pelo usuário em $s7 para futura verificação do seu valor:
                add $s7, $v0, $zero
                # Mensagem:
                    li $v0, 4 # Execução 4: Escrita de caracteres
                    la $a0, msgDesejoAddCaractere # Colocar msgDesejoAddCaractere em $a0
                    syscall # Executar
                # Leitura:
                    li $v0, 5 # Execução 5: Leitura de inteiro
                    syscall # Executar

                # Caso o usuário tenha escolhido a primeira opção:
                    beq $v0, 1, primeiraOpcao
                # Caso o usuário escolha a segunda opção:
                    beq $v0, 2, analisarNumero
                # Caso ele não escolha nenhuma das duas opções:
                    j desejoAddCaractere

                primeiraOpcao:
                    # Caso o número tenha mais digitos, vamos verificar quantos digitos o usuário já digitou... caso for menos que 16, permite que ele insira o próximo:
                        blt $t0, 16, insercao
                    # Caso já inseriu todos os dígitos, avisa ao usuário e parte para a próxima etapa:
                        # Mensagem:
                        li $v0, 4 # Execução 4: Escrita de caracteres
                        la $a0, msgTodosDigitosInseridos # Colocar msgTodosDigitosInseridos em $a0
                        syscall # Executar

        
        analisarNumero:
        # Verificar se o número digitado pelo usuário é igual 0. Para isso, vamos somar o valor de todos os dígitos... caso ele seja igual a zero, vamos pedir para o usuário digitar novamente o número:
        li $s7, 0
        add $s7, $t1, $t2
        add $s7, $s7, $t3
        add $s7, $s7, $t4
        add $s7, $s7, $t5
        add $s7, $s7, $t6
        add $s7, $s7, $t7
        add $s7, $s7, $t8
        add $s7, $s7, $t9
        add $s7, $s7, $s0
        add $s7, $s7, $s1
        add $s7, $s7, $s2
        add $s7, $s7, $s3
        add $s7, $s7, $s4
        add $s7, $s7, $s5
        add $s7, $s7, $s6
        # Verificar se a soma é igual a zero:
        beq $s7, $zero, numIgualZero

        # Verificar se o número digitaddo pelo usuário é octal:
            # Caso qualquer dígito inserido pelo usuário seja maior que 7, o número não é octal:
            bgt $t1, 7, naoEhOctal
            bgt $t2, 7, naoEhOctal
            bgt $t3, 7, naoEhOctal
            bgt $t4, 7, naoEhOctal
            bgt $t5, 7, naoEhOctal
            bgt $t6, 7, naoEhOctal
            bgt $t7, 7, naoEhOctal
            bgt $t8, 7, naoEhOctal
            bgt $t9, 7, naoEhOctal
            bgt $s0, 7, naoEhOctal
            bgt $s1, 7, naoEhOctal
            bgt $s2, 7, naoEhOctal
            bgt $s3, 7, naoEhOctal
            bgt $s4, 7, naoEhOctal
            bgt $s5, 7, naoEhOctal
            bgt $s6, 7, naoEhOctal

        # Caso passe por todas as verificações, o número é octal:
        ehOctal:
            # Início da Mensagem:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgEhOctal1 # Colocar msgEhOctal1 em $a0
            syscall # Executar
            # Mostrar número:
                # 16º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s6 # Colocar o valor de $s6 (valor 16º dígito do número) em $a0
                syscall # Executar
                # 15º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s5 # Colocar o valor de $s5 (valor 15º dígito do número) em $a0
                syscall # Executar
                # 14º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s4 # Colocar o valor de $s4 (valor 14º dígito do número) em $a0
                syscall # Executar
                # 13º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s3 # Colocar o valor de $s3 (valor 13º dígito do número) em $a0
                syscall # Executar
                # 12º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s2 # Colocar o valor de $s2 (valor 12º dígito do número) em $a0
                syscall # Executar
                # 11º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s1 # Colocar o valor de $s1 (valor 11º dígito do número) em $a0
                syscall # Executar
                # 10º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s0 # Colocar o valor de $s0 (valor 10º dígito do número) em $a0
                syscall # Executar
                # 9º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t9 # Colocar o valor de $t9 (valor 9º dígito do número) em $a0
                syscall # Executar
                # 8º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t8 # Colocar o valor de $t8 (valor 8º dígito do número) em $a0
                syscall # Executar
                # 7º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t7 # Colocar o valor de $t7 (valor 7º dígito do número) em $a0
                syscall # Executar
                # 6º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t6 # Colocar o valor de $t6 (valor 6º dígito do número) em $a0
                syscall # Executar
                # 5º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t5 # Colocar o valor de $t5 (valor 5º dígito do número) em $a0
                syscall # Executar
                # 4º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t4 # Colocar o valor de $t4 (valor 4º dígito do número) em $a0
                syscall # Executar
                # 3º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t3 # Colocar o valor de $t3 (valor 3º dígito do número) em $a0
                syscall # Executar
                # 2º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t2 # Colocar o valor de $t2 (valor 2º dígito do número) em $a0
                syscall # Executar
                # 1º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t1 # Colocar o valor de $t1 (valor 1º dígito do número) em $a0
                syscall # Executar
            # Final da Mensagem:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgEhOctal2 # Colocar msgEhOctal2 em $a0
            syscall # Executar
            # Pula para a pergunta:
            j desejoContinuar
        
        # Caso ele não passe em todas as verificações, ele não é octal:
        naoEhOctal:
            # Início da Mensagem:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgNaoEhOctal1 # Colocar msgNaoEhOctal1 em $a0
            syscall # Executar
            # Mostrar número:
                # 16º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s6 # Colocar o valor de $s6 (valor 16º dígito do número) em $a0
                syscall # Executar
                # 15º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s5 # Colocar o valor de $s5 (valor 15º dígito do número) em $a0
                syscall # Executar
                # 14º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s4 # Colocar o valor de $s4 (valor 14º dígito do número) em $a0
                syscall # Executar
                # 13º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s3 # Colocar o valor de $s3 (valor 13º dígito do número) em $a0
                syscall # Executar
                # 12º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s2 # Colocar o valor de $s2 (valor 12º dígito do número) em $a0
                syscall # Executar
                # 11º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s1 # Colocar o valor de $s1 (valor 11º dígito do número) em $a0
                syscall # Executar
                # 10º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $s0 # Colocar o valor de $s0 (valor 10º dígito do número) em $a0
                syscall # Executar
                # 9º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t9 # Colocar o valor de $t9 (valor 9º dígito do número) em $a0
                syscall # Executar
                # 8º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t8 # Colocar o valor de $t8 (valor 8º dígito do número) em $a0
                syscall # Executar
                # 7º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t7 # Colocar o valor de $t7 (valor 7º dígito do número) em $a0
                syscall # Executar
                # 6º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t6 # Colocar o valor de $t6 (valor 6º dígito do número) em $a0
                syscall # Executar
                # 5º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t5 # Colocar o valor de $t5 (valor 5º dígito do número) em $a0
                syscall # Executar
                # 4º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t4 # Colocar o valor de $t4 (valor 4º dígito do número) em $a0
                syscall # Executar
                # 3º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t3 # Colocar o valor de $t3 (valor 3º dígito do número) em $a0
                syscall # Executar
                # 2º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t2 # Colocar o valor de $t2 (valor 2º dígito do número) em $a0
                syscall # Executar
                # 1º dígito:
                li $v0, 1 # Execução 1: Escrita de inteiro
                move $a0, $t1 # Colocar o valor de $t1 (valor 1º dígito do número) em $a0
                syscall # Executar
            # Final da Mensagem:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgNaoEhOctal2 # Colocar msgNaoEhOctal2 em $a0
            syscall # Executar
        
        # Verificar se o usuário deseja verificar mais algum número:
        desejoContinuar:
            # Mensagem:
            li $v0, 4 # Execução 4: Escrita de caracteres
            la $a0, msgDesejoContinuar # Colocar msgDesejoContinuar em $a0
            syscall # Executar
            # Leitura:
            li $v0, 5 # Execução 5: Leitura de inteiro
            syscall # Executar
            
            # Verificar desejo do usuário:
            beq $v0, 1, enquanto
            beq $v0, 2, mensagemDespedida
            j desejoContinuar

    
    mensagemDespedida:
        # Mensagem:
        li $v0, 4 # Execução 4: Escrita de caracteres
        la $a0, msgDespedida # Colocar msgDespedida em $a0
        syscall # Executar
    

    # Finalizar programa:
    finalizar:
    li $v0, 10 # Execução 10: Encerrar programa
    syscall # Encerrar
