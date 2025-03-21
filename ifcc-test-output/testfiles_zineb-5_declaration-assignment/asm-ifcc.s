# Déclaration : a -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $42, -4(%rbp)   # Init a
    movl -4(%rbp), %eax   # Load variable a into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
