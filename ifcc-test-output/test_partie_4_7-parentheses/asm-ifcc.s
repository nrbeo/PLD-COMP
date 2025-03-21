# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $2, %eax   # Charger la constante 2 dans %eax
    movl %eax, -4(%rbp)   # Initialisation de a
    movl $4, %eax   # Charger la constante 4 dans %eax
    movl %eax, -8(%rbp)   # Initialisation de b
    movl $6, %eax   # Charger la constante 6 dans %eax
    movl %eax, -12(%rbp)   # Initialisation de c
    movl -4(%rbp), %eax   # Charger a dans %eax
    # -20 pour a
    movl %eax, -20(%rbp)   # Sauvegarde de la partie gauche
    movl -8(%rbp), %eax   # Charger b dans %eax
    addl -20(%rbp), %eax   # tmp + eax → eax
    # -24 pour (a+b)
    movl %eax, -24(%rbp)   # Sauvegarde de la partie gauche
    movl -12(%rbp), %eax   # Charger c dans %eax
    # -28 pour c
    movl %eax, -28(%rbp)   # Sauvegarde de la partie gauche
    movl $3, %eax   # Charger la constante 3 dans %eax
    addl -28(%rbp), %eax   # tmp + eax → eax
    imull -28(%rbp), %eax   # Multiplication : eax = gauche * droite
    leave
    ret
    popq %rbp
    ret
