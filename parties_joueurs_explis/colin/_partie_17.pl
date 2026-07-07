ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,colin).
partie(17,'../parties_joueur/colin/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,3,[c(0,blue,10,26.21,non,oui),c(1,green,10,2.24,non,oui),c(2,yellow,8,9.55,non,moins),c(3,red,4,3.02,non,plus)]),
     coup(2,3,2,[c(0,green,10,19.97,oui,oui),c(1,blue,10,0.98,oui,oui),c(2,red,4,6.44,oui,plus),c(3,yellow,9,2.24,oui,moins)]),
     coup(3,2,1,[c(2,red,5,7.14,oui,oui),c(3,yellow,8,1.7,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

v0 is 10                                : answer of the system 
v1 is 10                                : answer of the system 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : seen 
red avant blue                          : intial constraint 
red avant yellow                        : seen 
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,red,yellow])]
[meme_rang(c0,c1)]=> c0 in [green,yellow]

c0 \= c1                                : intial constraint 
red avant yellow                        : intial constraint 
yellow avant blue                       : intial constraint 
c1 in [blue,red,yellow]                 : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
[dans(c0,[green,yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c0 \= c1                                : seen 
red avant green                         : intial constraint 
c0 is green                             : seen 
c1 in [blue,red,yellow]                 : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
     => c1 in [blue,yellow]

c0 \= c1                                : seen 
yellow avant green                      : intial constraint 
c0 is green                             : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
[dans(c1,[blue,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red])]=> c2 is red


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7] : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,yellow])]=> c3 is yellow

yellow avant green                      : seen 
c0 is green                             : seen 
[dans(c3,[yellow])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v2 < 8                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5,6,7]

[dans(v2,[3,4,5,6,7])]=> v2 max 7

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,7)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<33)]=> v3 in [6,7,8,9,10]

v0 is 10                                : seen 
[v3<v0]
[dans(v3,[6,7,8,9,10])]=> v3 in [6,7,8,9]

[dans(v3,[6,7,8,9])]=> v3 max 9

[max(v0,10)]
[max(v1,10)]
[max(v3,9)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<33)]=> v2 in [4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

v3 in [6,7,8,9]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7] : 

4 < v2                                  : answer of the system 
v2 in [4,5,6,7]                         : known domain 
     => v2 in [5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8] : 

v3 < 9                                  : answer of the system 
v3 in [6,7,8,9]                         : known domain 
     => v3 in [6,7,8]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


