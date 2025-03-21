.globl _main
 _main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $42, %eax   # Load constant 42 into %eax
    popq %rbp
    ret
