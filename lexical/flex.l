%{
#include<stdio.h>
#include<math.h>
int num_lines = 0,num_blanks = 0;
%}

digit [0-9]
letter [a-zA-Z\_]
ID {letter}+({digit}|{letter})*
SEMI ";"
COMMA ","
BINARYOP "*"|"/"|"%"|"+"|"-"|"<<"|">>"|">"|">="|"<"|"<="|"=="|"!="|"&"|"^"|"|"|"&&"|"||"|"="|"+="|"-="|"*="|"/="|"&="|"^="|"|="|"<<="|">>="
UNARYOP "()"|"[]"|"."|"!"|"++"|"--"|"~"
TYPE int
LP "("
RP ")"
LB "["
RB "]"
LC "{"
RC "}"
STRUCT struct
RETURN return
IF if
ELSE else
BREAK break
CONT continue
FOR for
%%

(0[xX][0-9]+)|0 {
printf("This is INT: %s\n",yytext);
return INT;
}


{SEMI} {
printf("This is SEMI: %s\n",yytext);
return SEMI;
}

{COMMA} {
printf("This is COMMA: %s\n",yytext);
return COMMA;
}

{BINARYOP} {
printf("This is BINARYOP: %s\n",yytext);
return BINARYOP;
}

{UNARYOP} {
printf("This is UNATYOP: %s\n",yytext);
return UNARYOP;
}

{TYPE} {
printf("This is TYPE: %s\n",yytext);
return TYPE;
}

{LP} {
printf("This is LP: %s\n",yytext);
return LP;
}

{RP} {
printf("This is RP: %s\n",yytext);
return RP;
}

{LB} {
printf("This is LB: %s\n",yytext);
return LB;
}

{RB} {
printf("This is RB: %s\n",yytext);
return RB;
}

{LC} {
printf("This is LC: %s\n",yytext);
return LC;
}

{RC} {
printf("This is RC: %s\n",yytext);
return RC;
}

{STRUCT} {
printf("This is STRUCT: %s\n",yytext);
return STRUCT;
}

{RETURN} {
printf("This is RETURN: %s\n",yytext);
return RETURN;
}

{IF} {
printf("This is IF: %s\n",yytext);
return IF;
}

{ELSE} {
printf("This is ELSE: %s\n",yytext);
return ELSE;
}

{BREAK} {
printf("This is BREAK: %s\n",yytext);
return BREAK;
}

{CONT} {
printf("This is CONT: %s\n",yytext);
return CONT;
}

{FOR} {
printf("This is FOR: %s\n",yytext);
return FOR;
}

{ID} {
printf("This is ID: %s\n",yytext);
return ID;
}


%%
int main(int argc,char *argv[]) {
yylex();
exit(0);
}

