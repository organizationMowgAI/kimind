ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,ouwais).
partie(1,'../parties_joueur/ouwais/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,6,[c(0,green,4,59.36,non,plus),c(1,yellow,5,2.81,non,plus),c(2,blue,6,4.09,non,plus),c(3,red,7,1.68,non,moins)]),
     coup(2,6,2,[c(0,blue,9,4.89,non,plus),c(1,red,10,71.29,non,moins),c(2,yellow,5,35.79,oui,plus),c(3,green,3,49.02,oui,plus)]),
     coup(3,2,1,[c(0,red,9,13.96,oui,plus),c(1,blue,8,8.98,oui,plus),c(2,yellow,7,25.61,oui,oui),c(3,green,6,17.18,oui,oui)]),
     coup(4,1,1,[c(0,red,10,3.15,oui,oui),c(1,blue,9,16.34,oui,oui)])
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

5 < v1                                  : answer of the system 
v1 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v1 in [6,7,8,9,10]

[dans(v1,[6,7,8,9,10])]=> v1 max 10

6 < v2                                  : answer of the system 
v2 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v2 in [7,8,9,10]

[dans(v2,[7,8,9,10])]=> v2 max 10

v3 < 7                                  : answer of the system 
v3 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v3 in [2,3,4,5,6]

[dans(v3,[2,3,4,5,6])]=> v3 max 6

[max(v1,10)]
[max(v2,10)]
[max(v3,6)]=> if v0 < 6 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<6,v0+(v1+(v2+v3))<32)]=> v0 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9,10] : 

v1 in [6,7,8,9,10]                      : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [red,yellow] : 

v2 in [7,8,9,10]                        : seen 
v3 in [2,3,4,5,6]                       : seen 
     => v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
green avant yellow                      : intial constraint 
[avant(c3,c2)]
[dans(c2,[green,red,yellow])]
[dans(c3,[blue,green,yellow])]=> c2 in [red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8,9,10] : 

v2 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 in [blue,green,yellow]               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v3 in [2,3,4,5,6]                       : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red]                  : known domain 
     => c1 in [blue,green]

c1 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9] : 

yellow avant blue                       : intial constraint 
c1 is blue                              : seen 
c2 is yellow                            : seen 
     => c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

v0 is 10                                : seen 
     => v0 max 10

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c2 is yellow                            : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 is 10                                : seen 
v2 in [7,8,9,10]                        : known domain 
[v2<v0]=> v2 in [7,8,9]

[dans(v2,[7,8,9])]=> v2 max 9

3 < v3                                  : answer of the system 
v3 in [2,3,4,5,6]                       : known domain 
     => v3 in [4,5,6]

[dans(v3,[4,5,6])]=> v3 max 6

[max(v0,10)]
[max(v2,9)]
[max(v3,6)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<7,v0+(v1+(v2+v3))<32)]=> v1 in [7,8,9]

v2 in [7,8,9]                           : seen 
[v2<v1]
[dans(v1,[7,8,9])]=> v1 in [8,9]
v2 in [7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [7,8,9]                           : seen 
v2 in [7,8,9]                           : seen 
     => v1 in [8,9]
v2 in [7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [7,8,9]                           : seen 
v2 in [7,8,9]                           : seen 
     => v1 in [8,9]
v2 in [7,8]

[dans(v1,[8,9]),dans(v2,[7,8])]=> v1 max 9

v2 < v1                                 : connu_simplification_equivalence 
v1 in [7,8,9]                           : seen 
v2 in [7,8,9]                           : seen 
     => v1 in [8,9]
v2 in [7,8]

[dans(v1,[8,9]),dans(v2,[7,8])]=> v2 max 8

v0 max 10                               : seen 
[max(v1,9)]
[max(v2,8)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<32)]=> v3 in [5,6]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 > 8                                  : answer of the system 


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


********** no reduction after move 4 **********

