# EN-US Translate the following algorithm in C language to Assembly language
# PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
#
# int a;
# a = a + 2;
# a = 0;
# a = a - 3;
# a = 5;
# a = a ^ a;
# a = pow(a, a);

.data 
a: .word 
i: .word 1 

.text
# load a // carrega a
la $8, a      # address a into register 8 // endereço de a dentro do registrador 8
lw $8, ($8)   # value of addres of a into register 8 // conteúdo do endereço de a no registrador 8

# load i // carrega i
la $9, i
lw $9, ($9)

addi $8, $8, 2   # a+=2
li  $8, 0        # a = 0 
subiu $8, $8, 3  # a = a -3
li  $8, 5        # a = 5
xor $8, $8, $8   # a = a ^ a;
li  $11, 5        

#  a power a // potência de a por a
potencia:
  slt $10, $9, $8 # if i 
  bne $10, 1, END #false -> else  
  potencia_loop:  
  mul $11, $11, $8 # a * a 
  addi $9, $9, 1 # i ++
j potencia

END:

# output on terminal // saída no terminal
li $v0, 1
  move $a0, $11
  syscall
