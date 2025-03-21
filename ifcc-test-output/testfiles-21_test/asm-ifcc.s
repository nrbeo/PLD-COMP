# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $1, %eax   # Charger la constante 1 dans %eax
    movq %rax, -4(%rbp)   # Initialisation de a
    movl $7, %eax   # Charger la constante 7 dans %eax
    movq %rax, -8(%rbp)   # Initialisation de b
    movl -4(%rbp), %eax   # Charger a dans %eax
    pushq %rax
    movl -8(%rbp), %eax   # Charger b dans %eax
    movq %rax, %rbx
    popq %rax
    addq %rbx, %rax
    leave
    ret
    popq %rbp
    ret
