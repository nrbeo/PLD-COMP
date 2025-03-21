# Déclaration : a -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $42, -4(%rbp)   # Init a
    movl -4(%rbp), %eax   # Load variable a into %eax
    popq %rbp
    ret
