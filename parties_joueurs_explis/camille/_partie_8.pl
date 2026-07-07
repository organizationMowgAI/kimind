ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,camille).
partie(8,'../parties_joueur/camille/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,78,[c(0,blue,3,165.69,non,plus),c(1,yellow,8,14.08,non,moins),c(2,green,4,3.14,non,plus),c(3,red,9,2.55,non,moins)]),
     coup(2,78,11,[c(0,yellow,8,28.65,non,plus),c(1,blue,3,3.19,non,plus),c(2,red,9,15.85,non,moins),c(3,green,4,2.58,non,moins)]),
     coup(3,11,1,[c(0,red,9,46.95,oui,oui),c(1,green,4,4.15,oui,plus),c(2,yellow,8,2.54,oui,moins),c(3,blue,3,2.57,oui,oui)]),
     coup(4,1,1,[c(1,green,5,21.78,oui,oui),c(2,yellow,7,2.01,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5,6,7,8,9,10] : 

3 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6,7] : 

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8,9,10] : 

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7,8] : 

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

8 < v0                                  : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [9,10]

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [4,5,6,7]

[dans(v0,[9,10])]
[dans(v1,[4,5,6,7])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c0 \= yellow                            : answer of the system 
c0 in [green,red,yellow]                : known domain 
     => c0 in [green,red]

blue \= c1                              : answer of the system 
c1 in [blue,green,red]                  : known domain 
     => c1 in [green,red]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
green avant red                         : intial constraint 
c0 in [green,red]                       : seen 
[dans(c1,[green,red])]=> c1 is green

c0 \= c1                                : intial constraint 
[avant(c1,c0)]
[dans(c0,[green,red])]
[dans(c1,[green])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

v0 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7] : 

v1 in [4,5,6,7]                         : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= red                               : answer of the system 
c2 in [blue,red,yellow]                 : known domain 
     => c2 in [blue,yellow]

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v3 in [1,2,3]

v1 in [4,5,6,7]                         : seen 
[dans(v3,[1,2,3])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= green                             : answer of the system 
c3 in [blue,green,yellow]               : known domain 
     => c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
green avant yellow                      : intial constraint 
c1 is green                             : seen 
[avant(c3,c1)]
[dans(c3,[blue,yellow])]=> c3 is blue

c2 \= c3                                : intial constraint 
[dans(c2,[blue,yellow])]
[dans(c3,[blue])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v2 < 9                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3] : 

v3 in [1,2,3]                           : seen 



************* explanations of the reductions after move 3 *************

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

the value (v1) of the card in position 1 is in [5,6] : 

4 < v1                                  : answer of the system 
v1 in [4,5,6,7]                         : known domain 
     => v1 in [5,6,7]

v2 < 8                                  : answer of the system 
v2 in [5,6,7,8]                         : known domain 
     => v2 in [5,6,7]

v1 < v2                                 : intial constraint 
[dans(v1,[5,6,7])]
[dans(v2,[5,6,7])]=> v1 in [5,6]
v2 in [6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7] : 

v1 < v2                                 : seen 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [5,6]
v2 in [6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


************* explanations of the reductions after move 4 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 


