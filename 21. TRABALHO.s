# Ex. nº47. Criar um algoritmo que leia um número maior que zero e diga se o número é octal ou não. Garanta que os números lidos sejam maiores que zero e, caso não seja, deve ser novamente solicitado.
.data
    msgTitulo: .asciiz "--------- SISTEMA DE VERIFICACAO DE NUMEROS OCTAIS --------- "
    msgOrientacao1: .asciiz "\n-> DIGITE OS DIGITOS DO NUMERO DA DIREITA PARA A ESQUERDA! <-"
    msgOrientacao2: .asciiz "\n->           O NUMERO PODERA TER ATE 16 DIGITOS!           <-"
    msgInserirIninio: .asciiz "\nDigite o "
    msgInserirFinal: .asciiz "º digito do numero!\n->"

    msgDesejo: .asciiz "\nO numero possui mais algum digito?\nDigite:\n1- Sim\n2- Não\n-> "

    msgTodosDigitosInseridos: .asciiz "\n-> TODOS OS 16 DIGITOS JA FORAM INSERIDOS! <-"

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

    enquanto:
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

                # Caso o valor inserido seja maior que 10, ele é inválido:
                    bgt $a0, 10, lerNumero

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
                        beq $t0, 14, digitoQnumQuatorze
                    # Caso seja o 15º dígito inserido deve colocá-lo em $s5:
                        beq $t0, 15, digitoQuinze
                    # Caso seja o 16º dígito inserido deve colocá-lo em $s6:
                        beq $t0, 16, digitoDezesseis

                    # Colocando nos registradores:
                    digitoUm:
                        move $t1, $a0
                    digitoDois:
                        move $t2, $a0
                    digitoTres:
                        move $t3, $a0
                    digitoQuatro:
                        move $t4, $a0
                    digitoCinco:
                        move $t5, $a0
                    digitoSeis:
                        move $t6, $a0
                    digitoSete:
                        move $t7, $a0
                    digitoOito:
                        move $t8, $a0
                    digitoNove:
                        move $t9, $a0
                    digitoDez:
                        move $s0, $a0
                    digitoOnze:
                        move $s1, $a0
                    digitoDoze:
                        move $s2, $a0
                    digitoTreze:
                        move $s3, $a0
                    digitoQuatorze:
                        move $s4, $a0
                    digitoQuinze:
                        move $s5, $a0
                    digitoDezesseis:
                        move $s6, $a0

                    add $s7, $a0, $zero

            # Verificar se serão inseridos mais digitos:
            desejo:
                # Mensagem:
                    li $v0, 4 # Execução 4: Escrita de caracteres
                    la $a0, msgDesejo # Colocar msgDesejo em $a0
                    syscall # Executar
                # Leitura:
                    li $v0, 5 # Execução 5: Leitura de inteiro
                    syscall # Executar

                # Caso o usuário escolha a segunda opção:
                    beq $a0, 2, analisarNumero
                # Caso ele não escolha nenhuma das duas opções:
                    j desejo

                primeiraOpcao:
                    # Caso o número tenha mais digitos, o último digitado não pode ser negativo:
                        blt $s7, $zero, lerNumero
                    # Caso o último dígito não seja negativo, vamos verificar quantos digitos o usuário já digitou... caso for menos que 17, permite que ele insira o próximo:
                        blt $t0, 17, insercao
                    # Caso já inseriu todos os dígitos, avisa ao usuário e parte para a próxima etapa:
                        # Mensagem:
                        li $v0, 4 # Execução 4: Escrita de caracteres
                        la $a0, msgTodosDigitosInseridos # Colocar msgTodosDigitosInseridos em $a0
                        syscall # Executar

    
    analisarNumero:



    # Finalizar programa:
    finalizar:
    li $v0, 10 # Execução 10: Encerrar programa
    syscall # Encerrar
