.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $2147483647, %eax   # Load constant 2147483647 into %eax
    popq %rbp
    ret
