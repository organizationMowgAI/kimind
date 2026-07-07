ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,ouwais).
partie(21,'../parties_joueur/ouwais/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,7,[c(0,green,7,59.06,non,moins),c(1,red,6,5.58,oui,oui),c(2,yellow,5,5.07,non,moins),c(3,blue,4,3.29,non,plus)]),
     coup(2,7,4,[c(0,yellow,5,15.68,oui,moins),c(2,green,7,9.14,non,moins),c(3,blue,7,13.56,non,plus)]),
     coup(3,4,2,[c(0,yellow,4,7.55,oui,oui),c(2,blue,3,40.51,oui,moins),c(3,green,8,19.66,oui,plus)]),
     coup(4,2,1,[c(2,blue,7,1.7,oui,moins),c(3,green,9,6.28,oui,oui)]),
     coup(5,1,1,[c(2,blue,2,9.92,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

v1 is 6                                 : answer of the system 
[dans(v2,[1,2,3,4])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : seen 
c1 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
red avant green                         : intial constraint 
c1 is red                               : seen 
[avant(c2,c1)]
[dans(c2,[blue,green])]=> c2 is blue

c0 \= c2                                : intial constraint 
[dans(c0,[blue,yellow])]
[dans(c2,[blue])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

blue avant yellow                       : intial constraint 
c0 is yellow                            : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

c0 in [blue,yellow]                     : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 < 7                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6]

v1 is 6                                 : seen 
[v0<v1]
[dans(v0,[1,2,3,4,5,6])]=> v0 in [1,2,3,4,5]

v2 in [1,2,3,4]                         : seen 
[v2<v0]
[dans(v0,[1,2,3,4,5])]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,yellow])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9,10] : 

red avant green                         : seen 
c1 is red                               : seen 
c3 is green                             : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v0 in [1,2,3,4,5]                       : seen 
     => v0 max 5

v1 is 6                                 : seen 
     => v1 max 6

v2 in [1,2,3,4]                         : seen 
     => v2 max 4

[max(v0,5)]
[max(v1,6)]
[max(v2,4)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<6,v0+(v1+(v2+v3))<21)]=> v3 in [6,7,8,9,10]

v1 is 6                                 : seen 
[v1<v3]
[dans(v3,[6,7,8,9,10])]=> v3 in [7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4] : 

v0 < 5                                  : answer of the system 
v0 in [2,3,4,5]                         : known domain 
     => v0 in [2,3,4]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

7 < v3                                  : answer of the system 
v3 in [7,8,9,10]                        : known domain 
     => v3 in [8,9,10]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v2 < 3                                  : answer of the system 
v2 in [1,2,3,4]                         : known domain 
     => v2 in [1,2]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

8 < v3                                  : answer of the system 
v3 in [8,9,10]                          : known domain 
     => v3 in [9,10]



************* explanations of the reductions after move 4 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

11 = v2 + v3                            : intial constraint 
     => v2 is 2


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


********** no reduction after move 5 **********

