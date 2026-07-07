ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,claire).
partie(5,'../parties_joueur/claire/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,2,[c(0,blue,1,7.09,non,plus),c(1,green,2,47.99,non,plus),c(2,yellow,5,3.67,non,moins),c(3,red,2,11.25,non,moins)]),
     coup(2,2,1,[c(0,green,2,2.95,oui,oui),c(1,yellow,5,11.71,oui,oui),c(2,red,2,4.75,oui,oui),c(3,blue,1,16.06,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [3,4,5,6,7]

[dans(v1,[3,4,5,6,7])]=> v1 min 3

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 min 1

v3 < 2                                  : answer of the system 
     => v3 min 1

[min(v1,3)]
[min(v2,1)]
[min(v3,1)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>5,v0+(v1+(v2+v3))<10)]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [red,yellow] : 

v1 in [3,4,5,6,7]                       : seen 
v3 is 1                                 : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [2,3,4,5,6,7]

v3 is 1                                 : seen 
[dans(v0,[2,3,4,5,6,7])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
green avant yellow                      : intial constraint 
red avant yellow                        : intial constraint 
c0 in [green,red,yellow]                : seen 
[avant(c3,c0)]
[dans(c3,[blue,green,yellow])]=> c3 in [blue,green]

c1 \= c3                                : intial constraint 
blue avant green                        : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,red,yellow])]
[dans(c3,[blue,green])]=> c1 in [red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6] : 

v1 in [3,4,5,6]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green] : 

c3 in [blue,green]                      : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : known domain 



