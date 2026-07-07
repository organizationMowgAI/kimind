ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,camille).
partie(4,'../parties_joueur/camille/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,7,[c(0,blue,9,3.43,non,moins),c(1,red,6,70.43,non,plus),c(2,green,8,3.98,non,plus),c(3,yellow,7,6.65,non,moins)]),
     coup(2,7,3,[c(0,green,8,4.59,non,moins),c(1,yellow,7,22.59,non,plus),c(2,blue,9,8.84,oui,plus),c(3,red,6,25.49,oui,moins)]),
     coup(3,3,1,[c(0,yellow,7,7.98,oui,oui),c(1,green,8,3.31,oui,oui),c(2,blue,10,12.66,oui,oui),c(3,red,5,2.17,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5,6,7,8] : 

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

8 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 max 10

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 max 6

[max(v1,10)]
[max(v2,10)]
[max(v3,6)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<30)]=> v0 in [4,5,6,7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9,10] : 

v1 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

v0 < 9                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6,7,8]

v2 in [9,10]                            : seen 
[dans(v0,[1,2,3,4,5,6,7,8])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
red avant green                         : intial constraint 
red avant yellow                        : intial constraint 
c0 in [green,red,yellow]                : seen 
[avant(c0,c2)]
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

v1 in [7,8,9,10]                        : seen 
v3 in [1,2,3,4,5,6]                     : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
yellow avant blue                       : intial constraint 
c1 in [blue,green,yellow]               : seen 
[avant(c3,c1)]
[dans(c3,[blue,green,red])]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v3 in [2,3,4,5,6]                       : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [green,red,yellow]                : known domain 
     => c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,yellow]               : known domain 
     => c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c1,[blue,green])]=> c1 is green

green avant blue                        : intial constraint 
c2 is blue                              : seen 
[dans(c1,[green])]=> c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

7 < v1                                  : answer of the system 
v1 in [7,8,9,10]                        : known domain 
     => v1 in [8,9,10]

v2 > 9                                  : answer of the system 
[v1<v2]
[dans(v1,[8,9,10])]=> v1 in [8,9]

[dans(v1,[8,9])]=> v1 max 9

v2 is 10                                : seen 
     => v2 max 10

v1 in [8,9,10]                          : seen 
     => v1 max 10

v3 < 6                                  : answer of the system 
v3 in [2,3,4,5,6]                       : known domain 
     => v3 in [2,3,4,5]

[dans(v3,[2,3,4,5])]=> v3 max 5

v2 max 10                               : seen 
[max(v1,10)]
[max(v3,5)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<30)]=> v0 in [5,6,7]

[dans(v0,[5,6,7])]=> v0 max 7

v1 max 10                               : seen 
v2 max 10                               : seen 
[max(v0,7)]=> if v3 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<3,v0+(v1+(v2+v3))<30)]=> v3 in [3,4,5]

[dans(v3,[3,4,5])]=> v3 max 5

[max(v1,9)]
[max(v2,10)]
[max(v3,5)]=> if v0 < 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<6,v0+(v1+(v2+v3))<30)]=> v0 in [6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9] : 

v1 in [8,9]                             : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5] : 

v0 max 7                                : seen 
v1 max 9                                : seen 
v2 max 10                               : seen 
     => if v3 < 4 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<30)]=> v3 in [4,5]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : answer of the system 


