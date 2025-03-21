.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $42, %eax   # Load constant 42 into %eax
    movl $0, %eax   # return 0 implicite
    popq %rbp
    ret
