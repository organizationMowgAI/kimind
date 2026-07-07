ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,colin).
partie(20,'../parties_joueur/colin/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,1,[c(0,red,8,17.08,non,moins),c(1,green,9,3.27,non,moins),c(2,yellow,10,2.56,non,moins),c(3,blue,7,3.2,non,plus)]),
     coup(2,1,1,[c(0,blue,7,8.9,oui,oui),c(1,red,8,2.9,oui,oui),c(2,green,9,4.64,oui,oui),c(3,yellow,10,2.06,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

v1 < 9                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [4,5,6,7,8]

[dans(v1,[4,5,6,7,8])]=> v1 max 8

v2 < 10                                 : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [4,5,6,7,8,9]

[dans(v2,[4,5,6,7,8,9])]=> v2 max 9

7 < v3                                  : answer of the system 
v3 in [4,5,6,7,8,9,10]                  : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 max 10

[max(v1,8)]
[max(v2,9)]
[max(v3,10)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<34)]=> v0 is 7

v0 is 7                                 : seen 
     => v0 max 7

v1 max 8                                : seen 
v3 max 10                               : seen 
[max(v0,7)]=> if v2 < 9 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<9,v0+(v1+(v2+v3))<34)]=> v2 is 9

[dans(v0,[7])]
[dans(v2,[9])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

v0 max 7                                : seen 
v2 max 9                                : seen 
v3 max 10                               : seen 
     => if v1 < 8 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<8,v0+(v1+(v2+v3))<34)]=> v1 is 8

v0 is 7                                 : seen 
[dans(v1,[8])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
blue avant yellow                       : intial constraint 
red avant yellow                        : intial constraint 
[avant(c0,c1)]
[dans(c0,[blue,green,yellow])]
[dans(c1,[blue,red,yellow])]=> c0 in [blue,green]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
red avant green                         : intial constraint 
[avant(c0,c2)]
[dans(c0,[blue,green])]
[dans(c2,[blue,green,red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

v1 is 8                                 : seen 
v2 is 9                                 : seen 
     => v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c0 \= c1                                : seen 
blue avant green                        : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 in [blue,green]                      : seen 
c1 in [blue,red,yellow]                 : seen 
     => c1 in [red,yellow]

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
c0 is blue                              : seen 
c2 in [blue,green,red]                  : seen 
     => c2 in [green,red]

c1 \= c2                                : intial constraint 
green avant yellow                      : intial constraint 
red avant yellow                        : seen 
[avant(c1,c2)]
[dans(c1,[red,yellow])]
[dans(c2,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
c1 is red                               : seen 
c2 in [green,red]                       : seen 
     => c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[green,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v0 max 7                                : seen 
v1 max 8                                : seen 
v2 max 9                                : seen 
     => if v3 < 10 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<10,v0+(v1+(v2+v3))<34)]=> v3 is 10



********** no reduction after move 2 **********

