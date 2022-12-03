; EN-US Translate the following algorithm in C language to Assembly language
; PT-BR Traduza o seguinte algoritmo na linguagem C para a linguagem Assembly
; int i, a, b, v[100];
; a = 0;
; b = 1;
; for ( i = 0; i < 100; ++i ){
;     v[i] = i + a + b;
;     a = a + b;
;     b = b + 3;
; }

.data 
  i: .word   ; int i
  a: .word   ; int a 
  b: .word   ; int b

Vetor:
  .align 2    ; align correctly word's position  //  alinhará a palavra na posição correta
  .space 400  ; allocate 100 spaces on array     //  aloca 100 espaços no array
  .text

  la $t4, a     ; a's addres into register t4 // endereço de a dentro do registrador t4
  lw $t4, ($t4) ; value of a's addres into register t4 // conteúdo do endereço de a no registrador t4
  li $t4, 0     ; addres of a with value 0 // endereço de a contém valor zero

  la $t5, b      ; b's addres into register t5 // endereço de b dentro do registrador t5
  lw $t5, ($t5)  ; value of b's addres into register t5 //conteúdo do endereço de b no registrador t5
  li $t5, 1      ; addres of b with value 1 // endereço de b contém valor um

  la $t6, i
  lw $t6, ($t6)
  li $t6, 0

  move $t0, $zero   ; index of array // indíce do array
  #move $t1, $zero  ; initial value to the array // valor a ser colocado no array inicial
  li  $t2, 400      ; array's size // tamanho do array

  loop: ; steps of 4 at a time in memory, value recieves 1, initiate $t3 at 5 // anda de 4 em 4 na memória, no valor soma 1, iniciando com $t3 = 5
    beq $t0, $t2, endOfLoop ; while $t0 < 400 // enquanto $t0 < 400 

    add $t4, $t4, $t5   ; a = a + b
    add $t3, $t1, $t4   ; aux = a + i

    sw $t3, Vetor($t0)  ; vetor[i] = aux
    addi $t5, $t5, 3    ; b = b + 3

    addi $t0, $t0, 4    ; next element of vetor // próximo elemento do vetor
    addi $t1, $t1, 1    ; i++

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
  
  ; notes: 
  ; t0 - endereço // addres
  ; t1 - contador - i // counter
  ; t2 - tamanho do array - limite loop // array's size - loop's limit
  ; t3 - valor temporario - aux // temporary value
  ; t5 - a
  ; t6 - b
