ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,nouredine).
partie(10,'../parties_joueur/nouredine/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,5,[c(0,green,1,43.46,non,plus),c(1,blue,2,3.1,non,plus),c(2,red,3,3.1,non,moins),c(3,yellow,4,7.73,non,moins)]),
     coup(2,5,1,[c(0,blue,2,26.28,non,plus),c(1,yellow,4,4.07,oui,oui),c(2,green,1,4.06,non,plus),c(3,red,3,8.87,non,moins)]),
     coup(3,1,1,[c(0,red,3,18.43,oui,oui),c(2,blue,2,6.18,oui,oui),c(3,green,1,6.66,oui,oui)])
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

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v1 is 4                                 : answer of the system 
     => v1 min 4

v2 > 1                                  : answer of the system 
     => v2 min 2

v3 < 3                                  : answer of the system 
v3 in [1,2,3]                           : known domain 
     => v3 in [1,2]

[dans(v3,[1,2])]=> v3 min 1

[min(v1,4)]
[min(v2,2)]
[min(v3,1)]=> if v0 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>3,v0+(v1+(v2+v3))<10)]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v1 is 4                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= green                             : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [blue,green]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,green])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v0 is 3                                 : connu_somme_trop_grande 
     => v0 min 3

v1 min 4                                : connu_min 
v2 min 2                                : connu_min 
[min(v0,3)]=> if v3 > 1 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>1,v0+(v1+(v2+v3))<10)]=> v3 is 1



********** no reduction after move 3 **********

