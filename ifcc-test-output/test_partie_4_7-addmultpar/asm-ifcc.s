.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $1, %eax   # Charger la constante 1 dans %eax
    # -8 pour 1
    movl %eax, -8(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -8(%rbp), %eax   # tmp + eax → eax
    # -12 pour (1+1)
    movl %eax, -12(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -12(%rbp), %eax   # tmp + eax → eax
    # -16 pour ((1+1)+1)
    movl %eax, -16(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -16(%rbp), %eax   # tmp + eax → eax
    # -20 pour (((1+1)+1)+1)
    movl %eax, -20(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -20(%rbp), %eax   # tmp + eax → eax
    # -24 pour ((((1+1)+1)+1)+1)
    movl %eax, -24(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -24(%rbp), %eax   # tmp + eax → eax
    # -28 pour (((((1+1)+1)+1)+1)+1)
    movl %eax, -28(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -28(%rbp), %eax   # tmp + eax → eax
    # -32 pour ((((((1+1)+1)+1)+1)+1)+1)
    movl %eax, -32(%rbp)   # Sauvegarde de la partie gauche
    movl $1, %eax   # Charger la constante 1 dans %eax
    addl -32(%rbp), %eax   # tmp + eax → eax
    leave
    ret
    popq %rbp
    ret
