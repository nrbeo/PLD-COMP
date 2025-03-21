.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, %eax   # Charger la constante 5 dans %eax
    leave
    ret
    movl $10, %eax   # Charger la constante 10 dans %eax
    leave
    ret
    popq %rbp
    ret
