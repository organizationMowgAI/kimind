ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,mathilde).
partie(24,'../parties_joueur/mathilde/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,5,[c(0,blue,2,4.43,non,plus),c(1,yellow,4,3.71,oui,plus),c(2,red,4,7.77,oui,plus),c(3,green,10,17.58,non,moins)]),
     coup(2,5,2,[c(0,green,8,6.68,oui,moins),c(1,yellow,5,2.56,oui,oui),c(2,red,5,65.65,oui,oui),c(3,blue,2,3.82,oui,plus)]),
     coup(3,2,1,[c(0,green,7,8.94,oui,oui),c(3,blue,3,2.46,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

yellow avant green                      : intial constraint 
c0 is green                             : seen 
c1 is yellow                            : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]

[dans(v2,[5,6,7,8,9,10])]=> v2 min 5

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v3 min 1

[min(v1,5)]
[min(v2,5)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<20)]=> v0 in [3,4,5,6,7,8,9]

v1 in [5,6,7,8,9,10]                    : seen 
[v1<v0]
[dans(v0,[3,4,5,6,7,8,9])]=> v0 in [6,7,8,9]
v1 in [5,6,7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8] : 

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v1 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v1 in [5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

c1 is yellow                            : seen 
c2 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v1 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v1 in [5,6,7,8]

v2 in [5,6,7,8,9,10]                    : seen 
[v1=v2]
[dans(v0,[6,7,8,9]),dans(v1,[5,6,7,8])]=> v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v1 < v0                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v1 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v1 in [5,6,7,8]

[dans(v0,[6,7,8,9]),dans(v1,[5,6,7,8])]=> v0 min 6

v1 min 5                                : connu_min 
v2 min 5                                : connu_min 
[min(v0,6)]=> if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7] : 

v0 < 8                                  : answer of the system 
v0 in [6,7,8,9]                         : known domain 
     => v0 in [6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4] : 

2 < v3                                  : answer of the system 
v3 in [1,2,3,4]                         : known domain 
     => v3 in [3,4]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


