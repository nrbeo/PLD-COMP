# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $1, -4(%rbp)   # Assign 1 to a
    movl $3, -8(%rbp)   # Assign 3 to b
    movl -12(%rbp), %eax   # Load variable c into %eax
    popq %rbp
    ret
