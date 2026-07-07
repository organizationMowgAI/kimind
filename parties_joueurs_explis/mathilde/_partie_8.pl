ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,mathilde).
partie(8,'../parties_joueur/mathilde/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,14,[c(0,blue,2,3.33,non,plus),c(1,green,3,5.49,oui,plus),c(2,yellow,9,20.81,oui,moins),c(3,red,10,15.74,non,moins)]),
     coup(2,14,4,[c(0,red,10,39.43,oui,moins),c(1,green,4,4.16,oui,plus),c(2,yellow,8,4.8,oui,moins),c(3,blue,2,3.7,oui,plus)]),
     coup(3,4,1,[c(0,red,9,29.28,oui,oui),c(1,green,5,2.63,oui,oui),c(2,yellow,7,3.66,oui,oui),c(3,blue,3,2.44,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9,10] : 

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c2 is yellow                            : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

green avant red                         : intial constraint 
c0 is red                               : seen 
c1 is green                             : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]

[v1<v0]
[dans(v0,[3,4,5,6,7,8,9,10])]
[dans(v1,[4,5,6,7,8,9,10])]=> v0 in [5,6,7,8,9,10]
v1 in [4,5,6,7,8,9]

green avant yellow                      : intial constraint 
c1 is green                             : seen 
c2 is yellow                            : seen 
     => c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [4,5,6,7,8,9,10]                  : seen 
     => v0 in [5,6,7,8,9,10]
v1 in [4,5,6,7,8,9]

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]

[v1<v2]
[dans(v0,[5,6,7,8,9,10]),dans(v1,[4,5,6,7,8,9])]
[dans(v2,[1,2,3,4,5,6,7,8])]=> v1 in [4,5,6,7]
v2 in [5,6,7,8]

[v2<v0]
[dans(v0,[5,6,7,8,9,10]),dans(v1,[4,5,6,7,8,9])]
[dans(v1,[4,5,6,7]),dans(v2,[5,6,7,8])]=> v0 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7] : 

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [4,5,6,7,8,9,10]                  : seen 
     => v0 in [5,6,7,8,9,10]
v1 in [4,5,6,7,8,9]

v1 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
[dans(v0,[5,6,7,8,9,10]),dans(v1,[4,5,6,7,8,9])]=> v1 in [4,5,6,7]
v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [4,5,6,7,8,9,10]                  : seen 
     => v0 in [5,6,7,8,9,10]
v1 in [4,5,6,7,8,9]

v1 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
[dans(v0,[5,6,7,8,9,10]),dans(v1,[4,5,6,7,8,9])]=> v1 in [4,5,6,7]
v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6] : 

blue avant green                        : intial constraint 
c1 is green                             : seen 
c3 is blue                              : seen 
     => c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [4,5,6,7,8,9,10]                  : seen 
     => v0 in [5,6,7,8,9,10]
v1 in [4,5,6,7,8,9]

v1 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
[dans(v0,[5,6,7,8,9,10]),dans(v1,[4,5,6,7,8,9])]=> v1 in [4,5,6,7]
v2 in [5,6,7,8]

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[v3<v1]
[dans(v1,[4,5,6,7]),dans(v2,[5,6,7,8])]
[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v3 in [1,2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

v0 < 10                                 : answer of the system 
v0 in [6,7,8,9,10]                      : known domain 
     => v0 in [6,7,8,9]

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

v2 < v0                                 : intial constraint 
[dans(v0,[6,7,8,9])]
[dans(v1,[5,6]),dans(v2,[6,7])]=> v0 in [7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

v1 < v2                                 : seen 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [5,6]
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


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5] : 

v1 < v2                                 : seen 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [5,6]
v2 in [6,7]

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6]                     : known domain 
     => v3 in [3,4,5,6]

v3 < v1                                 : intial constraint 
[dans(v1,[5,6]),dans(v2,[6,7])]
[dans(v3,[3,4,5,6])]=> v3 in [3,4,5]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

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

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


