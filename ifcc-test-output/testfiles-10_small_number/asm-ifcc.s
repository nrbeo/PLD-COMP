.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $3, %eax   # Charger la constante 3 dans %eax
    popq %rbp
    ret
