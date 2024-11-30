%%

%class Scanner
%unicode
%standalone

LineTerminator    = \r|\n|\r\n
InputCharacter = [^\r\n]
Whitespace        = {LineTerminator} | [ \t\f]
Identifier        = [a-zA-Z_][a-zA-Z0-9_]*
IntegerLiteral    = [0-9] | [1-9][0-9]*
FloatLiteral      = {IntegerLiteral} "." [0-9]*
MultiLineComment  = "/*" [^*] ~"*/" | "/*" "*"+ "/"
SingleLineComment = "//" {InputCharacter}* 


%%

<YYINITIAL> {

    {Whitespace}        { /* ignore */ }

    "if"                { System.out.println("IF:        " + yytext()); }
    "else"              { System.out.println("ELSE:      " + yytext()); }
    "while"             { System.out.println("WHILE:     " + yytext()); }
    "for"               { System.out.println("FOR:       " + yytext()); }
    "do"                { System.out.println("DO:        " + yytext()); }
    "return"            { System.out.println("RETURN:    " + yytext()); }

    {Identifier}        { System.out.println("IDENT:     " + yytext()); }

    {IntegerLiteral}    { System.out.println("INT:       " + yytext()); }
    {FloatLiteral}      { System.out.println("FLOAT:     " + yytext()); }

    "+"                 { System.out.println("ADD:       " + yytext()); }
    "-"                 { System.out.println("SUB:       " + yytext()); }
    "*"                 { System.out.println("MUL:       " + yytext()); }
    "/"                 { System.out.println("DIV:       " + yytext()); }

    ">"                 { System.out.println("GT:        " + yytext()); }
    "<"                 { System.out.println("LT:        " + yytext()); }

    "="                 { System.out.println("ASSIGN:    " + yytext()); }

    "=="                { System.out.println("EQ:        " + yytext()); }
    "!="                { System.out.println("NEQ:       " + yytext()); }

    "++"                { System.out.println("INC:       " + yytext()); }
    "--"                { System.out.println("DEC:       " + yytext()); }

    "("                 { System.out.println("LPAREN:    " + yytext()); }
    ")"                 { System.out.println("RPAREN:    " + yytext()); }
    ";"                 { System.out.println("COLON:     " + yytext()); }
    ","                 { System.out.println("COMMA:     " + yytext()); }
    "{"                 { System.out.println("LCURLY:    " + yytext()); }
    "}"                 { System.out.println("RCURLY:    " + yytext()); }

    {MultiLineComment}  { System.out.println("MLCOMMENT: " + yytext()); }
    {SingleLineComment} { System.out.println("SLCOMMENT: " + yytext()); }


    .                { System.err.println("Illegal character: " + yytext()); }
}

