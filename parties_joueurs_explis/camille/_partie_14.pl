ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,camille).
partie(14,'../parties_joueur/camille/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,5,[c(0,yellow,2,44.53,oui,plus),c(1,blue,6,4.42,non,moins),c(2,red,4,5.23,non,plus),c(3,green,8,3.3,non,moins)]),
     coup(2,5,1,[c(0,yellow,3,69.17,oui,oui),c(1,red,4,49.9,oui,plus),c(2,green,9,5.79,oui,oui),c(3,blue,8,4.38,oui,moins)]),
     coup(3,1,1,[c(1,red,5,8.57,oui,oui),c(3,blue,7,6.1,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]

c0 is yellow                            : seen 
[dans(c1,[green,red])]=> c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]

v1 < 6                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5]

[v0<v1]
[dans(v0,[3,4,5,6,7,8,9,10])]
[dans(v1,[1,2,3,4,5])]=> v0 in [3,4]
v1 in [4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [1,2,3,4,5]                       : seen 
     => v0 in [3,4]
v1 in [4,5]

v0 < v1                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [1,2,3,4,5]                       : seen 
     => v0 in [3,4]
v1 in [4,5]

[dans(v0,[3,4]),dans(v1,[4,5])]=> v0 max 4

v0 < v1                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [1,2,3,4,5]                       : seen 
     => v0 in [3,4]
v1 in [4,5]

[dans(v0,[3,4]),dans(v1,[4,5])]=> v1 max 5

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 max 7

[max(v0,4)]
[max(v1,5)]
[max(v3,7)]=> if v2 < 8 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<8,v0+(v1+(v2+v3))<24)]=> v2 in [8,9,10]

[dans(v0,[3,4]),dans(v1,[4,5])]
[dans(v2,[8,9,10])]=> v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
c1 in [green,red]                       : seen 
[avant(c1,c2)]
[dans(c2,[blue,green])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [1,2,3,4,5]                       : seen 
     => v0 in [3,4]
v1 in [4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue

c2 \= c3                                : intial constraint 
c2 in [blue,green]                      : seen 
[dans(c3,[blue])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6,7] : 

v2 in [8,9,10]                          : seen 
     => v2 max 10

v0 max 4                                : seen 
v1 max 5                                : seen 
[max(v2,10)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<24)]=> v3 in [5,6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 > 4                                  : answer of the system 


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

v0 is 3                                 : seen 
     => v0 max 3

v1 is 5                                 : seen 
     => v1 max 5

v2 is 9                                 : seen 
     => v2 max 9

[max(v0,3)]
[max(v1,5)]
[max(v2,9)]=> if v3 < 7 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<7,v0+(v1+(v2+v3))<24)]=> v3 is 7



********** no reduction after move 3 **********

