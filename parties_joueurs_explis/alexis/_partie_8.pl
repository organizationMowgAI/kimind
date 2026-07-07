ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,alexis).
partie(8,'../parties_joueur/alexis/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,4,[c(0,blue,3,49.97,non,plus),c(1,green,6,6.93,oui,moins),c(2,yellow,7,3.18,oui,oui),c(3,red,8,1.87,non,moins)]),
     coup(2,4,1,[c(0,red,9,24.24,oui,oui),c(1,green,5,2.91,oui,oui),c(3,blue,3,2.04,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c2 is yellow                            : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v1 < 6                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5]

[dans(v1,[1,2,3,4,5])]=> v1 max 5

v2 is 7                                 : answer of the system 
     => v2 max 7

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 max 7

[max(v1,5)]
[max(v2,7)]
[max(v3,7)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<24)]=> v0 in [5,6,7,8,9,10]

v2 is 7                                 : seen 
[v2<v0]
[dans(v0,[5,6,7,8,9,10])]=> v0 in [8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue

blue avant green                        : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue])]=> c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

v0 in [5,6,7,8,9,10]                    : seen 
     => v0 max 10

v1 max 5                                : seen 
v2 max 7                                : seen 
[max(v0,10)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<24)]=> v3 in [2,3,4,5,6,7]

v1 in [1,2,3,4,5]                       : seen 
[v3<v1]
[dans(v3,[2,3,4,5,6,7])]=> v1 in [3,4,5]
v3 in [2,3,4]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4] : 

v3 < v1                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : seen 
v3 in [2,3,4,5,6,7]                     : seen 
     => v1 in [3,4,5]
v3 in [2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


