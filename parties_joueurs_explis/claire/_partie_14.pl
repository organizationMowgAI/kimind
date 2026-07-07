ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,claire).
partie(14,'../parties_joueur/claire/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,15,[c(0,green,10,93.81,non,moins),c(1,yellow,3,4.44,non,plus),c(2,blue,6,3.05,non,plus),c(3,red,5,3.61,non,plus)]),
     coup(2,15,1,[c(0,yellow,3,9.68,oui,oui),c(1,red,5,4.76,oui,oui),c(2,green,10,2.49,oui,moins),c(3,blue,6,4.14,oui,plus)]),
     coup(3,1,1,[c(2,green,9,17.02,oui,oui),c(3,blue,7,3.11,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6,7] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]

[dans(v1,[4,5,6,7,8,9,10])]=> v1 min 4

6 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [7,8,9,10]

[dans(v2,[7,8,9,10])]=> v2 min 7

5 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [6,7,8,9,10]

[dans(v3,[6,7,8,9,10])]=> v3 min 6

[min(v1,4)]
[min(v2,7)]
[min(v3,6)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<24)]=> v0 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

v1 in [4,5,6,7,8,9,10]                  : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8,9,10] : 

v2 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

v3 in [6,7,8,9,10]                      : seen 



************* explanations of the reductions after move 2 *************

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

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

blue avant green                        : intial constraint 
c2 is green                             : seen 
c3 is blue                              : answer of the system 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 < 10                                 : answer of the system 
v2 in [7,8,9,10]                        : known domain 
     => v2 in [7,8,9]

v0 is 3                                 : seen 
     => v0 min 3

v1 is 5                                 : seen 
     => v1 min 5

v2 in [7,8,9]                           : seen 
     => v2 min 7

[min(v0,3)]
[min(v1,5)]
[min(v2,7)]=> if v3 > 9 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>9,v0+(v1+(v2+v3))<24)]=> v3 in [7,8,9]

[v3<v2]
[dans(v2,[7,8,9])]
[dans(v3,[7,8,9])]=> v2 in [8,9]
v3 in [7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8] : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [7,8,9]                           : seen 
v3 in [7,8,9]                           : connu_somme_trop_grande 
     => v2 in [8,9]
v3 in [7,8]



************* explanations of the reductions after move 3 *************

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


