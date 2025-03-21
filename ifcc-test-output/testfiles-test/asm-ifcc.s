.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $7, %eax   # Charger la constante 7 dans %eax
    # -8 pour 7
    movl %eax, -8(%rbp)   # Sauvegarde de la partie gauche
    movl $4, %eax   # Charger la constante 4 dans %eax
    # -12 pour 4
    movl %eax, -12(%rbp)   # Sauvegarde de la partie gauche
    movl $3, %eax   # Charger la constante 3 dans %eax
    imull -12(%rbp), %eax   # Multiplication : eax = gauche * droite
    addl -8(%rbp), %eax   # tmp + eax → eax
    # -16 pour 7+4*3
    movl %eax, -16(%rbp)   # Sauvegarde de la partie gauche
    movl $2, %eax   # Charger la constante 2 dans %eax
    addl -16(%rbp), %eax   # tmp + eax → eax
    leave
    ret
    popq %rbp
    ret
