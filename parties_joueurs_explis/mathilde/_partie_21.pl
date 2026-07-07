ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,mathilde).
partie(21,'../parties_joueur/mathilde/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,14,[c(0,blue,1,3.31,non,plus),c(1,yellow,2,5.32,non,plus),c(2,red,8,3.39,non,moins),c(3,green,10,13.72,oui,moins)]),
     coup(2,14,5,[c(0,red,8,33.08,non,moins),c(1,blue,1,9.09,non,plus),c(2,yellow,3,9.25,non,moins),c(3,green,9,7.73,oui,oui)]),
     coup(3,5,1,[c(0,yellow,3,12.25,oui,plus),c(1,red,8,3.87,oui,moins),c(2,blue,1,7.64,oui,plus)]),
     coup(4,1,1,[c(0,yellow,4,3.17,oui,oui),c(1,red,6,3.92,oui,oui),c(2,blue,2,31.49,oui,oui)])
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

the value (v0) of the card in position 0 is in [2,3,4,5,6,7,8] : 

c0 in [red,yellow]                      : seen 
c3 is green                             : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [2,3,4,5,6,7,8,9,10]

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[v0<v3]
[dans(v0,[2,3,4,5,6,7,8,9,10])]
[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v0 in [2,3,4,5,6,7,8]
v3 in [3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7,8] : 

c1 in [blue,red]                        : seen 
c3 is green                             : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [3,4,5,6,7,8,9,10]

v0 < v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8]
v3 in [3,4,5,6,7,8,9]

[v1<v3]
[dans(v1,[3,4,5,6,7,8,9,10])]
[dans(v0,[2,3,4,5,6,7,8]),dans(v3,[3,4,5,6,7,8,9])]=> v1 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6,7] : 

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7,8,9] : 

v0 < v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8]
v3 in [3,4,5,6,7,8,9]

v1 < v3                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7,8,9,10]                : seen 
[dans(v0,[2,3,4,5,6,7,8]),dans(v3,[3,4,5,6,7,8,9])]=> v1 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6,7] : 

v0 < 8                                  : answer of the system 
v0 in [2,3,4,5,6,7,8]                   : known domain 
     => v0 in [2,3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7,8] : 

v1 in [3,4,5,6,7,8]                     : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v2 < 3                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5] : 

3 < v0                                  : answer of the system 
v0 in [2,3,4,5,6,7]                     : known domain 
     => v0 in [4,5,6,7]

v1 < 8                                  : answer of the system 
v1 in [3,4,5,6,7,8]                     : known domain 
     => v1 in [3,4,5,6,7]

v0 < v1                                 : intial constraint 
[dans(v0,[4,5,6,7])]
[dans(v1,[3,4,5,6,7])]=> v0 in [4,5,6]
v1 in [5,6,7]

[dans(v0,[4,5,6]),dans(v1,[5,6,7])]=> v1 min 5

v2 > 1                                  : answer of the system 
     => v2 min 2

[min(v1,5)]
[min(v2,2)]=> if v0 > 5 then v0 + v1 + v2 < 12

12 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0>5,v0+(v1+v2)<12)]=> v0 in [4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

v0 in [4,5]                             : connu_somme_trop_grande 
     => v0 min 4

v2 min 2                                : connu_min 
[min(v0,4)]=> if v1 > 6 then v0 + v1 + v2 < 12

12 = v0 + v1 + v2                       : seen 
[si_alors(v1>6,v0+(v1+v2)<12)]=> v1 in [5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 



************* explanations of the reductions after move 4 *************

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


