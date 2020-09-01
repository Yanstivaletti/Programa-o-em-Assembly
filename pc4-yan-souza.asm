# Module Name: pc4-yan-souza.asm
# Nome: Yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Funções: scan,somador1,somador2,digito1,digito2,caso10_1,caso10_2,printa,end
# Data de Implementaçao: Inicio: 20/08/2019 Fim: 23/09/2019
# Linguagem Usada: Assembly MIPS
.data
   Id_digit: .space 40
   Informe: .asciiz "Informe os primeiros 10 digitos do CPF "
   Traço: .asciiz "-"   
.text

 li $v0, 4
 la $a0, Informe
 syscall
 
  add $s1,$zero,0 #somador na primeira operaçao, verifica1
  add $t5,$zero,0 #usado na funçao verifica1 como somador de cada termo
  add $s4,$zero,0 #usado na funçao verifica2 como somador de cada termo
  add $t1,$zero,0 #t1 é usado como contador
  add $t2,$zero,0 #t2 é usado como contador
  add $t3,$zero,10 #usado para a multiplicaçao de cada termo
  add $t6,$zero,10 #usado para multiplicar por 10 nas Funçoes Resto_
  add $t4,$zero,11 #usado para dividir por 11 nas Funçoes Resto_
  add $t7,$zero,36 #usado para alocar o segundo numero na penultima posiçao do vetor
  add $t8,$zero,40 #usado para alocar o segundo numero na ultima posiçao do vetor
  
 
  
 scan: 
  beq $t2,36,somador1  
  
  li $v0,5
  syscall
  
  move $s1,$v0
  sw $s1 Id_digit($t2) 
  add $t2, $t2, 4
  j scan
  
 
 
somador1:
   beq $t1,36,digito1   #quando termninar de somar todos os numeros ele irá para a funçao Resto1 
   lw  $s2 ,Id_digit($t1)  #encontra o numero no vetor
   mul $s2,$t3,$s2  #faz a multiplicaçao dos termos 

   add $s1,$s1,$s2  #soma todos os termos

   sub $t3,$t3,1 #subtrai 1 do contador
   add $t1,$t1,4 #soma 4 para andar no vetor
   j somador1 #loop
   
 
 
 somador2:
   
   beq $t6,1,digito2  #quando termninar de somar todos os numeros ele irá para a funçao Resto1
   lw  $s2,Id_digit($t1)   #encontra o numero no vetor
   mul $s2,$t6,$s2   #faz a multiplicaçao dos termos 
   
   add $s4,$s4,$s2
   sub $t1, $t1,4
   sub $t6,$t6,1 
   
   j somador2 #loop
   
digito1:
  mul $s1,$t6,$s1 #multiplica por 10
  div $s1,$t4 #divide por 11
  mfhi $s7 
  beq $s7,10,caso10_1 #trata o caso do resto ser 10
  sw $s7 Id_digit($t7) #aloca o novo digito no vetor
  li $t1,0 #reseta o contador
  
  j somador2

  
digito2:

  mul $s4,$t6,$s4 #multiplica por 10
  div $s4,$t4 #divide por 11
  mfhi $s6
  beq $s6,10,caso10_2 #trata o caso do resto ser 10
  sw $s6 Id_digit($t8)  #aloca o novo digito no vetor
  li $t1,0 #reseta o contador
  j printa
  

  
printa:  
  beq $s0,36,end  #depois do 9º digito o programa vai para a funçao end
  lw $s2 , Id_digit($s0)
  
  move $a0,$s2  #printa o digito
  li $v0,1
  syscall
  
  add $s0,$s0,4 #contador
  
  j printa #loop
  

  
 end: 
  li $v0,4
  la $a0,Traço #printa o traço
  syscall
   
  move $a0,$s7
  li $v0,1  #printa o penultimo digito do cpf
  syscall
  
  move $a0,$s6
  li $v0,1  #printa o ultimo digito do cpf
  syscall
  
  li $v0, 10  #termina o programa
  syscall
  
caso10_1: 
  li $s7,0
  sw $s7 Id_digit($t7) #instancia o registrador com zero caso o resto for 10
  li $t1,0
  
  j somador2
  
caso10_2: 
  li $s6,0
  sw $s6 Id_digit($t8)  #instancia o registrador com zero caso o resto for 10
  li $t1,0
  j printa
