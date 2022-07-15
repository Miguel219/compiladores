grammar Yapl;
program: (class ';')+ ;
class: CLASS TYPE (INHERITS TYPE)? '{' ((method | attribute) ';')* '}' ;
method: ID '(' (formal (',' formal)* )? ')' ':' TYPE '{' expr '}';
attribute: ID ':' TYPE ('<-' expr)? (',' ID ':' TYPE ('<-' expr)?)*;
formal: ID ':' TYPE;
expr: ID
    | INTEGER
    | STRING
    | TRUE
    | FALSE
    | NEW TYPE
    | ISVOID expr
    | ('~' | NOT) expr
    | expr ('<' | '<=' | '=') expr
    | expr ('*' | '/') expr
    | expr ('+' | '-') expr
    | '(' expr ')'
    | ID '<-' expr
    | expr ('@' TYPE)? '.' ID '(' (expr (',' expr)* )? ')'
    | ID '(' (expr (',' expr)* )? ')'
    | IF expr THEN expr ELSE expr FI
    | WHILE expr LOOP expr POOL
    | '{' (expr ';')+ '}'
    | LET ID ':' TYPE ('<-' expr)? (',' ID ':' TYPE ('<-' expr)?)* IN expr;

CLASS: 'class';
ELSE: 'else';
FALSE: 'false';
FI: 'fi';
IF: 'if';
IN: 'in';
INHERITS: 'inherits';
ISVOID: 'isvoid';
LOOP: 'loop';
POOL: 'pool';
THEN: 'then';
WHILE: 'while';
NEW: 'new';
NOT: 'not';
TRUE: 'true';
LET: 'let';

STRING: '"' [\u0000-\u0021\u0023-\u00FF]* '"';
TYPE: 'SELF_TYPE'
    | [A-Z][a-zA-Z]*;
INTEGER: [0-9]+;
ID:   [0-9a-zA-Z_]+;

WS: [ \t\r\n]+ -> skip;
COMMENTS: ('--' [\u0000-\u0009\u000B-\u00FF]* [\n]
        | '(*' [\u0000-\u00FF]* '*)' ) -> skip;
