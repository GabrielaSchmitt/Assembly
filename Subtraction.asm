# EN-US Translate the following algorithm in C language to Assembly language
# PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
#
# int a, b, c;
# a = 3;
# b = 5;
# c = a - b;

.data 
a: .word 3 # int a = 3
b: .word 5 # int b = 5
c: .word 

.text
# load a // carrega a
la $8, a
lw $8, ($8)

# load b // carrega b
la $9, b
lw $9, ($9)

# subtract a - b and allocate in register $10 // subtrai 3 - 5 e aloca no registrador $10
subu $10, $8, $9

# Store the result of the subtraction // Salva o resultado da subtração em c 
la $11, c
sw $10, ($11)
