ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,david).
partie(14,'../parties_joueur/david/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,2,[c(0,yellow,3,134.8,oui,oui),c(1,red,4,5.2,oui,plus),c(2,blue,8,5.51,non,plus),c(3,green,9,3.84,non,moins)]),
     coup(2,2,1,[c(1,red,5,78.2,oui,oui),c(2,green,9,7.65,oui,oui),c(3,blue,7,5.36,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue

red avant blue                          : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue])]=> c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v0 is 3                                 : seen 
     => v0 min 3

8 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 min 9

yellow avant blue                       : intial constraint 
c0 is yellow                            : seen 
c3 is blue                              : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

v0 min 3                                : connu_min 
v2 min 9                                : connu_min 
[min(v1,5)]=> if v3 > 7 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>7,v0+(v1+(v2+v3))<24)]=> v3 in [1,2,3,4,5,6,7]

v0 is 3                                 : seen 
[v0<v3]
[dans(v3,[1,2,3,4,5,6,7])]=> v3 in [4,5,6,7]

[dans(v3,[4,5,6,7])]=> v3 min 4

[min(v0,3)]
[min(v2,9)]
[min(v3,4)]=> if v1 > 8 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>8,v0+(v1+(v2+v3))<24)]=> v1 in [5,6,7,8]

v3 in [4,5,6,7]                         : seen 
[v1<v3]
[dans(v1,[5,6,7,8])]=> v1 in [5,6]
v3 in [6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7] : 

v1 < v3                                 : connu_simplification_equivalence 
v1 in [5,6,7,8]                         : connu_somme_trop_grande 
v3 in [4,5,6,7]                         : seen 
     => v1 in [5,6]
v3 in [6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


