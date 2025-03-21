# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $2, -4(%rbp)   # Assign 2 to a
    movl $4, -8(%rbp)   # Assign 4 to b
    movl $6, -12(%rbp)   # Assign 6 to c
    movl -8(%rbp), %eax   # Load variable b into %eax
    movl %eax, %ebx
    movl -4(%rbp), %eax   # Load variable a into %eax
    addl %ebx, %eax   # Addition
    movl %eax, %ebx
    movl $3, %eax   # Load constant 3 into %eax
    movl %eax, %ebx
    movl -12(%rbp), %eax   # Load variable c into %eax
    subl %ebx, %eax   # Soustraction
    imull %eax, %ebx
    movl %ebx, %eax
    popq %rbp
    ret
