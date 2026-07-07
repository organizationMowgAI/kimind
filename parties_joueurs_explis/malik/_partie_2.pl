ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,malik).
partie(2,'../parties_joueur/malik/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,1,[c(0,blue,10,2.28,non,oui),c(1,yellow,9,11.86,oui,oui),c(2,green,10,5.68,non,oui),c(3,red,10,1.85,oui,oui)]),
     coup(2,1,1,[c(0,green,10,1.7,oui,oui),c(2,blue,10,5.07,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,red]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,red])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 2 **********

