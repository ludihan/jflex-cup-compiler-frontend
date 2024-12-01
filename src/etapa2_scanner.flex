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

TypeFunc              = TypeVar | "void"
TypeVar               = "string" | "float" | "int"

%%

"if"                { return new Symbol(sym.IF); }
"else"              { return new Symbol(sym.ELSE); }
"while"             { return new Symbol(sym.WHILE); }
"for"               { return new Symbol(sym.FOR); }
"return"            { return new Symbol(sym.RETURN); }

{TypeFunc}          { return new Symbol(sym.TYPEFUNC, yytext()); }
{TypeVar}           { return new Symbol(sym.TYPEVAR, yytext()); }

{Identifier}        { return new Symbol(sym.IDENT, yytext()); }

{IntegerLiteral}    { return new Symbol(sym.INT, Integer.parseInt(yytext())); }
{FloatLiteral}      { return new Symbol(sym.FLOAT, Float.parseFloat(yytext())); }
{StringLiteral}     { return new Symbol(sym.STRING, yytext()); }

"+"                 { return new Symbol(sym.PLUS); }
"-"                 { return new Symbol(sym.MINUS); }
"*"                 { return new Symbol(sym.TIMES); }
"/"                 { return new Symbol(sym.DIV); }

"<"                 { return new Symbol(sym.LT); }
">"                 { return new Symbol(sym.GT); }
"<="                { return new Symbol(sym.LTEQ); }
">="                { return new Symbol(sym.GTEQ); }

"="                 { return new Symbol(sym.ASSIGN); }

"=="                { return new Symbol(sym.EQ); }
"!="                { return new Symbol(sym.NEQ); }

"!"                 { return new Symbol(sym.NOT); }

"++"                { return new Symbol(sym.INC); }
"--"                { return new Symbol(sym.DEC); }

"("                 { return new Symbol(sym.LPAREN); }
")"                 { return new Symbol(sym.RPAREN); }
";"                 { return new Symbol(sym.SEMI); }
","                 { return new Symbol(sym.COMMA); }
"{"                 { return new Symbol(sym.LBRACE); }
"}"                 { return new Symbol(sym.RBRACE); }

{MultiLineComment}  { return new Symbol(sym.MLCOMMENT, yytext()); }
{SingleLineComment} { return new Symbol(sym.SLCOMMENT, yytext()); }

{Whitespace}        { /* ignore */ }

[^]                 { System.err.println("Illegal character: " + yytext()); }
