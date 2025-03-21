# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, -4(%rbp)   # Assign 5 to a
    movl -4(%rbp), %eax   # Load a into %eax
    movl %eax, -8(%rbp)   # Store in b
    movl -8(%rbp), %eax   # Load b into %eax
    movl %eax, -12(%rbp)   # Store in c
    movl -12(%rbp), %eax   # Load variable c into %eax
    popq %rbp
    ret
