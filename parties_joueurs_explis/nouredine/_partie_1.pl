ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,nouredine).
partie(1,'../parties_joueur/nouredine/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,10,[c(0,green,5,20.28,non,plus),c(1,yellow,8,4.79,non,plus),c(2,blue,9,4.99,non,moins),c(3,red,10,8.17,non,moins)]),
     coup(2,10,2,[c(0,blue,9,21.9,non,plus),c(1,red,10,4.74,non,moins),c(2,green,6,10.46,non,plus),c(3,yellow,7,9.08,non,moins)]),
     coup(3,2,1,[c(0,red,10,33.11,oui,oui),c(1,blue,9,9.51,oui,oui),c(2,yellow,7,28.09,oui,oui),c(3,green,6,6.28,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9,10] : 

5 < v0                                  : answer of the system 
v0 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v0 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

8 < v1                                  : answer of the system 
v1 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v1 in [9,10]

v2 < 9                                  : answer of the system 
v2 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v2 in [2,3,4,5,6,7,8]

[dans(v1,[9,10])]
[dans(v2,[2,3,4,5,6,7,8])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : seen 
blue avant red                          : intial constraint 
c2 avant c1                             : connu_simplification_equivalence 
green avant red                         : intial constraint 
c1 in [blue,green,red]                  : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
green avant yellow                      : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,green,red])]
[dans(c2,[green,yellow])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v1 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8] : 

v2 in [3,4,5,6,7,8]                     : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7,8,9] : 

v2 in [3,4,5,6,7,8]                     : seen 
     => v2 max 8

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,8)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<32)]=> v3 in [4,5,6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 \= green                             : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8] : 

6 < v2                                  : answer of the system 
v2 in [3,4,5,6,7,8]                     : known domain 
     => v2 in [7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,yellow]               : known domain 
     => c3 in [blue,green]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6] : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 9                                 : seen 
     => v1 max 9

v2 in [7,8]                             : seen 
     => v2 max 8

[max(v0,10)]
[max(v1,9)]
[max(v2,8)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<32)]=> v3 in [5,6]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 is 6                                 : answer of the system 


