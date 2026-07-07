ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,nouredine).
partie(19,'../parties_joueur/nouredine/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,1,[c(0,red,9,28.8,non,plus),c(1,blue,10,3.8,non,moins),c(2,yellow,10,3.24,oui,oui),c(3,green,10,2.61,oui,oui)]),
     coup(2,1,1,[c(0,blue,10,1.58,oui,oui),c(1,red,9,38.02,oui,oui)])
   ]
            ).
resultat(19,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,green]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[blue,green])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 2 **********

