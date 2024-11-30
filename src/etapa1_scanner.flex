%%

%class Scanner
%unicode
%cup
%line
%column

LineTerminator = \r|\n|\r\n
Whitespace = {LineTerminator} | [ \t\f]
DIGIT = [1-9] | [1-9] [0-9]+
Identifier =  [a-zA-Z_][a-zA-Z0-9_]*
IntegerLiteral = [1-9][0-9]*
FloatLiteral = {IntegerLiteral} "." [0-9]*

%%

<YYINITIAL> {
    {Whitespace}     { /* ignore */ }
    {Identifier}     { return new Symbol(sym.IDENTIFIER)}
    ";"              { return new Symbol(sym.SEMI); }

    "+"              { return new Symbol(sym.PLUS); }
    "-"              { return new Symbol(sym.MINUS); }
    "*"              { return new Symbol(sym.TIMES); }
    "/"              { return new Symbol(sym.DIV); }
    "=="             { return new Symbol(sym.EQ); }
    "!="             { return new Symbol(sym.NEQ); }

    "("              { return new Symbol(sym.LPAREN); }
    ")"              { return new Symbol(sym.RPAREN); }
    {IntegerLiteral} { return new Symbol(sym.INT, Integer.parseInt(yytext())); }
    {FloatLiteral}   { return new Symbol(sym.FLOAT, Integer.parseInt(yytext())); }
    .                { System.err.println("Illegal character: " + yytext()); }
}

