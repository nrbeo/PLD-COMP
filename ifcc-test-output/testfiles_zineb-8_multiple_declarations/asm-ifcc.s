# Déclaration : x -> -4 (%rbp)
# Déclaration : y -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, -4(%rbp)   # Assign 5 to x
    movl -4(%rbp), %eax   # Load x into %eax
    movl %eax, -8(%rbp)   # Store in y
    movl -8(%rbp), %eax   # Load variable y into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
