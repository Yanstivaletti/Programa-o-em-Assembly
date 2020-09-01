# Module Name: pc3-yan-souza.asm
# Nome: Yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Funções: Verifica, End, Par Impar.
# Data de Implementaçao: Inicio: 14/08/2019 Fim: 14/09/2019
# Linguagem Usada: Assembly MIPS

.data

  Digite: .asciiz "Digite um Numero: "
  espaco: .asciiz " "
  
.text
 # Printa String
  li $v0,4
  la $a0,Digite
  syscall
  
 #Le numero
  li $v0,5
  syscall
  move $t0,$v0
  
  #Setar numero 1
  add $t1,$zero,1 #inicializa o numero um para comparar e somar na funçao impar
  add $t2,$zero,2 #inicializa o numero dois para dividir na comparaçao
  add $t3,$zero,3 #inicializa o numero tres para multiplicar na funçao impar
  

 verifica:
  #Printa numero
  li $v0,1
  move $a0,$t0
  syscall
  
  li $v0,4
  la $a0,espaco
  syscall
  
  #Caso o programa chegue a 1
  beq $t1,$t0, end
  
  #divisao por 2, cheque se é par ou impar
  div $t0, $t2
  mfhi $s1
  beq $s1,$t1,impar
  j par
    
  
  impar: #Trata os numeros impares
  
  mult $t0,$t3
  mflo $t0
  add $t0,$t0,1
  j verifica
 
  
  par: #Trata os numeros pares
  
  div $t0,$t2
  mflo $t0
  j verifica  
  
  end: #Finaliza o programa
  
  li $v0, 10
  syscall
