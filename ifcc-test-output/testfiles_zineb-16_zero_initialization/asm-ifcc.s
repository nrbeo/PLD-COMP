# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl -4(%rbp), %eax   # Load variable x into %eax
    popq %rbp
    ret
