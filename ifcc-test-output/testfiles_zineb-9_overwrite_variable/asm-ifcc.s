# Déclaration : a -> -4 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $10, -4(%rbp)   # Assign 10 to a
    movl $20, -4(%rbp)   # Assign 20 to a
    movl -4(%rbp), %eax   # Load variable a into %eax
    popq %rbp
    ret
