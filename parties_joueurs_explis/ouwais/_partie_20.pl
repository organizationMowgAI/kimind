ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,ouwais).
partie(20,'../parties_joueur/ouwais/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,1,[c(0,blue,5,3.98,oui,plus),c(1,green,7,20.82,non,plus),c(2,yellow,8,23.46,non,plus),c(3,red,6,3.16,non,plus)]),
     coup(2,1,1,[c(0,blue,6,53.79,oui,plus),c(1,yellow,8,8.04,non,oui),c(2,green,9,4.09,oui,oui),c(3,red,10,6.18,non,oui)]),
     coup(3,1,1,[c(0,blue,7,19.1,oui,oui),c(1,red,8,1.45,oui,oui),c(3,yellow,10,5.19,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c0 is blue                              : seen 
[dans(c1,[red,yellow])]=> c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

5 < v0                                  : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [6,7,8,9,10]

7 < v1                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [8,9,10]

[v0<v1]
[dans(v0,[6,7,8,9,10])]
[dans(v1,[8,9,10])]=> v0 in [6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [red,yellow] : 

c1 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,red])]=> c2 in [green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

8 < v2                                  : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9,10] : 

6 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9,10]                  : known domain 
     => v3 in [7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

6 < v0                                  : answer of the system 
v0 in [6,7,8,9]                         : known domain 
     => v0 in [7,8,9]

v0 < v1                                 : intial constraint 
v1 is 8                                 : answer of the system 
[dans(v0,[7,8,9])]=> v0 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
c3 in [green,yellow]                    : known domain 
     => c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 3 **********

