# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $12, -4(%rbp)   # Assign 12 to a
    movl $3, -8(%rbp)   # Assign 3 to b
    movl -4(%rbp), %eax   # Load variable a into %eax
    movl %eax, %ebx
    movl -8(%rbp), %eax   # Load variable b into %eax
    movl %eax, %ecx
    movl %ebx, %eax
    cltd
    idivl %ecx
    popq %rbp
    ret
