# Module Name: pc1-yan-souza.asm
# Nome: yan Stivaletti E Souza
# Numero de Matricula: 11821BCC002
# Data de Implementaçao: Inicio: 29/08/2019 Fim: 02/09/2019
# Linguagem Usada: Assembly MIPS

.data   #usa-se para referenciar a lable "Helloword"
   helloworld: .asciiz "Hello World!\n"
   
.text 
    li $v0,4      #load imidiate no registrador v0 junto com o comando 4 para printar uma string
    la $a0,helloworld    #load adress no registrador a0 para carregar os argumentos anteriores
    syscall 
    li $v0,10   #Filnaliza o programa
    syscall
