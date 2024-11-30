import java_cup.runtime.*;

%%

%class Scanner
%unicode
%cup

WHITESPACE = [ \t\n\r]+
DIGIT = [0-9]+

%%

<YYINITIAL> {
    {WHITESPACE}  { /**/ }
    ";"           { return new Symbol(Sym.SEMI); }
    "+"           { return new Symbol(Sym.PLUS); }
    "-"           { return new Symbol(Sym.MINUS); }
    "*"           { return new Symbol(Sym.TIMES); }
    "("           { return new Symbol(Sym.LPAREN); }
    ")"           { return new Symbol(Sym.RPAREN); }
    {DIGIT}       { return new Symbol(Sym.NUMBER, Integer.parseInt(yytext())); }
    .             { System.err.println("Illegal character: " + yytext()); }
}

<<EOF>> { return new Symbol( Sym.EOF ); }
