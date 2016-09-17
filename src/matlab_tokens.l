%{
#include <iostream>
#include <string>
using namespace std;
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
%}

digit [0-9]
integer {digit}+
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
%%

[ tn]                 ;
{real}                  {cout << "DOUBLE: " << yytext << endl;}
{integer}               {cout << "INTEGER: " << yytext << endl;}
"function"              {cout << "FUNCTION: " << yytext << endl;}
"end"                   {cout << "END: " << yytext << endl;}
"if"                    {cout << "IF: " << yytext << endl;}
"else"                  {cout << "ELSE: " << yytext << endl;}
"elseif"                {cout << "elseif: " << yytext << endl;}
"switch"                {cout << "SWITCH: " << yytext << endl;}
"case"                  {cout << "CASE: " << yytext << endl;}
"otherwise"             {cout << "OTHERWISE: " << yytext << endl;}
"for"                   {cout << "FOR: " << yytext << endl;}
"while"                 {cout << "WHILE: " << yytext << endl;}
"continue"              {cout << "CONTINUE: " << yytext << endl;}
"break"                 {cout << "BREAK: " << yytext << endl;}
"return"                {cout << "RETURN: " << yytext << endl;}
[a-zA-Z_][a-zA-Z0-9_]*  {cout << "Identifier: " << yytext << endl;}
","                     {cout << "Comma: " << yytext << endl;}
"."                     {cout << "Dot: " << yytext << endl;}
":"                     {cout << "DotDot: " << yytext << endl;}
";"                     {cout << "EndLine: " << yytext << endl;}
"("                     {cout << "Open Parenthesis: " << yytext << endl;}
")"                     {cout << "Close Parenthesis: " << yytext << endl;}
"["                     {cout << "Open Bracket: " << yytext << endl;}
"]"                     {cout << "Close Bracket: " << yytext << endl;}
"{"                     {cout << "Open Brace: " << yytext << endl;}
"}"                     {cout << "Close Brace: " << yytext << endl;}
"&&"                    {cout << "AND: " << yytext << endl;}
"||"                    {cout << "OR: " << yytext << endl;}
"=="                    {cout << "EQUAL: " << yytext << endl;}
"~="                    {cout << "DIFFERENT: " << yytext << endl;}
"="                     {cout << "ASSIGN: " << yytext << endl;}
"<"                     {cout << "Less: " << yytext << endl;}
"<="                    {cout << "Less or equal: " << yytext << endl;}
">"                     {cout << "Greater: " << yytext << endl;}
">="                    {cout << "Greater or equal: " << yytext << endl;}
"+"                     {cout << "Plus: " << yytext << endl;}
"-"                     {cout << "Minus: " << yytext << endl;}
"*"                     {cout << "Multiply: " << yytext << endl;}
"/"                     {cout << "Divide: " << yytext << endl;}
"\\"                     {cout << "DIVIDE LINEAR: " << yytext << endl;}
"^"                     {cout << "Exponential: " << yytext << endl;}
"%".*                   {}
.                       printf("Unknown token!n"); yyterminate();

%%

int main(int, char**) {
  // lex on the input
  yylex();
}
