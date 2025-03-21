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

antlrcpp::Any CodeGenVisitor::visitDeclaration(ifccParser::DeclarationContext *ctx)
{   
    std::string varName = ctx->VAR()->getText();  // Récupérer le nom de la variable
    int offset = (*symbolTable)[varName]; 
    if (ctx->expr()) {
        visit(ctx->expr());
        std::cout << "    movl %eax, " << offset << "(%rbp)   # # Initialisation de " << varName << "\n"; 
        }         
    
    return 0;
}

antlrcpp::Any CodeGenVisitor::visitAssignment(ifccParser::AssignmentContext *ctx) {
    std::string varName = ctx->VAR()->getText();  // Récupérer le nom de la variable assignée

    int offset = (*symbolTable)[varName];  // On suppose que `symbolTable` est déjà valide. On récupére l'offset
    
    visit(ctx->expr());  // Visiter l'expression à droite de l'opérateur d'assignation
    std::cout << "    movl %eax, " << offset << "(%rbp)   # Copier la valeur dans " << varName << "\n";  
    return 0;
}



antlrcpp::Any CodeGenVisitor::visitVarExpr(ifccParser::VarExprContext *ctx) {
    std::string varName = ctx->VAR()->getText();
    int offset = (*symbolTable)[varName];

    std::cout << "    movl " << offset << "(%rbp), %eax   # Charger " << varName << " dans %eax\n";
    return 0;
}

antlrcpp::Any CodeGenVisitor::visitConstExpr(ifccParser::ConstExprContext *ctx) {
    int value = std::stoi(ctx->CONST()->getText());
    std::cout << "    movl $" << value << ", %eax   # Charger la constante " << value << " dans %eax\n";
    return 0;
}


