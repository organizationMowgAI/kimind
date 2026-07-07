ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,colin).
partie(1,'../parties_joueur/colin/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,4,[c(0,blue,9,76.92,non,plus),c(1,red,10,2.2,non,moins),c(2,green,6,20.69,non,plus),c(3,yellow,7,6.35,non,moins)]),
     coup(2,4,1,[c(0,red,10,14.74,oui,oui),c(1,blue,9,53.87,oui,oui),c(2,yellow,7,1.72,oui,oui),c(3,green,6,2.24,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

v1 < 10                                 : answer of the system 
v1 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v1 in [2,3,4,5,6,7,8,9]

v0 > 9                                  : answer of the system 
[dans(v1,[2,3,4,5,6,7,8,9])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
green avant blue                        : intial constraint 
green avant yellow                      : intial constraint 
[avant(c1,c0)]
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,green,yellow])]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 in [blue,green,yellow]               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9] : 

v1 in [6,7,8,9]                         : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8,9,10] : 

v2 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green] : 

v0 is 10                                : seen 
v3 in [2,3,4,5,6]                       : seen 
     => v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
yellow avant red                        : intial constraint 
c0 in [red,yellow]                      : seen 
[avant(c3,c0)]
[dans(c3,[blue,green,red])]=> c3 in [blue,green]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5,6] : 

v3 in [3,4,5,6]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 is 6                                 : answer of the system 


