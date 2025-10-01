#4.Faça um algoritmo que calcule e mostre a área de um trapézio usando apenas números inteiros.
#Sabe-se que: A = ((base maior + base menor) * altura)/2

.data
msgBMaior: .asciiz "\nQual o valor da base maior: "
msgBMenor: .asciiz "\nQual o valor da base menor: "
msgAltura: .asciiz "\nQual o valor da altura: "

msgResul: .asciiz "\nA area do trapexio e "

dois: .float 2.0

.text
main:
# Base maior:
# Mensagem:
li $v0, 4 # Execucao 4: 
la $a0, msgBMaior
syscall

li $v0, 6
syscall
mov.s $f1, $f0

# Base menor:
li $v0, 4
la $a0, msgBMenor
syscall

li $v0, 6
syscall
mov.s $f2, $f0

# Altura:
li $v0, 4
la $a0, msgAltura
syscall

li $v0, 6
syscall
mov.s $f3, $f0

# Somar base maior com a menor:
add.s $f1, $f1, $f2

# Multiplicar a soma da base maior com a menor pela altura:
mul.s $f1, $f1, $f3

# Dividir a multiplicacao da altura pela soma da base maior pela menor por dois:
l.s $f2, dois
div.s $f1, $f1, $f2

# Resultado
li $v0, 4
la $a0, msgResul
syscall

li $v0, 2
mov.s $f12, $f1
syscall

# Finalizar programa:
li $v0, 10
syscall