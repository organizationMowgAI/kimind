ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,david).
partie(9,'../parties_joueur/david/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,25,[c(0,blue,6,63.39,non,plus),c(1,green,9,4.85,non,moins),c(2,red,10,4.35,non,moins),c(3,yellow,5,4.22,non,plus)]),
     coup(2,25,5,[c(0,red,10,100.96,non,moins),c(1,yellow,5,10.28,non,plus),c(2,green,9,9.57,non,moins),c(3,blue,6,7.05,non,plus)]),
     coup(3,5,4,[c(0,yellow,5,166.44,non,plus),c(1,red,10,15.38,non,moins),c(2,blue,6,18.54,non,moins),c(3,green,9,9.03,non,plus)]),
     coup(4,4,1,[c(0,green,9,82.91,oui,moins),c(1,blue,6,4.14,oui,plus),c(2,yellow,5,7.51,oui,oui),c(3,red,10,2.63,oui,oui)]),
     coup(5,1,1,[c(0,green,8,25.86,oui,oui),c(1,blue,7,1.73,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9,10] : 

6 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6,7,8] : 

v1 < 9                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5,6,7,8,9] : 

v0 in [7,8,9,10]                        : seen 
     => v0 max 10

v1 in [1,2,3,4,5,6,7,8]                 : seen 
     => v1 max 8

5 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [6,7,8,9,10]

[dans(v3,[6,7,8,9,10])]=> v3 max 10

[max(v0,10)]
[max(v1,8)]
[max(v3,10)]=> if v2 < 2 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<2,v0+(v1+(v2+v3))<30)]=> v2 in [2,3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

v3 in [6,7,8,9,10]                      : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [green,red,yellow]                : known domain 
     => c0 in [green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

v0 < 10                                 : answer of the system 
v0 in [7,8,9,10]                        : known domain 
     => v0 in [7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,red,yellow]                 : known domain 
     => c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8] : 

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,yellow]               : known domain 
     => c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8] : 

v0 in [7,8,9]                           : seen 
     => v0 max 9

v1 in [6,7,8]                           : seen 
     => v1 max 8

6 < v3                                  : answer of the system 
v3 in [6,7,8,9,10]                      : known domain 
     => v3 in [7,8,9,10]

[dans(v3,[7,8,9,10])]=> v3 max 10

[max(v0,9)]
[max(v1,8)]
[max(v3,10)]=> if v2 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<3,v0+(v1+(v2+v3))<30)]=> v2 in [3,4,5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8,9,10] : 

v3 in [7,8,9,10]                        : seen 



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

v0 in [7,8,9]                           : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8] : 

v1 in [6,7,8]                           : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5] : 

v2 < 6                                  : answer of the system 
v2 in [3,4,5,6,7,8]                     : known domain 
     => v2 in [3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= green                             : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



************* explanations of the reductions after move 4 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 < 9                                  : answer of the system 
v0 in [7,8,9]                           : known domain 
     => v0 in [7,8]

6 < v1                                  : answer of the system 
v1 in [6,7,8]                           : known domain 
     => v1 in [7,8]

v1 < v0                                 : intial constraint 
[dans(v0,[7,8])]
[dans(v1,[7,8])]=> v0 is 8
v1 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 < v0                                 : seen 
v0 in [7,8]                             : seen 
v1 in [7,8]                             : seen 
     => v0 is 8
v1 is 7


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 


********** no reduction after move 5 **********

