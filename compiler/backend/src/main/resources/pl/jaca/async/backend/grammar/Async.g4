grammar Async ;

QUALIFIED_NAME : [a-zA-Z]+ ;

sourceSet
    : class
    ;

class
    : 'class' QUALIFIED_NAME { statement* }
    ;

statement
    : initialization      '\n' #initializationStatement
    | expression          '\n' #expressionStatement
    | functionDeclaration '\n' #functionDeclarationStatement
    ;


initialization : 'value' (name=QUALIFIED_NAME) '=' (value=expression) ':' (type=QUALIFIED_NAME) ;

expression
    : literal
    ;

literal
    : INT #integerLiteral
    ;

functionDeclaration : ;

INT : [0-9]+ ;

SPACE
  :  (' ' | '\t')+ -> skip
  ;

COMMENT
    :   '/*' .*? '*/' -> skip
    ;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip
    ;

