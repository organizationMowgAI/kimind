ident(18,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(18,veronique).
partie(18,'../parties_joueur/veronique/_partie_18').
somme(18,33).
ordre_couleurs(18,[red,<,yellow,<,green,=,blue]).
solution(18,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(18,96).
cartes_jouees(18,
   [
     coup(1,96,18,[c(0,red,5,35.84,non,plus),c(1,yellow,8,6.54,non,plus),c(2,blue,10,3.67,non,moins),c(3,green,10,3.03,non,moins)]),
     coup(2,18,3,[c(0,blue,10,30.17,non,oui),c(1,green,10,5.09,non,oui),c(2,yellow,8,3.39,non,moins),c(3,red,5,5.8,non,plus)]),
     coup(3,3,1,[c(0,green,10,13.21,oui,oui),c(1,blue,10,2.98,oui,oui),c(2,red,5,19.94,oui,oui),c(3,yellow,8,4.43,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9,10] : 

5 < v0                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [3,4,5,6,7,8,9,10]                : known domain 
     => v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7,8,9] : 

v0 in [6,7,8,9,10]                      : seen 
     => v0 max 10

v1 in [9,10]                            : seen 
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

the colour (c3) of the card in position 3 is in [blue,red,yellow] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]


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
c2 in [green,red,yellow]                : known domain 
     => c2 in [green,red]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[green,red])]=> c2 is red


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7] : 

v2 < 8                                  : answer of the system 
v2 in [4,5,6,7,8,9]                     : known domain 
     => v2 in [4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= red                               : answer of the system 
c3 in [blue,red,yellow]                 : known domain 
     => c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

5 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9]                     : known domain 
     => v3 in [6,7,8,9]



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


