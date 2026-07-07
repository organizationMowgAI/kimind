ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,marc).
partie(21,'../parties_joueur/marc/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,6,[c(0,blue,2,117.58,non,plus),c(1,yellow,3,2.7,non,plus),c(2,red,7,4.39,non,moins),c(3,green,9,2.17,oui,oui)]),
     coup(2,6,1,[c(0,yellow,3,4.07,oui,plus),c(1,red,7,3.06,oui,moins),c(2,blue,2,26.94,oui,oui)]),
     coup(3,1,1,[c(0,yellow,4,14.85,oui,oui),c(1,red,6,1.11,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]

[dans(v1,[4,5,6,7,8,9,10])]=> v1 min 4

v2 < 7                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6]

[dans(v2,[1,2,3,4,5,6])]=> v2 min 1

v3 is 9                                 : answer of the system 
     => v3 min 9

[min(v1,4)]
[min(v2,1)]
[min(v3,9)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<21)]=> v0 in [3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8] : 

v0 in [3,4,5,6,7]                       : connu_somme_trop_grande 
     => v0 min 3

v2 min 1                                : connu_min 
v3 min 9                                : connu_min 
[min(v0,3)]=> if v1 > 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>8,v0+(v1+(v2+v3))<21)]=> v1 in [4,5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5] : 

v0 min 3                                : connu_min 
v1 min 4                                : connu_min 
v3 min 9                                : connu_min 
     => if v2 > 5 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>5,v0+(v1+(v2+v3))<21)]=> v2 in [1,2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5] : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : answer of the system 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v1 < 7                                  : answer of the system 
v1 in [4,5,6,7,8]                       : known domain 
     => v1 in [4,5,6]

[dans(v1,[4,5,6])]=> v1 min 4

v2 is 2                                 : answer of the system 
     => v2 min 2

[min(v1,4)]
[min(v2,2)]=> if v0 > 6 then v0 + v1 + v2 < 12

12 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0>6,v0+(v1+v2)<12)]=> v0 in [4,5,6]

v1 in [4,5,6]                           : seen 
[v0<v1]
[dans(v0,[4,5,6])]=> v0 in [4,5]
v1 in [5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [4,5,6]                           : connu_somme_trop_grande 
v1 in [4,5,6]                           : seen 
     => v0 in [4,5]
v1 in [5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 


