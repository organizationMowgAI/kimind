ident(22,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(22,veronique).
partie(22,'../parties_joueur/veronique/_partie_22').
somme(22,21).
ordre_couleurs(22,[blue,<,yellow,<,red,<,green]).
solution(22,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(22,384).
cartes_jouees(22,
   [
     coup(1,384,13,[c(0,blue,2,49.54,non,plus),c(1,yellow,5,3.17,non,plus),c(2,green,8,5.62,non,moins),c(3,red,6,3.94,non,plus)]),
     coup(2,13,2,[c(0,yellow,5,21.11,oui,moins),c(1,red,6,9.08,oui,oui),c(2,blue,2,17.93,oui,oui),c(3,green,8,46.89,oui,plus)]),
     coup(3,2,1,[c(0,yellow,4,34.12,oui,oui),c(3,green,9,2.14,oui,oui)])
   ]
            ).
resultat(22,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7] : 

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

[dans(v1,[6,7,8,9,10])]=> v1 min 6

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]

[dans(v2,[1,2,3,4,5,6,7])]=> v2 min 1

6 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [7,8,9,10]

[dans(v3,[7,8,9,10])]=> v3 min 7

[min(v1,6)]
[min(v2,1)]
[min(v3,7)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<21)]=> v0 in [3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

v0 in [3,4,5,6,7]                       : connu_somme_trop_grande 
     => v0 min 3

v1 min 6                                : connu_min 
v3 min 7                                : connu_min 
[min(v0,3)]=> if v2 > 5 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>5,v0+(v1+(v2+v3))<21)]=> v2 in [1,2,3,4,5]

v1 in [6,7,8,9,10]                      : seen 
[dans(v2,[1,2,3,4,5])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
blue avant red                          : intial constraint 
blue avant yellow                       : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,green,red])]
[dans(c2,[blue,red,yellow])]=> c1 in [green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9,10] : 

v1 in [6,7,8,9,10]                      : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 in [blue,red,yellow]                 : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5] : 

v2 in [1,2,3,4,5]                       : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

v2 in [1,2,3,4,5]                       : connu_somme_trop_grande 
v3 in [7,8,9,10]                        : seen 
     => v2 < v3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[v2<v3]=> c2 avant c3

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
blue avant red                          : seen 
blue avant yellow                       : seen 
c2 in [blue,red,yellow]                 : seen 
[avant(c2,c3)]
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9,10] : 

v3 in [7,8,9,10]                        : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4] : 

v0 < 5                                  : answer of the system 
v0 in [3,4,5,6,7]                       : known domain 
     => v0 in [3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

8 < v3                                  : answer of the system 
v3 in [7,8,9,10]                        : known domain 
     => v3 in [9,10]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


