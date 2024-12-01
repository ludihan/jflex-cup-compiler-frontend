import java_cup.runtime.*;

%%

%cup
%class scanner

LineTerminator    = \r|\n|\r\n
InputCharacter    = [^\r\n]
Whitespace        = {LineTerminator} | [ \t\f]

Identifier        = [a-zA-Z_][a-zA-Z0-9_]*

IntegerLiteral    = [0-9] | [1-9][0-9]*
FloatLiteral      = {IntegerLiteral} "." [0-9]*
StringLiteral     = \"([^\"\\\n\r]|\\.)*\"

MultiLineComment  = "/*" [^*] ~"*/" | "/*" "*"+ "/"
SingleLineComment = "//" {InputCharacter}* {LineTerminator}?

Type               = "string" | "float" | "int" | "bool"

%%

"if"                { return new Symbol(sym.IF, yytext()); }
"else"              { return new Symbol(sym.ELSE, yytext()); }
"while"             { return new Symbol(sym.WHILE, yytext()); }
"for"               { return new Symbol(sym.FOR, yytext()); }
"return"            { return new Symbol(sym.RETURN, yytext()); }

{Type}              { return new Symbol(sym.TYPE, yytext()); }

{Identifier}        { return new Symbol(sym.IDENT, yytext()); }

{IntegerLiteral}    { return new Symbol(sym.INT, yytext()); }
{FloatLiteral}      { return new Symbol(sym.FLOAT, yytext()); }
{StringLiteral}     { return new Symbol(sym.STRING, yytext()); }

"+"                 { return new Symbol(sym.PLUS, yytext()); }
"-"                 { return new Symbol(sym.MINUS, yytext()); }
"*"                 { return new Symbol(sym.TIMES, yytext()); }
"/"                 { return new Symbol(sym.DIV, yytext()); }

"<"                 { return new Symbol(sym.LT, yytext()); }
">"                 { return new Symbol(sym.GT, yytext()); }
"<="                { return new Symbol(sym.LTEQ, yytext()); }
">="                { return new Symbol(sym.GTEQ, yytext()); }

"="                 { return new Symbol(sym.ASSIGN, yytext()); }

"=="                { return new Symbol(sym.EQ, yytext()); }
"!="                { return new Symbol(sym.NEQ, yytext()); }

"!"                 { return new Symbol(sym.NOT, yytext()); }

"++"                { return new Symbol(sym.INC, yytext()); }
"--"                { return new Symbol(sym.DEC, yytext()); }

"("                 { return new Symbol(sym.LPAREN, yytext()); }
")"                 { return new Symbol(sym.RPAREN, yytext()); }
";"                 { return new Symbol(sym.SEMI, yytext()); }
","                 { return new Symbol(sym.COMMA, yytext()); }
"{"                 { return new Symbol(sym.LBRACE, yytext()); }
"}"                 { return new Symbol(sym.RBRACE, yytext()); }

"false"             { return new Symbol(sym.FALSE, yytext()); }
"true"              { return new Symbol(sym.TRUE, yytext()); }

{MultiLineComment}  { return new Symbol(sym.MLCOMMENT, yytext()); }
{SingleLineComment} { return new Symbol(sym.SLCOMMENT, yytext()); }

{Whitespace}        { /* ignore */ }

[^]                 { System.err.println("Illegal character: " + yytext()); }
