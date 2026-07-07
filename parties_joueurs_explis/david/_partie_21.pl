ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,david).
partie(21,'../parties_joueur/david/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,6,[c(0,green,8,189.52,non,moins),c(1,yellow,4,8.44,non,plus),c(2,blue,2,5.47,oui,oui),c(3,red,7,3.92,non,plus)]),
     coup(2,6,2,[c(0,yellow,4,66.02,oui,oui),c(1,red,7,4.77,oui,moins),c(3,green,8,5.05,oui,plus)]),
     coup(3,2,1,[c(1,red,6,21.03,oui,oui),c(3,green,9,1.7,oui,oui)])
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

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

v0 < 8                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6,7]

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[dans(v0,[1,2,3,4,5,6,7])]
[dans(v3,[8,9,10])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]

c0 \= c3                                : intial constraint 
yellow avant red                        : intial constraint 
c0 in [red,yellow]                      : seen 
[avant(c0,c3)]
[dans(c3,[green,yellow])]=> c3 is green

c1 \= c3                                : intial constraint 
[dans(c1,[green,red])]
[dans(c3,[green])]=> c1 is red

c0 \= c1                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c1,[red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6] : 

c0 in [red,yellow]                      : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
v2 is 2                                 : seen 
[v2<v0]=> v0 in [3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8] : 

v0 in [3,4,5,6]                         : seen 
     => v0 min 3

v2 min 2                                : connu_min 
v3 min 8                                : connu_min 
[min(v0,3)]=> if v1 > 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>8,v0+(v1+(v2+v3))<21)]=> v1 in [5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v3 in [8,9,10]                          : seen 



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

the value (v1) of the card in position 1 is in [5,6] : 

v1 < 7                                  : answer of the system 
v1 in [5,6,7,8]                         : known domain 
     => v1 in [5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

8 < v3                                  : answer of the system 
v3 in [8,9,10]                          : known domain 
     => v3 in [9,10]



************* explanations of the reductions after move 3 *************

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


