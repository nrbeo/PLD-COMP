# Déclaration : a -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $42, -4(%rbp)   # Stocke 42 dans a
    movl -4(%rbp), %eax   # Retourne la valeur de a
    andl $255, %eax   # Assurer un retour en 8 bits
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $42, -4(%rbp)   # Stocke 42 dans a
    movl -4(%rbp), %eax   # Retourne la valeur de a
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
