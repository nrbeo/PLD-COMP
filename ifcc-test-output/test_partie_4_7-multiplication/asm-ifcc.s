# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $3, -4(%rbp)   # Assign 3 to a
    movl $5, -8(%rbp)   # Assign 5 to b
    movl -4(%rbp), %eax   # Load variable a into %eax
    movl %eax, %ebx
    movl -8(%rbp), %eax   # Load variable b into %eax
    imull %eax, %ebx
    movl %ebx, %eax
    popq %rbp
    ret
