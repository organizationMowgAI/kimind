ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,david).
partie(1,'../parties_joueur/david/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,1,[c(0,red,10,2.81,oui,oui),c(1,green,5,105.61,non,plus),c(2,yellow,8,12.11,oui,moins),c(3,blue,9,13.51,non,moins)]),
     coup(2,1,1,[c(1,blue,9,108.12,oui,oui),c(2,yellow,7,4.71,oui,oui),c(3,green,6,5.81,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c1,[blue,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v0 is 10                                : seen 
     => v0 max 10

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[green,yellow])]=> c3 is green

green avant yellow                      : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[green])]=> c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

blue avant red                          : intial constraint 
c0 is red                               : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

v2 < 8                                  : answer of the system 
v2 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v2 in [2,3,4,5,6,7]

[dans(v2,[2,3,4,5,6,7])]=> v2 max 7

v3 < 9                                  : answer of the system 
v3 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v3 in [2,3,4,5,6,7,8]

[dans(v3,[2,3,4,5,6,7,8])]=> v3 max 8

v0 max 10                               : seen 
[max(v2,7)]
[max(v3,8)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<7,v0+(v1+(v2+v3))<32)]=> v1 in [7,8,9,10]

v0 is 10                                : seen 
[v1<v0]
[dans(v1,[7,8,9,10])]=> v1 in [7,8,9]

[dans(v1,[7,8,9])]=> v1 max 9

v0 max 10                               : seen 
v3 max 8                                : seen 
[max(v1,9)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<32)]=> v2 in [5,6,7]

v0 max 10                               : seen 
v1 max 9                                : seen 
v2 max 7                                : seen 
     => if v3 < 6 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<32)]=> v3 in [6,7,8]

[v3<v2]
[dans(v2,[5,6,7])]
[dans(v3,[6,7,8])]=> v2 is 7
v3 is 6

[dans(v2,[7]),dans(v3,[6])]=> v2 max 7

v3 < v2                                 : connu_simplification_equivalence 
v2 in [5,6,7]                           : seen 
v3 in [6,7,8]                           : seen 
     => v2 is 7
v3 is 6

[dans(v2,[7]),dans(v3,[6])]=> v3 max 6

[max(v0,10)]
[max(v2,7)]
[max(v3,6)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<9,v0+(v1+(v2+v3))<32)]=> v1 is 9


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [5,6,7]                           : seen 
v3 in [6,7,8]                           : seen 
     => v2 is 7
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



********** no reduction after move 2 **********

