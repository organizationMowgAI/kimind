ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,junkang).
partie(20,'../parties_joueur/junkang/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,5,[c(0,yellow,10,15.07,non,moins),c(1,green,9,5.08,non,moins),c(2,red,8,3.42,non,plus),c(3,blue,7,2.46,non,plus)]),
     coup(2,5,1,[c(0,red,8,9.49,non,moins),c(1,blue,7,2.4,non,plus),c(2,green,9,5.98,oui,oui),c(3,yellow,10,2.1,oui,oui)]),
     coup(3,1,1,[c(0,blue,7,6.42,oui,oui),c(1,red,8,2.63,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

v1 < 9                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [4,5,6,7,8]

[dans(v1,[4,5,6,7,8])]=> v1 max 8

8 < v2                                  : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 max 10

7 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9,10]                  : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 max 10

[max(v1,8)]
[max(v2,10)]
[max(v3,10)]=> if v0 < 6 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<6,v0+(v1+(v2+v3))<34)]=> v0 in [6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

v1 in [4,5,6,7,8]                       : seen 
v2 in [9,10]                            : seen 
     => v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
blue avant yellow                       : intial constraint 
green avant yellow                      : intial constraint 
[avant(c1,c2)]
[dans(c1,[blue,red,yellow])]
[dans(c2,[blue,green,yellow])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8] : 

v1 in [5,6,7,8]                         : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c1 \= c2                                : seen 
blue avant red                          : intial constraint 
c1 avant c2                             : connu_simplification_equivalence 
c1 in [blue,red]                        : seen 
c2 in [blue,green,yellow]               : seen 
     => c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v3 in [8,9,10]                          : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red]                  : known domain 
     => c0 in [blue,green]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[blue,green])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v1 > 7                                  : answer of the system 
     => v1 max 8

v2 is 9                                 : answer of the system 
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

c1 \= blue                              : answer of the system 


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

