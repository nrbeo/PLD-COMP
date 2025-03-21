# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $1, %eax   # Charger la constante 1 dans %eax
    movl %eax, -4(%rbp)   # Initialisation de a
    movl $3, %eax   # Charger la constante 3 dans %eax
    movl %eax, -8(%rbp)   # Initialisation de b
    movl -4(%rbp), %eax   # Charger a dans %eax
    leave
    ret
    popq %rbp
    ret
