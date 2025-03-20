# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, -4(%rbp)   # Stocke 5 dans a
    movl -4(%rbp), %eax   # Charger a dans %eax
    movl %eax, -8(%rbp)   # Copier a dans b
    movl -8(%rbp), %eax   # Charger b dans %eax
    movl %eax, -12(%rbp)   # Copier b dans c
    movl -12(%rbp), %eax   # Retourne la valeur de c
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
