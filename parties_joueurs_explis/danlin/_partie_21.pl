ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,danlin).
partie(21,'../parties_joueur/danlin/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,6,[c(0,red,6,52.91,non,moins),c(1,green,9,3.68,non,moins),c(2,blue,2,4.47,oui,oui),c(3,yellow,4,2.15,non,plus)]),
     coup(2,6,1,[c(0,yellow,4,2.17,oui,oui),c(1,red,6,4.44,oui,oui),c(3,green,9,20.45,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

v0 < 6                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5]

v0 in [1,2,3,4,5]                       : seen 
     => v0 max 5

v2 is 2                                 : answer of the system 
     => v2 max 2

4 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [5,6,7,8,9,10]

[dans(v3,[5,6,7,8,9,10])]=> v3 max 10

v0 max 5                                : seen 
[max(v2,2)]
[max(v3,10)]=> if v1 < 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<4,v0+(v1+(v2+v3))<21)]=> v1 in [4,5,6,7,8]

[dans(v1,[4,5,6,7,8])]=> v1 max 8

v2 max 2                                : seen 
[max(v0,5)]
[max(v1,8)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<6,v0+(v1+(v2+v3))<21)]=> v3 in [6,7,8,9,10]

[dans(v0,[1,2,3,4,5])]
[dans(v3,[6,7,8,9,10])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c0 \= c3                                : intial constraint 
red avant green                         : intial constraint 
[avant(c0,c3)]
[dans(c0,[green,yellow])]
[dans(c3,[green,red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5] : 

c0 in [green,yellow]                    : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 in [1,2,3,4,5]                       : seen 
v2 is 2                                 : seen 
[v2<v0]=> v0 in [3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[red,yellow])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8] : 

v1 in [4,5,6,7,8]                       : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
c3 in [green,red]                       : seen 
     => c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

v3 in [6,7,8,9,10]                      : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


