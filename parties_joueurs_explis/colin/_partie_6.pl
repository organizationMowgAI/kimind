ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,colin).
partie(6,'../parties_joueur/colin/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,30,[c(0,blue,7,36.37,non,moins),c(1,green,7,2.6,non,moins),c(2,red,5,6.86,non,plus),c(3,yellow,2,6.01,non,plus)]),
     coup(2,30,1,[c(0,yellow,2,14.52,oui,oui),c(1,red,3,2.36,oui,oui),c(2,green,8,14.26,oui,oui),c(3,blue,8,3.22,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6] : 

v0 < 7                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6] : 

v1 < 7                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7,8,9,10] : 

5 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5,6,7,8,9,10] : 

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v1 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


