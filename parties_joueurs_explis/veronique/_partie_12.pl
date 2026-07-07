ident(12,'37green<red=blue=yellow0red101blue102green73yellow10').
joueur(12,veronique).
partie(12,'../parties_joueur/veronique/_partie_12').
somme(12,37).
ordre_couleurs(12,[green,<,red,=,blue,=,yellow]).
solution(12,[c(0,red,10),c(1,blue,10),c(2,green,7),c(3,yellow,10)]).
nb_solutions(12,24).
cartes_jouees(12,
   [
     coup(1,24,1,[c(0,blue,10,30.97,non,oui),c(1,red,10,5.54,non,oui),c(2,green,7,5.14,oui,oui),c(3,yellow,10,3.74,oui,oui)]),
     coup(2,1,1,[c(0,red,10,12.93,oui,oui),c(1,blue,10,2.79,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c1,[blue,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 2 **********

