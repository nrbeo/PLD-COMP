# Déclaration : x -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl -4(%rbp), %eax   # Load variable x into %eax
    popq %rbp
    ret
