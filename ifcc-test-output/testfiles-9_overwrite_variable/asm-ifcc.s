# Déclaration : a -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $10, %eax   # Charger la constante 10 dans %eax
    movl %eax, -4(%rbp)   # Copier la valeur dans a
    movl $20, %eax   # Charger la constante 20 dans %eax
    movl %eax, -4(%rbp)   # Copier la valeur dans a
    movl -4(%rbp), %eax   # Charger a dans %eax
    popq %rbp
    ret
