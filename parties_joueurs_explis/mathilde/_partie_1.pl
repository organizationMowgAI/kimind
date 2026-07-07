ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,mathilde).
partie(1,'../parties_joueur/mathilde/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,10,[c(0,green,5,11.69,non,plus),c(1,yellow,8,5.7,non,plus),c(2,blue,9,4.7,non,moins),c(3,red,10,12.04,non,moins)]),
     coup(2,10,1,[c(0,red,10,27.84,oui,oui),c(1,blue,9,4.36,oui,oui),c(2,yellow,8,5.32,oui,moins),c(3,green,5,3.94,oui,plus)]),
     coup(3,1,1,[c(2,yellow,7,16.86,oui,oui),c(3,green,6,2.63,oui,oui)])
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

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

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

green avant yellow                      : intial constraint 
c2 is yellow                            : seen 
c3 is green                             : answer of the system 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v0 is 10                                : seen 
     => v0 max 10

v1 is 9                                 : seen 
     => v1 max 9

green avant blue                        : intial constraint 
c1 is blue                              : seen 
c3 is green                             : seen 
     => c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

5 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9]                     : known domain 
     => v3 in [6,7,8,9]

v1 is 9                                 : seen 
[v3<v1]
[dans(v3,[6,7,8,9])]=> v3 in [6,7,8]

[dans(v3,[6,7,8])]=> v3 max 8

[max(v0,10)]
[max(v1,9)]
[max(v3,8)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<32)]=> v2 in [5,6,7]

v3 in [6,7,8]                           : seen 
[v3<v2]
[dans(v2,[5,6,7])]=> v2 is 7
v3 is 6


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [5,6,7]                           : seen 
v3 in [6,7,8]                           : seen 
     => v2 is 7
v3 is 6



********** no reduction after move 3 **********

