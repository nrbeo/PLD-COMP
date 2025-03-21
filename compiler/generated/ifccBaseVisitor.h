
// Generated from ifcc.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"
#include "ifccVisitor.h"


/**
 * This class provides an empty implementation of ifccVisitor, which can be
 * extended to create a visitor which only needs to handle a subset of the available methods.
 */
class  ifccBaseVisitor : public ifccVisitor {
public:

  virtual std::any visitAxiom(ifccParser::AxiomContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitProg(ifccParser::ProgContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitStmt(ifccParser::StmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitDeclaration(ifccParser::DeclarationContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAssignment(ifccParser::AssignmentContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitReturn_stmt(ifccParser::Return_stmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitConstExpr(ifccParser::ConstExprContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMulDiv(ifccParser::MulDivContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAddSub(ifccParser::AddSubContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitParenthesized(ifccParser::ParenthesizedContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitVarExpr(ifccParser::VarExprContext *ctx) override {
    return visitChildren(ctx);
  }


};

