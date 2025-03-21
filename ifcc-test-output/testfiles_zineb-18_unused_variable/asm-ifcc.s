# Déclaration : b -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Load constant 0 into %eax
    popq %rbp
    ret
