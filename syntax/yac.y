%{
#include<stdio.h>
%}

%token INT
%token ID
%token SEMI
%token COMMA
%token BINARYOP
%token UNARYOP
%token TYPE
%token LP
%token RP
%token LB
%token RB
%token LC
%token RC
%token STRUCT
%token RETURN 
%token IF
%token ELSE
%token BREAK
%token CONT
%token FOR

%start PROGRAM

%%

PROGRAM : EXTDEFS
        ;

EXTDEFS : EXTDEF EXTDEFS
        |
        ;

EXTDEF  : TYPE EXTVARS SEMI
        | STSPEC SEXTVARS SEMI
        | TYPE FUNC STMTBLOCK
        ;

SEXTVARS : ID
         | ID COMMA SEXTVARS
         |
         ;

EXTVARS  : VAR
         | VAR ASSIGN INIT
         | VAR COMMA EXTVARS
         | VAR ASSIGN INIT COMMA EXTVARS
         |
         ;

STSPEC   : STRUCT ID LC SDEFS RC
         | STRUCT LC SDEFS RC
         | STRUCT ID
         ;

FUNC     : ID LP PARAS RP
         ;

PARAS    : TYPE ID COMMA PARAS
         | TYPE ID
         |
         ;

STMTBLOCK : LC DEFS STMTS RC
          ;

STMTS    : STMT STMTS
         |
         ;

STMT : EXP SEMI
     | STMTBLOCK
     | RETURN EXP SEMI
     | IF LP EXP RP STMT
     | IF LP EXP RP STMT ELSE STMT
     | FOR LP EXP SEMI EXP SEMI EXP RP STMT
     | CONT SEMI
     | BREAK SEMI
     ;

DEFS : TYPE DECS SEMI DEFS
     | STSPEC SDECS SEMI DEFS
     |
     ;

SDEFS : TYPE SDECS SEMI SDEFS
      |
      ;

SDECS : ID COMMA SDECS
      | ID
      ;

DECS : VAR
     | VAR COMMA DECS
     | VAR ASSIGN INIT COMMA DECS
     | VAR ASSIGN INIT
     ;

VAR : ID
    ;

INIT : EXP
     | LC ARGS RC
     ;

EXP : EXPS
    |
    ;

EXPS : EXPS BINARYOP EXPS
     | UNARYOP EXPS
     | LP EXPS RP
     | ID LP ARGS RP
     | ID ARGS
     | ID DOT ID
     | INT
     ;

ARRS : LB EXP RB ARGS
     |
     ;

ARGS : EXP COMMA ARGS
     | EXP
     ;


