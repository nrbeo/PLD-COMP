# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, -4(%rbp)   # Init a
    movl $10, -8(%rbp)   # Init b
    movl $16, %eax   # Load constant 16 into %eax
    pushq %rax
    movl -4(%rbp), %eax   # Load variable a into %eax
    pushq %rax
    movl -8(%rbp), %eax   # Load variable b into %eax
    popq %rcx
    addl %ecx, %eax   # Addition
    pushq %rax
    movl $2, %eax   # Load constant 2 into %eax
    popq %rcx
    imull %ecx, %eax  # Multiplication
    popq %rcx
    addl %ecx, %eax   # Addition
    pushq %rax
    movl $15, %eax   # Load constant 15 into %eax
    pushq %rax
    movl $5, %eax   # Load constant 5 into %eax
    popq %rcx
    cltd
    idivl %ecx        # Division
    popq %rcx
    addl %ecx, %eax   # Addition
    pushq %rax
    movl $12, %eax   # Load constant 12 into %eax
    popq %rcx
    addl %ecx, %eax   # Addition
    pushq %rax
    movl $3, %eax   # Load constant 3 into %eax
    popq %rcx
    imull %ecx, %eax  # Multiplication
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
