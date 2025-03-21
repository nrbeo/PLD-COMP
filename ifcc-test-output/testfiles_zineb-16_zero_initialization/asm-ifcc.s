# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl -4(%rbp), %eax   # Load variable x into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
