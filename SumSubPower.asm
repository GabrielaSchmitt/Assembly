.data 
a: .word 
i: .word 1 

.text
# carrega a
la $8, a    # endereço de a dentro do registrador 8
lw $8, ($8)   # conteúdo do endereço de a no registrador 8

# carrega i
la $9, i
lw $9, ($9)

addi $8, $8, 2 # a+=2
li  $8, 0 # a = 0 
subiu $8, $8, 3 # a = a -3
li  $8, 5 # a = 5
li  $11, 5

# de a elevado a ele mesmo
potencia:
  slt $10, $9, $8 # if i 
  bne $10, 1, END #false -> else  
  potencia_loop:  
  mul $11, $11, $8 # a * a 
  addi $9, $9, 1 # i ++
j potencia

END:
# aqui adicionei a escrita do último resultado no terminal
li $v0, 1
  move $a0, $11
  syscall
