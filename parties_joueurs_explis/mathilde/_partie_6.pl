ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,mathilde).
partie(6,'../parties_joueur/mathilde/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,4,[c(0,yellow,1,3.29,oui,plus),c(1,red,2,5.41,oui,plus),c(2,green,9,5.04,oui,moins),c(3,blue,9,32.55,oui,moins)]),
     coup(2,4,1,[c(0,yellow,2,19.83,oui,oui),c(1,red,3,2.46,oui,oui),c(2,green,8,2.06,oui,oui),c(3,blue,8,14.28,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6,7] : 

yellow avant green                      : intial constraint 
c0 is yellow                            : seen 
c2 is green                             : answer of the system 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : answer of the system 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [2,3,4,5,6,7,8,9,10]

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [3,4,5,6,7,8,9,10]

[v0<v1]
[dans(v0,[2,3,4,5,6,7,8,9,10])]
[dans(v1,[3,4,5,6,7,8,9,10])]=> v0 in [2,3,4,5,6,7,8,9]

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]

[v0<v2]
[dans(v0,[2,3,4,5,6,7,8,9])]
[dans(v2,[1,2,3,4,5,6,7,8])]=> v0 in [2,3,4,5,6,7]
v2 in [3,4,5,6,7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7] : 

red avant green                         : intial constraint 
c1 is red                               : seen 
c2 is green                             : seen 
     => c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

v0 < v2                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
     => v0 in [2,3,4,5,6,7]
v2 in [3,4,5,6,7,8]

v1 in [3,4,5,6,7,8,9,10]                : seen 
[v1<v2]
[dans(v0,[2,3,4,5,6,7]),dans(v2,[3,4,5,6,7,8])]=> v1 in [3,4,5,6,7]
v2 in [4,5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7,8] : 

v0 < v2                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
     => v0 in [2,3,4,5,6,7]
v2 in [3,4,5,6,7,8]

v1 < v2                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7,8,9,10]                : seen 
[dans(v0,[2,3,4,5,6,7]),dans(v2,[3,4,5,6,7,8])]=> v1 in [3,4,5,6,7]
v2 in [4,5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7,8] : 

c2 is green                             : seen 
c3 is blue                              : seen 
blue meme_rang green                    : intial constraint 
     => c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

v0 < v2                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
     => v0 in [2,3,4,5,6,7]
v2 in [3,4,5,6,7,8]

v1 < v2                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7,8,9,10]                : seen 
[dans(v0,[2,3,4,5,6,7]),dans(v2,[3,4,5,6,7,8])]=> v1 in [3,4,5,6,7]
v2 in [4,5,6,7,8]

v0 < v2                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [1,2,3,4,5,6,7,8]                 : seen 
     => v0 in [2,3,4,5,6,7]
v2 in [3,4,5,6,7,8]

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]

v2 = v3                                 : connu_simplification_equivalence 
[dans(v0,[2,3,4,5,6,7]),dans(v2,[3,4,5,6,7,8])]
[dans(v3,[1,2,3,4,5,6,7,8])]=> v3 in [3,4,5,6,7,8]

[v2=v3]
[dans(v1,[3,4,5,6,7]),dans(v2,[4,5,6,7,8])]
[dans(v3,[3,4,5,6,7,8])]=> v3 in [4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v1 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


