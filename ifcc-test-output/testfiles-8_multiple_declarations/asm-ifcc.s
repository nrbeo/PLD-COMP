# Déclaration : x -> -4 (%rbp)
# Déclaration : y -> -8 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, %eax   # Charger la constante 5 dans %eax
    movq %rax, -4(%rbp)   # Copier la valeur dans x
    movl -4(%rbp), %eax   # Charger x dans %eax
    movq %rax, -8(%rbp)   # Copier la valeur dans y
    movl -8(%rbp), %eax   # Charger y dans %eax
    leave
    ret
    popq %rbp
    ret
