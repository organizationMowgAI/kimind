ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,henry).
partie(17,'../parties_joueur/henry/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,18,[c(0,red,6,6.81,non,plus),c(1,yellow,7,12.43,non,plus),c(2,green,10,6.34,non,moins),c(3,blue,10,35.29,non,moins)]),
     coup(2,18,3,[c(0,blue,10,34.48,non,oui),c(1,green,10,11.96,non,oui),c(2,yellow,7,22.63,non,moins),c(3,red,6,5.74,non,plus)]),
     coup(3,3,2,[c(0,green,10,15.51,oui,oui),c(1,blue,10,2.23,oui,oui),c(2,red,6,15.51,oui,moins),c(3,yellow,7,6.7,oui,plus)]),
     coup(4,2,1,[c(2,red,5,13.79,oui,oui),c(3,yellow,8,4.08,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9,10] : 

6 < v0                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

7 < v1                                  : answer of the system 
v1 in [3,4,5,6,7,8,9,10]                : known domain 
     => v1 in [8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7,8,9] : 

v0 in [7,8,9,10]                        : seen 
     => v0 max 10

v1 in [8,9,10]                          : seen 
     => v1 max 10

v3 < 10                                 : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [3,4,5,6,7,8,9]

[dans(v3,[3,4,5,6,7,8,9])]=> v3 max 9

[max(v0,10)]
[max(v1,10)]
[max(v3,9)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<33)]=> v2 in [4,5,6,7,8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7,8,9] : 

v2 in [4,5,6,7,8,9]                     : seen 
     => v2 max 9

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,9)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<33)]=> v3 in [4,5,6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,yellow]               : known domain 
     => c0 in [green,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red]                  : known domain 
     => c1 in [blue,red]

v0 is 10                                : answer of the system 
v1 is 10                                : answer of the system 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
red avant yellow                        : intial constraint 
yellow avant blue                       : intial constraint 
[dans(c0,[green,yellow])]
[dans(c1,[blue,red])]
[meme_rang(c0,c1)]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c0 \= c1                                : seen 
red avant green                         : intial constraint 
c0 is green                             : seen 
c1 in [blue,red]                        : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
     => c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 \= yellow                            : answer of the system 
c2 in [blue,red,yellow]                 : known domain 
     => c2 in [blue,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red])]=> c2 is red


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6] : 

v2 < 7                                  : answer of the system 
v2 in [4,5,6,7,8,9]                     : known domain 
     => v2 in [4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= red                               : answer of the system 
c3 in [green,red,yellow]                : known domain 
     => c3 in [green,yellow]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[green,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9] : 

6 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9]                     : known domain 
     => v3 in [7,8,9]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v2 < 6                                  : answer of the system 
v2 in [4,5,6]                           : known domain 
     => v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9] : 

7 < v3                                  : answer of the system 
v3 in [7,8,9]                           : known domain 
     => v3 in [8,9]



************* explanations of the reductions after move 4 *************

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


