# Déclaration : x -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $8, -4(%rbp)   # Assign 8 to x
    movl -4(%rbp), %eax   # Load variable x into %eax
    popq %rbp
    ret
