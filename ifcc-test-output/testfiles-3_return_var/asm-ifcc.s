# Déclaration : x -> -4 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $8, %eax   # Charger la constante 8 dans %eax
    movq %rax, -4(%rbp)   # Copier la valeur dans x
    movl -4(%rbp), %eax   # Charger x dans %eax
    leave
    ret
    popq %rbp
    ret
