.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $1, %eax   # Charger la constante 1 dans %eax
    # -8 pour 1
    movl %eax, -8(%rbp)   # Sauvegarde de la partie gauche
    movl $2, %eax   # Charger la constante 2 dans %eax
    # -12 pour 2
    movl %eax, -12(%rbp)   # Sauvegarde de la partie gauche
    movl $2, %eax   # Charger la constante 2 dans %eax
    imull -12(%rbp), %eax   # Multiplication : eax = gauche * droite
    addl -8(%rbp), %eax   # tmp + eax → eax
    leave
    ret
    popq %rbp
    ret
