ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,claire).
partie(20,'../parties_joueur/claire/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,1,[c(0,yellow,10,41.26,non,moins),c(1,blue,7,4.07,non,plus),c(2,red,8,3.56,non,plus),c(3,green,9,3.26,non,plus)]),
     coup(2,1,1,[c(0,blue,7,3.63,oui,oui),c(1,red,8,4.57,oui,oui),c(2,green,9,5.33,oui,oui),c(3,yellow,10,16.36,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5,6,7] : 

7 < v1                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [8,9,10]

[dans(v1,[8,9,10])]=> v1 min 8

8 < v2                                  : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 min 9

v3 > 9                                  : answer of the system 
     => v3 min 10

[min(v1,8)]
[min(v2,9)]
[min(v3,10)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<34)]=> v0 in [4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

v0 in [4,5,6,7]                         : connu_somme_trop_grande 
v2 in [9,10]                            : seen 
     => v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
blue avant red                          : intial constraint 
c0 in [blue,green,red]                  : seen 
[avant(c0,c2)]
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

v0 < 10                                 : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [4,5,6,7,8,9]

v3 is 10                                : seen 
[dans(v0,[4,5,6,7,8,9])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
blue avant green                        : seen 
blue avant red                          : seen 
c0 in [blue,green,red]                  : seen 
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



