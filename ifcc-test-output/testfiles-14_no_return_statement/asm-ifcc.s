# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $10, -4(%rbp)   # Stocke 10 dans x
    popq %rbp
    ret
