# Déclaration : a -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $3, %eax   # Charger la constante 3 dans %eax
    movq %rax, -4(%rbp)   # Initialisation de a
    movl -4(%rbp), %eax   # Charger a dans %eax
    leave
    ret
    popq %rbp
    ret
