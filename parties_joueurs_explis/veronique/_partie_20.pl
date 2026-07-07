ident(20,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(20,veronique).
partie(20,'../parties_joueur/veronique/_partie_20').
somme(20,39).
ordre_couleurs(20,[red,<,blue,=,yellow,=,green]).
solution(20,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,1,[c(0,blue,10,15.27,oui,oui),c(1,yellow,10,4.55,non,moins),c(2,red,9,6.81,non,plus),c(3,green,10,4.54,oui,oui)]),
     coup(2,1,1,[c(1,red,9,9.38,oui,oui),c(2,yellow,10,3.14,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c1,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[green,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 2 **********

