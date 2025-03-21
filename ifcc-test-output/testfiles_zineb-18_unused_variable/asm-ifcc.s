# Déclaration : b -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Load constant 0 into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
