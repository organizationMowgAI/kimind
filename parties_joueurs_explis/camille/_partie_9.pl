ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,camille).
partie(9,'../parties_joueur/camille/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,4,[c(0,blue,7,19.02,non,plus),c(1,yellow,5,96.91,non,plus),c(2,green,8,8.14,non,moins),c(3,red,10,2.8,oui,oui)]),
     coup(2,4,1,[c(0,green,8,35.84,oui,oui),c(1,blue,7,18.03,oui,oui),c(2,yellow,5,2.55,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

7 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [8,9,10]

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]

[dans(v0,[8,9,10])]
[dans(v2,[1,2,3,4,5,6,7])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
[avant(c2,c0)]
[dans(c0,[green,yellow])]
[dans(c2,[blue,yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

c0 in [green,yellow]                    : seen 
c3 is red                               : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

v0 in [8,9,10]                          : seen 
v3 is 10                                : seen 
[v0<v3]=> v0 in [8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8] : 

blue avant green                        : intial constraint 
c0 is green                             : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

c1 in [blue,green]                      : seen 
c3 is red                               : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v1 in [6,7,8,9,10]                      : seen 
v3 is 10                                : seen 
[v1<v3]=> v1 in [6,7,8,9]

v0 in [8,9]                             : seen 
[v1<v0]
[dans(v1,[6,7,8,9])]=> v1 in [6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
c2 in [blue,yellow]                     : seen 
     => c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6] : 

v0 in [8,9]                             : seen 
     => v0 max 9

v1 in [6,7,8]                           : seen 
     => v1 max 8

v3 is 10                                : seen 
     => v3 max 10

[max(v0,9)]
[max(v1,8)]
[max(v3,10)]=> if v2 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<3,v0+(v1+(v2+v3))<30)]=> v2 in [3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 


