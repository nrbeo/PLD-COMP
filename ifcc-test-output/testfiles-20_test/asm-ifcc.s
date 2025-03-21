# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $1, %eax   # Charger la constante 1 dans %eax
    movq %rax, -4(%rbp)   # Initialisation de a
    movl -4(%rbp), %eax   # Charger a dans %eax
    movq %rax, -8(%rbp)   # Initialisation de b
    movl -8(%rbp), %eax   # Charger b dans %eax
    leave
    ret
    popq %rbp
    ret
