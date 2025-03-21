# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $10, -4(%rbp)   # Assign 10 to a
    movl $4, -8(%rbp)   # Assign 4 to b
    movl -8(%rbp), %eax   # Load variable b into %eax
    movl %eax, %ebx
    movl -4(%rbp), %eax   # Load variable a into %eax
    subl %ebx, %eax   # Soustraction
    popq %rbp
    ret
