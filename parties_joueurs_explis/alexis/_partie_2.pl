ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,alexis).
partie(2,'../parties_joueur/alexis/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,1,[c(0,yellow,9,29.23,non,plus),c(1,green,10,3.27,non,moins),c(2,blue,10,2.27,oui,oui),c(3,red,10,2.13,oui,oui)]),
     coup(2,1,1,[c(0,green,10,7.14,oui,oui),c(1,yellow,9,5.12,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


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

