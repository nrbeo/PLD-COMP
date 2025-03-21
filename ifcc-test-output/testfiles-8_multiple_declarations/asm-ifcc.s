# Déclaration : x -> -4 (%rbp)
# Déclaration : y -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, -4(%rbp)   # Stocke 5 dans x
    movl -4(%rbp), %eax   # Charger x dans %eax
    movl %eax, -8(%rbp)   # Copier x dans y
    movl -8(%rbp), %eax   # Retourne la valeur de y
    andl $255, %eax   # Assurer un retour en 8 bits
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, -4(%rbp)   # Stocke 5 dans x
    movl -4(%rbp), %eax   # Charger x dans %eax
    movl %eax, -8(%rbp)   # Copier x dans y
    movl -8(%rbp), %eax   # Retourne la valeur de y
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
