# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $1, -4(%rbp)   # Assign 1 to a
    movl $3, -8(%rbp)   # Assign 3 to b
    movl -8(%rbp), %eax   # Load variable b into %eax
    movl %eax, %ebx
    movl -4(%rbp), %eax   # Load variable a into %eax
    addl %ebx, %eax   # Addition
    popq %rbp
    ret
