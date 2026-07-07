ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,malik).
partie(0,'../parties_joueur/malik/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,1,[c(0,green,10,101.91,non,moins),c(1,blue,7,5.12,oui,plus),c(2,red,7,11.39,non,plus),c(3,yellow,6,3.76,oui,plus)]),
     coup(2,1,1,[c(0,red,9,4.07,oui,oui),c(1,blue,9,124.32,oui,oui),c(2,green,10,6.5,oui,oui),c(3,yellow,7,7.61,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 < 10                                 : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [5,6,7,8,9]

7 < v1                                  : answer of the system 
v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 in [8,9,10]

[v0=v1]
[dans(v0,[5,6,7,8,9])]
[dans(v1,[8,9,10])]=> v0 in [8,9]
v1 in [8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9] : 

v0 = v1                                 : connu_simplification_equivalence 
v0 in [5,6,7,8,9]                       : seen 
v1 in [8,9,10]                          : seen 
     => v0 in [8,9]
v1 in [8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c2 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

red avant green                         : intial constraint 
c0 is red                               : seen 
c2 is green                             : seen 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

v0 = v1                                 : connu_simplification_equivalence 
v0 in [5,6,7,8,9]                       : seen 
v1 in [8,9,10]                          : seen 
     => v0 in [8,9]
v1 in [8,9]

7 < v2                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [8,9,10]

[v0<v2]
[dans(v0,[8,9]),dans(v1,[8,9])]
[dans(v2,[8,9,10])]=> v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8] : 

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c3 is yellow                            : seen 
     => c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v0 = v1                                 : connu_simplification_equivalence 
v0 in [5,6,7,8,9]                       : seen 
v1 in [8,9,10]                          : seen 
     => v0 in [8,9]
v1 in [8,9]

6 < v3                                  : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [7,8,9,10]

[v3<v0]
[dans(v0,[8,9]),dans(v1,[8,9])]
[dans(v3,[7,8,9,10])]=> v3 in [7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


