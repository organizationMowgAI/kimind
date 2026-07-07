ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,david).
partie(6,'../parties_joueur/david/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,5,[c(0,red,5,130.42,non,moins),c(1,green,6,7.65,non,moins),c(2,blue,6,4.52,non,plus),c(3,yellow,4,4.99,non,plus)]),
     coup(2,5,2,[c(0,yellow,3,164.29,oui,moins),c(1,red,4,5.13,oui,moins),c(2,green,7,5.58,oui,plus),c(3,blue,7,6.59,oui,plus)]),
     coup(3,2,1,[c(0,yellow,2,41.59,oui,oui),c(1,red,3,3.12,oui,oui),c(2,green,8,3.29,oui,oui),c(3,blue,8,1.59,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

v0 < 5                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4]

6 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [7,8,9,10]

[dans(v0,[1,2,3,4])]
[dans(v2,[7,8,9,10])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
[dans(c0,[blue,green,yellow])]
[dans(c2,[green,red,yellow])]=> c0 in [blue,yellow]

c0 \= c2                                : intial constraint 
red avant blue                          : intial constraint 
yellow avant blue                       : intial constraint 
c2 in [green,red,yellow]                : seen 
blue meme_rang green                    : intial constraint 
[avant(c0,c2)]
[dans(c0,[blue,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4] : 

v0 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

v1 < 6                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5]

v2 in [7,8,9,10]                        : seen 
[dans(v1,[1,2,3,4,5])]=> v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
c0 is yellow                            : seen 
c2 in [green,red,yellow]                : seen 
     => c2 in [green,red]

c1 \= c2                                : intial constraint 
red avant blue                          : seen 
blue meme_rang green                    : seen 
[avant(c1,c2)]
[dans(c1,[blue,red])]
[dans(c2,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5] : 

c0 is yellow                            : seen 
c1 in [blue,red]                        : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 in [1,2,3,4]                         : seen 
v1 in [1,2,3,4,5]                       : seen 
[v0<v1]=> v1 in [2,3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
c1 is red                               : seen 
c2 in [green,red]                       : seen 
     => c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8,9,10] : 

v2 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9,10] : 

c2 is green                             : seen 
c3 is blue                              : seen 
blue meme_rang green                    : seen 
     => c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

4 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [5,6,7,8,9,10]

v2 in [7,8,9,10]                        : seen 
[v2=v3]
[dans(v3,[5,6,7,8,9,10])]=> v3 in [7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2] : 

v0 < 3                                  : answer of the system 
v0 in [1,2,3,4]                         : known domain 
     => v0 in [1,2]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3] : 

v1 < 4                                  : answer of the system 
v1 in [2,3,4,5]                         : known domain 
     => v1 in [2,3]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

7 < v2                                  : answer of the system 
v2 in [7,8,9,10]                        : known domain 
     => v2 in [8,9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

7 < v3                                  : answer of the system 
v3 in [7,8,9,10]                        : known domain 
     => v3 in [8,9,10]



************* explanations of the reductions after move 3 *************

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


