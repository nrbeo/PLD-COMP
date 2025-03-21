# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $10, %eax   # Charger la constante 10 dans %eax
    movq %rax, -4(%rbp)   # Copier la valeur dans x
    popq %rbp
    ret
