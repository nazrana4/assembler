%{
    #include<stdio.h>
%}

%token OP 
%token REG MEM 

%%
    assembler : 
              | assembler inst EOL 
              ;

    inst : OP 
%%