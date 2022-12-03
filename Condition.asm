; EN-US Translate the following algorithm in C language to Assembly language
; PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
; int a, b;
; int a = 0;
; int b = 1;
; if ( a > b ){
;     a = 5;
;     b = 3;
; } else if ( a == b ){
;     a = 2;
;     b = 4;
; } else {
;     a = 1;
;     a = 2;
; }

.data 
  a: .word   ; int a 
  b: .word   ; int b

.text 
  la $t4, a      ; a's addres into register t4 // endereço de a dentro do registrador t4
  lw $t4, ($t4)  ; value of a's addres into register t4 // conteúdo do endereço de a no registrador t4
  li $t4, 0      ; addres of a with value 0 // endereço de a contém valor zero

  la $t5, b      ; b's addres into register t5 // endereço de b dentro do registrador t5
  lw $t5, ($t5)  ; value of b's addres into register t5 //conteúdo do endereço de b no registrador t5
  li $t5, 1      ; addres of b with value one // endereço de b contém valor um

  if:
    bgt $t4, $t5, elseif   ; if( a > b ){
    li $t4, 5              ;     a = 5;
    li $t5, 3              ;     b = 3; 

  elseif:
    beq $t4, $t5, else     ; elseif( a == b ){
    li $t4, 2              ;     a = 2;
    li $t5, 4              ;     b = 4; 

  else:                    ; else{
    li $t4, 1              ;     a = 1;
    li $t5, 2              ;     b = 2; 
