# Module Name: pc2-yan-souza.asm
# Nome: Yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Data de Implementaçao: Inicio: 04/08/2019 Fim: 06/09/2019
# Linguagem Usada: Assembly MIPS

.data 
 Dividendo: .asciiz "Dividendo: "
 Divisor: .asciiz "Divisor: "     # Em data, estabelecemos todas as strings que serão usadas no programa
 Resultado: .asciiz "Resultado"
 Resto: .asciiz "Resto: "
 .text 
  li $v0,4
  la $a0,Dividendo   
  syscall
  
  li $v0,5
  syscall
  
  move $t0,$v0   # Nesse trecho movemos o valor registrado em v0 para t0,
                 # para que possamos realizar a divisão, faz-se o mesmo na linha 24
  
  li $v0,4
  la $a0,Divisor
  syscall
  
  li $v0,5
  syscall
  
  move $t1,$v0
  
  div $t0,$t1  #Ao usarmos o comando div, conseguimos dividir o valor em t0, pelo divisor em t1
  
  mflo $s3  
  mfhi $s4
  
  #Em s3 sera guardado o valor do quociente da divisão, 
  #já hi é o registrador responsável por guardar o resto de todas as divisoes realizadas
  
  li $v0,4
  la $a0,Resultado 
  syscall
  
  li $v0,1
  move $a0,$s3 #Esta parte é responsavel por printar o resultado
  syscall
  
  li $v0,4
  la $a0,Resto
  syscall
  
  li $v0,1
  move $a0,$s4   #Esta parte é responsavel por printar o resto
  syscall
  
  li $v0,10   #Filnaliza o programa
  syscall
  
  
  
  
