ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,claire).
partie(21,'../parties_joueur/claire/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,7,[c(0,yellow,4,3.77,oui,oui),c(1,green,9,123.69,non,moins),c(2,red,6,2.99,non,moins),c(3,blue,2,3.45,non,plus)]),
     coup(2,7,1,[c(1,red,6,3.19,oui,oui),c(2,blue,2,6.46,oui,oui),c(3,green,9,12.43,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5,6,7,8] : 

v0 is 4                                 : seen 
     => v0 max 4

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 max 5

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 max 10

[max(v0,4)]
[max(v2,5)]
[max(v3,10)]=> if v1 < 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<2,v0+(v1+(v2+v3))<21)]=> v1 in [2,3,4,5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5] : 

v2 in [1,2,3,4,5]                       : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6,7,8,9,10] : 

c0 is yellow                            : seen 
c3 in [green,red]                       : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

v1 in [2,3,4,5,6,7,8]                   : seen 
     => v1 max 8

v0 max 4                                : seen 
v2 max 5                                : seen 
[max(v1,8)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<21)]=> v3 in [4,5,6,7,8,9,10]

v0 is 4                                 : seen 
[v0<v3]
[dans(v3,[4,5,6,7,8,9,10])]=> v3 in [5,6,7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


