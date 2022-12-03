; EN-US Translate the following algorithm in C language to Assembly language
; PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
; int v[3];
; v[1] = 12; 
; v[2] = 15;
; v[0] = v[1] + v[2];

.data 
Vetor:
.align 2    ; align correctly word's position //  alinhará a palavra na posição correta
.space 12   ; allocate 3 spaces on array      //  aloca 3 espaços no array

.text
li $t3, 4
move $t0, $t3  ; index of array // indíce do array 
li $t4, 12 
move $t1, $t4  ; initial value to the array // valor a ser colocado no array inicial
li $t2, 12     ; array's size // tamanho do array

sw $t1, Vetor($t0)
addi $t0, $t0, 4   ; steps of 4 at a time in memory // anda de 4 em 4 na memória 
li $t1, 15         ; value allocated // valor colocado

addu $t4, $t4 , $t1
sw $t1, Vetor($t0) 

move $t0, $zero 
move $t1, $t4
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
