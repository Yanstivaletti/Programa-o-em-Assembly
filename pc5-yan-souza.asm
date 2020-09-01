# Module Name: pc5-yan-souza.asm
# Nome: Yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Fun��es: scan, delta, raizes
# Data de Implementa�ao: Inicio: 08/11/2019 Fim: 11/11/2019
# Linguagem Usada: Assembly MIPS
.data

 Digite: .asciiz "ax² + bx + c, digite os valores dos coeficientes a, b e c?"
 Da: .asciiz "a ="
 Db: .asciiz "b ="
 Dc: .asciiz "c ="
 X1: .asciiz "X1 ="
 X2: .asciiz "X2 = "


.text
  addi $sp,$sp,-12

  # Printa String
  li $v0,4
  la $a0,Digite
  syscall
  j scan
  
  scan: 
  li $v0,4
  la $a0,Da
  syscall
  
  swc1 $f0,6
  syscall
  
  swc1  $f1,0,($sp)
  
  li $v0,4
  la $a0,Db
  syscall
  
  swc1 $f0,6
  syscall
  
  swc1  $f2,-4,($sp)
  
  li $v0,4
  la $a0,Dc
  syscall
  
  swc1 $f0,6
  syscall
  
  swc1 $f3,-8,($sp)
  
  j delta
   
delta:

lwc1 $f1,0($sp)
lwc1 $f2,-4($sp)
lwc1 $f3,-8($sp)


 mul.s $f2,$f2,$f2    #b²
 mul.s $f1,$f3,$f1 # a * c
 swc1  $f0,4
 mul.s $f1,$f1,$f4  #4ac
 
 sub.s $f5,$f1,$f2   # b² - 4ac, armazenado em f5
 
j raizes

raizes:

lwc1 $f1,0($sp)
lwc1 $f2,-4($sp)
lwc1 $f3,-8($sp)
swc1 $f14,2 
 sqrt.s $f5,$f14

#X1

 sub.s $f7, $f1, $f5
 lwc1 $f10,2
 div.s $f7,$f7,$f10
 div.s $f7,$f7,$f1

 
  li $v0,4
  la $a0,X1
  syscall
  
  lwc1 $f0,2
  syscall
 
 #X2

  add.s $f8, $f1, $f5
  div.s  $f8,$f8,$f10
  div.s $f8,$f8,$f1
 
  li $v0,4
  la $a0,X2
  syscall
  
  lwc1 $f0,2
  syscall
    
 
 li $v0,10   #Filnaliza o programa
    syscall
   
   
