#pragma once


#include "antlr4-runtime.h"
#include "generated/ifccBaseVisitor.h"


class  CodeGenVisitor : public ifccBaseVisitor {
        private:
                std::map<std::string, int>* symbolTable;
	public:
        explicit CodeGenVisitor(std::map<std::string, int>* symTable) : symbolTable(symTable) {}
        virtual antlrcpp::Any visitProg(ifccParser::ProgContext *ctx) override ;
        virtual antlrcpp::Any visitReturn_stmt(ifccParser::Return_stmtContext *ctx) override;
        virtual antlrcpp::Any visitAssignment(ifccParser::AssignmentContext *ctx) override;
        virtual antlrcpp::Any visitDeclaration(ifccParser::DeclarationContext *ctx) override;
};

