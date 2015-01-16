//https://theantlrguy.atlassian.net/wiki/display/ANTLR4/Left-recursive+rules
//built on my peg.js version

grammar Boss;
start : VARIABLE EQUALS expression EOI;

//we start to define the expression
expression : additive ;

// additive
additive : substractive ' + ' additive 
	| substractive
	;

//substractive	
substractive : multiplicative ' - ' substractive 
	| multiplicative
	;

//multiplicative
multiplicative : divisive ' * ' multiplicative 
	| divisive
	;

//divisive	
divisive : power ' / ' divisive 
	| power
	;

//power
power : primary ' * ' power 
	| primary
	;

//order in paranthesis from peg.js
//we get an int or we have something in paranthesis and we start again from additive
primary : INTEGER
	| '('additive')' 
	;

INTEGER : [0-9]+ ;
VARIABLE: [a-zA-Z]+; 
EQUALS : ' = ' ;

//End Of Input
EOI : ' $$' ;