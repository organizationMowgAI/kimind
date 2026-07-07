ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,malik).
partie(20,'../parties_joueur/malik/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,5,[c(0,green,9,3.63,non,moins),c(1,yellow,10,24.3,non,moins),c(2,blue,7,2.39,non,plus),c(3,red,8,4.2,non,plus)]),
     coup(2,5,1,[c(0,red,8,4.15,non,moins),c(1,blue,7,2.78,non,plus),c(2,green,9,7.87,oui,oui),c(3,yellow,10,28.57,oui,oui)]),
     coup(3,1,1,[c(0,blue,7,11.07,oui,oui),c(1,red,8,3.2,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red] : 

v0 < 9                                  : answer of the system 
v0 in [4,5,6,7,8,9,10]                  : known domain 
     => v0 in [4,5,6,7,8]

8 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9,10]                  : known domain 
     => v3 in [9,10]

[dans(v0,[4,5,6,7,8])]
[dans(v3,[9,10])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
blue avant yellow                       : intial constraint 
green avant yellow                      : intial constraint 
[avant(c0,c3)]
[dans(c0,[blue,red,yellow])]
[dans(c3,[blue,green,yellow])]=> c0 in [blue,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [5,6,7,8] : 

v0 in [5,6,7,8]                         : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9] : 

v0 in [5,6,7,8]                         : seen 
     => v0 max 8

v2 max 10                               : seen 
v3 max 10                               : seen 
[max(v0,8)]=> if v1 < 6 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<6,v0+(v1+(v2+v3))<34)]=> v1 in [6,7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

c0 \= c3                                : seen 
blue avant red                          : intial constraint 
c0 avant c3                             : connu_simplification_equivalence 
c0 in [blue,red]                        : seen 
c3 in [blue,green,yellow]               : seen 
     => c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red]                  : known domain 
     => c1 in [green,red]

c1 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c1,[green,red])]=> c1 is red

red avant green                         : intial constraint 
c2 is green                             : seen 
[dans(c1,[red])]=> c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

7 < v1                                  : answer of the system 
v1 in [6,7,8,9]                         : known domain 
     => v1 in [8,9]

v2 is 9                                 : answer of the system 
[v1<v2]
[dans(v1,[8,9])]=> v1 is 8

[dans(v1,[8])]=> v1 max 8

v2 is 9                                 : seen 
     => v2 max 9

v3 is 10                                : answer of the system 
     => v3 max 10

[max(v1,8)]
[max(v2,9)]
[max(v3,10)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<34)]=> v0 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 3 **********

