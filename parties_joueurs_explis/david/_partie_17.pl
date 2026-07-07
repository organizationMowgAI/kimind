ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,david).
partie(17,'../parties_joueur/david/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,3,[c(0,yellow,8,216.55,non,plus),c(1,green,10,4.37,non,oui),c(2,blue,10,4.28,non,moins),c(3,red,5,3.67,non,plus)]),
     coup(2,3,1,[c(0,green,10,82.94,oui,oui),c(1,blue,10,4.31,oui,oui),c(2,red,5,5.03,oui,oui),c(3,yellow,8,3.78,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

8 < v0                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [9,10]

v0 in [9,10]                            : seen 
     => v0 min 9

v1 is 10                                : answer of the system 
     => v1 min 10

5 < v3                                  : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [6,7,8,9,10]

[dans(v3,[6,7,8,9,10])]=> v3 min 6

[min(v0,9)]
[min(v1,10)]
[min(v3,6)]=> if v2 > 8 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>8,v0+(v1+(v2+v3))<33)]=> v2 in [3,4,5,6,7,8]

[dans(v0,[9,10])]
[dans(v2,[3,4,5,6,7,8])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
c0 in [blue,green,red]                  : seen 
blue meme_rang green                    : intial constraint 
[dans(c2,[green,red,yellow])]=> c2 in [red,yellow]

c0 \= c2                                : intial constraint 
red avant yellow                        : intial constraint 
[avant(c2,c0)]
[dans(c0,[blue,green,red])]
[dans(c2,[red,yellow])]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

v0 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,yellow] : 

v2 < 10                                 : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5,6,7,8,9]

v1 is 10                                : seen 
[dans(v2,[3,4,5,6,7,8,9])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
red avant yellow                        : seen 
c2 in [red,yellow]                      : seen 
[avant(c2,c1)]
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [red,yellow] : 

c2 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8] : 

v2 in [3,4,5,6,7,8]                     : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

v3 in [6,7,8,9,10]                      : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


