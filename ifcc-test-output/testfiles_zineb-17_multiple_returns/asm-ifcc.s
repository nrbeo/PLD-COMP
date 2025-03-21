.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $5, %eax   # Load constant 5 into %eax
    movl $10, %eax   # Load constant 10 into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
