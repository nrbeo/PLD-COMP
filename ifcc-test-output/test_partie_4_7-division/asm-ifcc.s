# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $12, %eax   # Charger la constante 12 dans %eax
    movl %eax, -4(%rbp)   # Initialisation de a
    movl $3, %eax   # Charger la constante 3 dans %eax
    movl %eax, -8(%rbp)   # Initialisation de b
    movl -4(%rbp), %eax   # Charger a dans %eax
    # -16 pour a
    movl %eax, -16(%rbp)   # Sauvegarde de la partie gauche
    movl -8(%rbp), %eax   # Charger b dans %eax
    cltd                           # Étendre eax dans edx:eax
    idivl -16(%rbp)     # Division signée eax / droite
    leave
    ret
    popq %rbp
    ret
