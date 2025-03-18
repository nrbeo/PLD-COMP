#include "CodeGenVisitor.h"

antlrcpp::Any CodeGenVisitor::visitProg(ifccParser::ProgContext *ctx) 
{
    #ifdef __APPLE__
    std::cout<< ".globl _main\n" ;
    std::cout<< " _main: \n" ;
    #else
    std::cout<< ".globl main\n" ;
    std::cout<< " main: \n" ;
    #endif

    // Prologue
    std::cout << "    pushq %rbp\n";        // save %rbp on the stack
    std::cout << "    movq %rsp, %rbp\n";   // define %rbp for the current function

    // Visite des instructions enfants
    bool hasReturn = false;  // Vérifie si un `return` existe
    for (size_t i = 0; i < ctx->stmt().size(); i++) {
        if (dynamic_cast<ifccParser::Return_stmtContext*>(ctx->stmt(i)) != nullptr) {
            hasReturn = true;
        }
        this->visit(ctx->stmt(i));
    }

    // Si aucun `return` n'a été trouvé, on ajoute `return 0;`
    if (!hasReturn) {
        std::cout << "    movl $0, %eax   # Ajout d'un return 0 implicite\n";
    }

    for (auto stmt : ctx->stmt()) {  // iterate over each statement in the list
        this->visit(stmt);  // visit each statement (declaration, assignment, return)
    }
        
    // Epilogue
    // std::cout << ".end:\n";                 // Label for the end of the program
    std::cout << "    popq %rbp\n";         // restore %rbp from the stack
    std::cout << "    ret\n";               // return to the caller
    return 0;
}

// Gérer les affectations 
antlrcpp::Any CodeGenVisitor::visitDeclaration(ifccParser::DeclarationContext *ctx)
{   
    if (ctx->expr()) {  // Vérifie si une valeur est assignée (ex: int a = 42;)
        std::string varName = ctx->VAR()->getText();
        int offset = (*symbolTable)[varName];  
        int value = std::stoi(ctx->expr()->CONST()->getText());
        std::cout << "    movl $" << value << ", " << offset << "(%rbp)   # Initialisation de " << varName << "\n";
    }

    return 0;
}

antlrcpp::Any CodeGenVisitor::visitAssignment(ifccParser::AssignmentContext *ctx)
{
    std::string varName = ctx->VAR()->getText();

    int offset = (*symbolTable)[varName];  // On suppose que `symbolTable` est déjà valide. On récupére l'offset

    // Si c'est une constante 
    if (ctx->expr()->CONST()) {
        int value = std::stoi(ctx->expr()->CONST()->getText());
        std::cout << "    movl $" << value << ", " << offset << "(%rbp)   # Stocke " << value << " dans " << varName << "\n";
    }
    // Si c'est une autre variable 
    else if (ctx->expr()->VAR()) {
        std::string varNameSrc = ctx->expr()->VAR()->getText();
        int offsetSrc = (*symbolTable)[varNameSrc];
        std::cout << "    movl " << offsetSrc << "(%rbp), %eax   # Charger " << varNameSrc << " dans %eax\n";
        std::cout << "    movl %eax, " << offset << "(%rbp)   # Copier " << varNameSrc << " dans " << varName << "\n";
    }

    return 0;
}

antlrcpp::Any CodeGenVisitor::visitReturn_stmt(ifccParser::Return_stmtContext *ctx)
{
    if (ctx->expr()->CONST()) {   // Vérifier si la valeur de retour est une constante
        int retval = std::stoi(ctx->expr()->CONST()->getText()); // Récupérer la valeur de retour

        // Ajuster la valeur négative en 8 bits non signés
        int exitStatus = retval & 0xFF;

        std::cout << "    movl $" << retval << ", %eax   # Retourne " << retval << "\n";
        std::cout << "    andl $255, %eax   # Assurer un retour en 8 bits\n";  
    } 
    else if (ctx->expr()->VAR()) { // Vérifier si la valeur de retour est une variable
        std::string varName = ctx->expr()->VAR()->getText();
        int offset = (*symbolTable)[varName];
        std::cout << "    movl " << offset << "(%rbp), %eax   # Retourne la valeur de " << varName << "\n";
        std::cout << "    andl $255, %eax   # Assurer un retour en 8 bits\n"; 
    }
    
    // // Ajout du jump vers `.end`
    // std::cout << "    jmp .end   # Sauter le reste du code\n";
    return 0;
}
