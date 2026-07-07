ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,jean_pierre).
partie(20,'../parties_joueur/jean_pierre/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,2,[c(0,red,8,4.7,non,moins),c(1,yellow,10,47.18,non,moins),c(2,blue,7,3.4,non,plus),c(3,green,9,5.18,non,plus)]),
     coup(2,2,1,[c(0,blue,7,14.11,oui,oui),c(1,red,8,17.4,oui,oui),c(2,green,9,4.59,oui,oui),c(3,yellow,10,13.16,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

v0 < 8                                  : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [4,5,6,7]

7 < v2                                  : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [8,9,10]

[dans(v0,[4,5,6,7])]
[dans(v2,[8,9,10])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
green avant yellow                      : intial constraint 
red avant yellow                        : intial constraint 
[avant(c0,c2)]
[dans(c0,[blue,green,yellow])]
[dans(c2,[green,red,yellow])]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [5,6,7] : 

v0 in [5,6,7]                           : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9] : 

v0 in [5,6,7]                           : seen 
     => v0 max 7

v2 max 10                               : seen 
v3 max 10                               : seen 
[max(v0,7)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<7,v0+(v1+(v2+v3))<34)]=> v1 in [7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

c2 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

v0 < 8                                  : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [4,5,6,7]

v3 is 10                                : seen 
[dans(v0,[4,5,6,7])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
blue avant green                        : intial constraint 
c0 in [blue,green]                      : seen 
[avant(c0,c3)]
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



