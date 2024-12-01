%%

%standalone
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

Type              = "string" | "float" | "int" | "void"

%%

"if"                { System.out.println("IF:        " + yytext()); }
"else"              { System.out.println("ELSE:      " + yytext()); }
"while"             { System.out.println("WHILE:     " + yytext()); }
"for"               { System.out.println("FOR:       " + yytext()); }
"return"            { System.out.println("RETURN:    " + yytext()); }

{Type}              { System.out.println("TYPE:      " + yytext()); }

{Identifier}        { System.out.println("IDENT:     " + yytext()); }

{IntegerLiteral}    { System.out.println("INT:       " + yytext()); }
{FloatLiteral}      { System.out.println("FLOAT:     " + yytext()); }
{StringLiteral}     { System.out.println("STRING:    " + yytext()); }

"+"                 { System.out.println("PLUS:      " + yytext()); }
"-"                 { System.out.println("MINUS:     " + yytext()); }
"*"                 { System.out.println("TIMES:     " + yytext()); }
"/"                 { System.out.println("DIV:       " + yytext()); }

"<"                 { System.out.println("LT:        " + yytext()); }
">"                 { System.out.println("GT:        " + yytext()); }
"<="                { System.out.println("LTEQ:      " + yytext()); }
">="                { System.out.println("GTEQ:      " + yytext()); }

"="                 { System.out.println("ASSIGN:    " + yytext()); }

"=="                { System.out.println("EQ:        " + yytext()); }
"!="                { System.out.println("NEQ:       " + yytext()); }

"!"                 { System.out.println("NOT:       " + yytext()); }

"++"                { System.out.println("INC:       " + yytext()); }
"--"                { System.out.println("DEC:       " + yytext()); }

"("                 { System.out.println("LPAREN:    " + yytext()); }
")"                 { System.out.println("RPAREN:    " + yytext()); }
";"                 { System.out.println("SEMI:     " + yytext()); }
","                 { System.out.println("COMMA:     " + yytext()); }
"{"                 { System.out.println("LBRACE:    " + yytext()); }
"}"                 { System.out.println("RBRACE:    " + yytext()); }

{MultiLineComment}  { System.out.println("MLCOMMENT: " + yytext()); }
{SingleLineComment} { System.out.println("SLCOMMENT: " + yytext()); }

{Whitespace}        { /* ignore */ }

[^]                 { System.err.println("Illegal character: " + yytext()); }
