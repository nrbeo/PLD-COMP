# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $8, -4(%rbp)   # Stocke 8 dans x
    movl -4(%rbp), %eax   # Retourne la valeur de x
    andl $255, %eax   # Assurer un retour en 8 bits
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $8, -4(%rbp)   # Stocke 8 dans x
    movl -4(%rbp), %eax   # Retourne la valeur de x
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
