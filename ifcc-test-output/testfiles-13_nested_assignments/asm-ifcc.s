# Déclaration : a -> -4 (%rbp)
# Déclaration : b -> -8 (%rbp)
# Déclaration : c -> -12 (%rbp)
.globl main
 main: 
    pushq %rbp
    movq %rsp, %rbp
    movl $0, %eax   # Ajout d'un return 0 implicite
    movl $5, %eax   # Charger la constante 5 dans %eax
    movq %rax, -4(%rbp)   # Copier la valeur dans a
    movl -4(%rbp), %eax   # Charger a dans %eax
    movq %rax, -8(%rbp)   # Copier la valeur dans b
    movl -8(%rbp), %eax   # Charger b dans %eax
    movq %rax, -12(%rbp)   # Copier la valeur dans c
    movl -12(%rbp), %eax   # Charger c dans %eax
    leave
    ret
    popq %rbp
    ret
