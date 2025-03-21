# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl -4(%rbp), %eax   # Charger x dans %eax
    popq %rbp
    ret
