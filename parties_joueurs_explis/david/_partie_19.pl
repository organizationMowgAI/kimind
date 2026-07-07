ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,david).
partie(19,'../parties_joueur/david/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,1,[c(0,blue,10,3.86,oui,oui),c(1,red,9,41.31,oui,oui),c(2,green,10,2.77,non,oui),c(3,yellow,10,1.93,non,oui)]),
     coup(2,1,1,[c(2,yellow,10,10.83,oui,oui),c(3,green,10,1.6,oui,oui)])
   ]
            ).
resultat(19,gagne).

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

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[green,red])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 2 **********

