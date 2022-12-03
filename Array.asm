; EN-US Translate the following algorithm in C language to Assembly language
; PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
; int v[10];
; v[0] = 5;
; v[1] = 6;
; v[2] = 7; 
; v[3] = 8;
; v[4] = 9;
; v[5] = 10;
; v[6] = 2;
; v[7] = 4;
; v[8] = 8;
; v[9] = 42;

.data 
Vetor:
.align 2  ; align correctly word's position //  alinhará a palavra na posição correta
.space 40 ; allocate 10 spaces on array     //  aloca 10 espaços no array

.text
move $t0, $zero ; index of array // indíce do array
li $t3, 5

move $t1, $t3   ; initial value to the array // valor a ser colocado no array inicial
li  $t2, 40     ; array's size // tamanho do array

sw $t1, Vetor($t0)
addi $t0, $t0, 4   ; steps of 4 at a time in memory // anda de 4 em 4 na memória 
li $t1, 6          ; value allocated // valor colocado


sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 7
sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 8

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 9

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 10 

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 2

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 4

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 8

sw $t1, Vetor($t0)
addi $t0, $t0, 4
li $t1, 42

sw $t1, Vetor($t0)

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
