.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, %eax   # Retourne 5
    andl $255, %eax   # Assurer un retour en 8 bits
    movl $10, %eax   # Retourne 10
    andl $255, %eax   # Assurer un retour en 8 bits
    popq %rbp
    ret
