.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $3, %eax   # Retourne 3
    andl $255, %eax   # Assurer un retour en 8 bits
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $3, %eax   # Retourne 3
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
