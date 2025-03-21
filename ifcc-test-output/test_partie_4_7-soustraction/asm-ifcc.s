# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $10, %eax   # Charger la constante 10 dans %eax
    movl %eax, -4(%rbp)   # Initialisation de a
    movl $4, %eax   # Charger la constante 4 dans %eax
    movl %eax, -8(%rbp)   # Initialisation de b
    movl -4(%rbp), %eax   # Charger a dans %eax
    # -16 pour a
    movl %eax, -16(%rbp)   # Sauvegarde de la partie gauche
    movl -8(%rbp), %eax   # Charger b dans %eax
    subl %eax,-16(%rbp)     movl -16(%rbp), %eax   # Résultat dans eax
    leave
    ret
    popq %rbp
    ret
