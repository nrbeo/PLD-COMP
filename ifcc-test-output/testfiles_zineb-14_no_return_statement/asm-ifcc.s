# Déclaration : x -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $10, -4(%rbp)   # Assign 10 to x
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
