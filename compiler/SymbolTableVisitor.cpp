#include "SymbolTableVisitor.h"

antlrcpp::Any SymbolTableVisitor::visitDeclaration(ifccParser::DeclarationContext *ctx) {
    std::string varName = ctx->VAR()->getText();

    if (symbolTable.find(varName) != symbolTable.end()) {
        std::cerr << "Erreur : Variable '" << varName << "' déjà déclarée !" << std::endl;
        exit(1);
    }

    symbolTable[varName] = stackOffset;
    stackOffset -= 4;  // Réserver 4 octets pour la variable

    std::cout << "# Déclaration : " << varName << " -> " << symbolTable[varName] << " (%rbp)" << std::endl;

    return 0;
}

antlrcpp::Any SymbolTableVisitor::visitAssignment(ifccParser::AssignmentContext *ctx) {
    std::string varName = ctx->VAR()->getText();

    if (symbolTable.find(varName) == symbolTable.end()) {
        std::cerr << "Erreur : Variable '" << varName << "' utilisée sans être déclarée !" << std::endl;
        exit(1);
    }

    usedVariables.insert(varName);
    return 0;
}

// antlrcpp::Any SymbolTableVisitor::visitReturn_stmt(ifccParser::Return_stmtContext *ctx) {
//     if (ctx->expr()->VAR()) {  // check if the return expression is a variable
//         std::string varName = ctx->expr()->VAR()->getText();        
//         if (symbolTable.find(varName) == symbolTable.end()) {
//             std::cerr << "Erreur : Variable '" << varName << "' utilisée sans être déclarée !" << std::endl;
//             exit(1);
//         }    
//         usedVariables.insert(varName);
//     } 
//     return 0;   
// }

void SymbolTableVisitor::checkUnusedVariables() {
    for (const auto& [varName, _] : symbolTable) {
        if (usedVariables.find(varName) == usedVariables.end()) {
            std::cerr << "# Avertissement : Variable '" << varName << "' déclarée mais jamais utilisée !" << std::endl;
        }
    }
}
