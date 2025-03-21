.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $2147483647, %eax   # Charger la constante 2147483647 dans %eax
    leave
    ret
    popq %rbp
    ret
