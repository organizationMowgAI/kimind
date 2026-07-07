ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,valerie).
partie(10,'../parties_joueur/valerie/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,5,[c(0,green,1,21.85,non,plus),c(1,blue,2,5.12,non,plus),c(2,red,3,4.02,non,moins),c(3,yellow,4,2.66,non,moins)]),
     coup(2,5,1,[c(0,red,3,8.51,oui,oui),c(1,yellow,4,3.67,oui,oui),c(2,green,1,3.16,non,plus),c(3,blue,2,2.43,non,moins)]),
     coup(3,1,1,[c(2,blue,2,7.11,oui,oui),c(3,green,1,2.74,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [3,4,5,6,7]

[dans(v1,[3,4,5,6,7])]=> v1 min 3

v2 < 3                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2]

[dans(v2,[1,2])]=> v2 min 1

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2,3]

[dans(v3,[1,2,3])]=> v3 min 1

[min(v1,3)]
[min(v2,1)]
[min(v3,1)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>5,v0+(v1+(v2+v3))<10)]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [red,yellow] : 

v1 in [3,4,5,6,7]                       : seen 
v2 in [1,2]                             : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
green avant yellow                      : intial constraint 
red avant yellow                        : intial constraint 
c1 in [green,red,yellow]                : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
green avant blue                        : intial constraint 
[avant(c2,c1)]
[dans(c1,[green,red,yellow])]
[dans(c2,[blue,green])]=> c1 in [red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6] : 

v1 in [3,4,5,6]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 in [blue,green]                      : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v2 in [1,2]                             : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3] : 

v3 in [1,2,3]                           : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v1 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= green                             : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 > 1                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [green,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,red])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 < 2                                  : answer of the system 



********** no reduction after move 3 **********

