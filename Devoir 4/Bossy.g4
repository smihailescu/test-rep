//https://theantlrguy.atlassian.net/wiki/display/ANTLR4/Left-recursive+rules

grammar Bossy;
start : VARIABLE EQUALS getiton EOI;

//we start to define the expression

getiton : (INTEGER)*
	| (primary)*
	;

	//order in paranthesis
primary : INTEGER
	|expression
	| '('expression')' 
	;
	
expression : INTEGER
			|additive 
			|substractive
			|multiplicative
			|divisive
			|power;

// additive
additive : INTEGER ' + ' INTEGER 
	;

//substractive	
substractive : INTEGER ' - ' INTEGER 
	;

//multiplicative
multiplicative : INTEGER ' * ' INTEGER 
	;

//divisive	
divisive : INTEGER ' / ' INTEGER 
	;

//power
power : INTEGER ' ^ ' INTEGER 
	;

INTEGER : [0-9]+ ;
VARIABLE: [a-zA-Z]+; 
EQUALS : ' = ' ;

//End Of Input
EOI : ' $$' ;