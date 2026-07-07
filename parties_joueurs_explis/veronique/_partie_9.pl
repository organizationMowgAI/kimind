ident(9,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(9,veronique).
partie(9,'../parties_joueur/veronique/_partie_9').
somme(9,24).
ordre_couleurs(9,[blue,<,green,<,yellow,<,red]).
solution(9,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(9,384).
cartes_jouees(9,
   [
     coup(1,384,78,[c(0,green,4,54.89,non,plus),c(1,blue,3,6.94,non,plus),c(2,red,9,10.06,non,moins),c(3,yellow,8,6.31,non,moins)]),
     coup(2,78,2,[c(0,red,9,40.17,oui,oui),c(1,yellow,8,5.96,non,moins),c(2,green,4,4.43,non,plus),c(3,blue,3,3.94,oui,oui)]),
     coup(3,2,1,[c(1,green,4,43.64,oui,plus),c(2,yellow,8,9.09,oui,moins)]),
     coup(4,1,1,[c(1,green,5,15.27,oui,oui),c(2,yellow,7,2.57,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [5,6,7,8,9,10] : 

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6,7,8] : 

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7] : 

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= yellow                            : answer of the system 
c1 in [green,red,yellow]                : known domain 
     => c1 in [green,red]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[green,red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7] : 

v1 < 8                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [4,5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 
c2 in [blue,green,yellow]               : known domain 
     => c2 in [blue,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c2,[blue,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

4 < v1                                  : answer of the system 
v1 in [4,5,6,7]                         : known domain 
     => v1 in [5,6,7]

v2 < 8                                  : answer of the system 
v2 in [5,6,7,8]                         : known domain 
     => v2 in [5,6,7]

v1 < v2                                 : intial constraint 
[dans(v1,[5,6,7])]
[dans(v2,[5,6,7])]=> v1 in [5,6]
v2 in [6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7] : 

v1 < v2                                 : seen 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [5,6]
v2 in [6,7]



************* explanations of the reductions after move 4 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 


