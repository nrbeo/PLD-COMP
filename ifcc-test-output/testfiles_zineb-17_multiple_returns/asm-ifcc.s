.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, %eax   # Load constant 5 into %eax
    popq %rbp
    ret
    movl $10, %eax   # Load constant 10 into %eax
    popq %rbp
    ret
