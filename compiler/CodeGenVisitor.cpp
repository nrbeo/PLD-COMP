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
        std::cout << "    movl %eax, " << offset << "(%rbp)   # Initialisation de " << varName << "\n"; 
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

antlrcpp::Any CodeGenVisitor::visitReturn_stmt(ifccParser::Return_stmtContext *ctx) {
    visit(ctx->expr());
    std::cout << "    leave\n";  // Equivalent à `movq %rbp, %rsp` suivi de `popq %rbp`
    std::cout << "    ret\n";    // Retourner à l'appelant     
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

antlrcpp::Any CodeGenVisitor::visitAddSub(ifccParser::AddSubContext *ctx) {
    // 1. Visiter la partie gauche → %eax
    visit(ctx->expr(0)); 

    // 2. Allouer espace mémoire teporaire
    tempVarOffset -= 4;    
    std::cout << "    # "  << tempVarOffset << " pour "  << ctx->expr(0)->getText()  << "\n";
    // 3. Stocker le résultat gauche dans temp
    std::cout << "    movl %eax, " << tempVarOffset << "(%rbp)   # Sauvegarde de la partie gauche\n";

    int offset_of_lhs = tempVarOffset;

    // 4. Visiter la droite → résultat dans %eax
    visit(ctx->expr(1));  // résultat de droite dans eax
   
    // 5. Effectuer l'opération : eax = gauche (tmp) op droite (eax)
    std::string op = ctx->OP->getText();
    if (op == "+") {
        std::cout << "    addl " <<offset_of_lhs << "(%rbp), %eax   # tmp + eax → eax\n";
    } else { 
        std::cout << "    subl %eax,"<< offset_of_lhs << "(%rbp) ";
        std::cout << "    movl "<< offset_of_lhs << "(%rbp), %eax   # Résultat dans eax\n";
    }
    return 0;
}


antlrcpp::Any CodeGenVisitor::visitMulDiv(ifccParser::MulDivContext *ctx) {
    // 1. Visiter la partie gauche → résultat dans %eax
    visit(ctx->expr(0));

    // 2. Allouer une case mémoire pour temporaire
    tempVarOffset -= 4;

    std::cout << "    # "  << tempVarOffset << " pour "  << ctx->expr(0)->getText()  << "\n";
   
    // 3. Stocker le résultat gauche dans temp
    std::cout << "    movl %eax, " << tempVarOffset << "(%rbp)   # Sauvegarde de la partie gauche\n";

    // 4. Visiter la partie droite → résultat dans %eax
    visit(ctx->expr(1));
            
    // 7. Effectuer l’opération
    std::string op = ctx->OP->getText();
    if (op == "*") {
        std::cout << "    imull " << tempVarOffset << "(%rbp), %eax   # Multiplication : eax = gauche * droite\n";
    } else {
        // Division : eax = gauche / droite
        std::cout << "    cltd                           # Étendre eax dans edx:eax\n";
        std::cout << "    idivl " << tempVarOffset << "(%rbp)     # Division signée eax / droite\n";
    }
    return 0;
}

antlrcpp::Any CodeGenVisitor::visitParExpr(ifccParser::ParExprContext *ctx) {
    return visit(ctx->expr()); // Récupère directement l'expression interne
}