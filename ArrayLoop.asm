; EN-US Translate the following algorithm in C language to Assembly language
; PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
; int i, v[100];
; for (i = 0; i < 100; ++i){
;     v[i] = i;
; }

.data 
Vetor:
.align 2   ; align correctly word's position  //  alinhará a palavra na posição correta
.space 400 ; allocate 100 spaces on array     //  aloca 100 espaços no array

.text
move $t0, $zero ; index of array // indíce do array
move $t1, $zero ; initial value to the array // valor a ser colocado no array inicial
li  $t2, 400    ; array's size // tamanho do array

loop:  ; steps of 4 at a time in memory, value recieves 1, initiate vetor at zero // anda de 4 em 4 na memória, no valor soma 1, iniciando com zero o vetor
beq $t0, $t2, endOfLoop   ; while $t0 < 400 // enquanto $t0 < 400 
sw $t1, Vetor($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
sw $t1, Vetor($t0) 

j loop 

endOfLoop:

; funtion to print the output // função para imprimir a saída
move $t0, $zero 

imprime:
beq $t0, $t2, saiDaImpressao
li $v0, 1
lw $a0, Vetor($t0)

syscall

addi $t0, $t0, 4

j imprime 

saiDaImpressao: 
