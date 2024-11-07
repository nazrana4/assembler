%{
    #include<stdio.h>
%}

%%
"section .data"     { printf("%s\n",yytext); } 
"section .bss"      { printf("%s\n",yytext); }
"section .text"     { printf("%s\n",yytext); }

(db|dd|dw)          { printf("Declaring variable \n"); }


(MOV|ADD|SUB|DIV|MUL|XOR|CMP)   { printf("2 operands %s \n",yytext); }
(JMP|JZ|JNZ|INC|DEC)            { printf("single operand: %s \n",yytext);}

(eax|ebx|ecx|edx|edi|esp|ebp|esi)  { printf("%s \n",yytext);}
[A-Za-z0-9]+[ \t]*:                { /*before updating yylval trim whitespaces and remove ':' */ printf("Label %s encountered\n", yytext); }

[01]+b              { printf("Encountered a binary number: %s\n", yytext); }
0[0-7]+             { printf("Encountered an octal number: %s\n", yytext); }
([0-9]+|-[0-9]+)    { printf("Encountered a number: %s \n",yytext); } 
0[xX][0-9A-F]+      { printf("Encountered a hexadecimal number: %s\n", yytext); }

[ \t] {}
. {printf("Unknown character: %s\n", yytext); }
%%

int main(){
    yylex();
    return 0;
}
