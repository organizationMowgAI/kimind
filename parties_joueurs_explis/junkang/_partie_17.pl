ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,junkang).
partie(17,'../parties_joueur/junkang/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,12,[c(0,red,7,2.94,non,plus),c(1,yellow,8,4.27,non,plus),c(2,green,9,478.4,non,moins),c(3,blue,9,4.2,non,moins)]),
     coup(2,12,1,[c(0,blue,9,25.55,non,plus),c(1,green,9,3.22,non,plus),c(2,red,7,3.06,oui,moins),c(3,yellow,8,2.69,oui,oui)]),
     coup(3,1,1,[c(0,green,10,521.08,oui,oui),c(1,blue,10,2.7,oui,oui),c(2,red,5,3.11,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

7 < v0                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

8 < v1                                  : answer of the system 
v1 in [3,4,5,6,7,8,9,10]                : known domain 
     => v1 in [9,10]

v2 < 9                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5,6,7,8]

[dans(v1,[9,10])]
[dans(v2,[3,4,5,6,7,8])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
red avant blue                          : intial constraint 
c1 in [blue,green,red]                  : seen 
blue meme_rang green                    : intial constraint 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c1 \= c2                                : intial constraint 
red avant yellow                        : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,green,red])]
[dans(c2,[red,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v1 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [red,yellow] : 

c2 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v2 in [5,6,7,8]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

v1 in [9,10]                            : seen 
v3 in [3,4,5,6,7,8]                     : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 in [blue,green]                      : seen 
blue meme_rang green                    : seen 
[avant(c3,c1)]
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6,7,8] : 

v3 in [5,6,7,8]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,yellow]               : known domain 
     => c0 in [green,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[green,yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 is 10                                : seen 
     => v0 min 10

v1 is 10                                : seen 
     => v1 min 10

v3 is 8                                 : answer of the system 
     => v3 min 8

[min(v0,10)]
[min(v1,10)]
[min(v3,8)]=> if v2 > 5 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>5,v0+(v1+(v2+v3))<33)]=> v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : seen 



********** no reduction after move 3 **********

