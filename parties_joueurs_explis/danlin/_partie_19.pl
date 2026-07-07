ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,danlin).
partie(19,'../parties_joueur/danlin/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,2,[c(0,green,10,16.1,non,oui),c(1,red,9,5.9,oui,oui),c(2,blue,10,2.74,non,oui),c(3,yellow,10,2.7,non,oui)]),
     coup(2,2,1,[c(0,yellow,10,6.22,non,oui),c(2,green,10,2.33,non,oui),c(3,blue,10,1.66,non,oui)]),
     coup(3,1,1,[c(0,blue,10,1.13,oui,oui),c(2,yellow,10,5.8,oui,oui),c(3,green,10,1.66,oui,oui)])
   ]
            ).
resultat(19,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

