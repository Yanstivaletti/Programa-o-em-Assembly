# Module Name: pc6-yan-souza.asm
# Nome: Yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Funï¿½ï¿½es: scan, end 
# Data de Implementaï¿½ao: Inicio: 21/11/2019 Fim: 29/11/2019
# Linguagem Usada: Assembly MIPS

.data
 X: .asciiz "\nX= "
 Digite: .asciiz "\nDigite um valor:"
 Corrige: .asciiz "\nNumero Ivalido, Digite outro valor"
 Printa: .asciiz "\nPrint:"
 Line: .asciiz " - "
 Constante1: .word 0
 Constante2: .word 0

.text

addi $t9,$zero,0
scan:

li $v0, 4
la $a0, Digite		
syscall

li $v0, 5		
syscall
	
blt $v0,$zero,NumeroNeg          # Caso o numero seja negativo, o programa pede outro valor para ser inserido

sw $v0 Constante1		#O numero será guardado na variavel Constante1

move $t1,$v0		        #$t1 assume o mesmo valor do Número

	
li $v0,4
la $a0,X		#String "X = "
syscall
	
li $v0,1
move $a0, $t1		#printa o número que foi digitado pelo usuario
syscall
	
	
li $v0,4
la $a0,Printa		#imprime a mensagem que segue a sequencia crescente
syscall
	
	
lw $a0,Constante1
jal contador	      #irá para a funçao que fara a contagem
	
sw $v0,Constante2	#a funçao retornará o numero que será guardado na constante2
	
li $v0, 10		
syscall
	
	
contador:
subu $sp,$sp, 8
sw $ra, ($sp)
sw $s0, 4($sp)
		
li $v0, 1                       #caso base
beq $a0, -1, fimDoContador      #se for igual a -1, termina a funçao
		
					
move $s0, $a0
sub $a0, $a0, 1	               #Contador --
jal contador
	
beq $s0, $t9 primeiroSemTraco              #não imprime o primeiro traço

li $v0, 4
la $a0,Line
syscall
		
primeiroSemTraco:
		
li $v0,1
move $a0, $s0
syscall	
	
fimDoContador:
	
lw $ra,($sp)
lw $s0, 4($sp)
addu $sp,$sp, 8       
jr $ra	
	
NumeroNeg: 
 li $v0,4
 la $a0, Corrige     #Informa o usuario que o numero é invalido
syscall

j scan
 	

