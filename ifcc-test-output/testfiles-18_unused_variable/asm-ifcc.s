# Déclaration : b -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $0, %eax   # Retourne 0
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
