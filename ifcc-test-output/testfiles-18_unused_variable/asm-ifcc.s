# Déclaration : b -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $0, %eax   # Charger la constante 0 dans %eax
    leave
    ret
    popq %rbp
    ret
