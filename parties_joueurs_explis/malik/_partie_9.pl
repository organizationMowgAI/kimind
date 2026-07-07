ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,malik).
partie(9,'../parties_joueur/malik/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,2,[c(0,red,9,260.73,non,moins),c(1,green,8,3.19,non,moins),c(2,blue,7,3.72,non,moins),c(3,yellow,6,2.49,non,plus)]),
     coup(2,2,1,[c(0,green,9,8.6,oui,moins),c(1,blue,6,30.46,oui,plus),c(2,yellow,5,406.38,oui,oui),c(3,red,10,36.85,oui,oui)]),
     coup(3,1,1,[c(0,green,8,17.41,oui,oui),c(1,blue,7,1.65,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7]

[dans(v1,[1,2,3,4,5,6,7])]=> v1 max 7

v2 < 7                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6]

[dans(v2,[1,2,3,4,5,6])]=> v2 max 6

6 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [7,8,9,10]

[dans(v3,[7,8,9,10])]=> v3 max 10

[max(v1,7)]
[max(v2,6)]
[max(v3,10)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<30)]=> v0 in [7,8]

v0 in [7,8]                             : seen 
     => v0 max 8

v1 max 7                                : seen 
v3 max 10                               : seen 
[max(v0,8)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<30)]=> v2 in [5,6]

[dans(v0,[7,8])]
[dans(v2,[5,6])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : seen 
blue avant green                        : intial constraint 
c2 avant c0                             : connu_simplification_equivalence 
yellow avant green                      : intial constraint 
c0 in [blue,green,yellow]               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [red,yellow]

c0 \= c2                                : seen 
blue avant red                          : intial constraint 
c2 avant c0                             : connu_simplification_equivalence 
green avant red                         : intial constraint 
yellow avant red                        : intial constraint 
c0 in [blue,green,yellow]               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow

c0 \= c2                                : intial constraint 
[avant(c2,c0)]
[dans(c0,[blue,green,yellow])]
[dans(c2,[yellow])]=> c0 in [blue,green]

v0 max 8                                : seen 
v2 max 6                                : seen 
v3 max 10                               : seen 
     => if v1 < 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<6,v0+(v1+(v2+v3))<30)]=> v1 in [6,7]

v0 max 8                                : seen 
v1 max 7                                : seen 
v2 max 6                                : seen 
     => if v3 < 9 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<9,v0+(v1+(v2+v3))<30)]=> v3 in [9,10]

[dans(v1,[6,7])]
[dans(v3,[9,10])]=> v1 < v3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[v1<v3]=> c1 avant c3

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

v0 in [7,8]                             : seen 
v3 in [9,10]                            : seen 
     => v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
blue avant green                        : seen 
c0 in [blue,green]                      : seen 
[avant(c0,c3)]
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c1 \= c3                                : intial constraint 
green avant red                         : seen 
[avant(c1,c3)]
[dans(c1,[blue,red])]
[dans(c3,[green,red])]=> c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,green])]
[dans(c1,[blue])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8] : 

v0 in [7,8]                             : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7] : 

v1 in [6,7]                             : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6] : 

v2 in [5,6]                             : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c0 \= c3                                : seen 
c0 avant c3                             : connu_simplification_equivalence 
c0 is green                             : seen 
c3 in [green,red]                       : seen 
     => c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v1 < v0                                 : intial constraint 
v0 in [7,8]                             : known domain 
v1 > 6                                  : answer of the system 
     => v0 is 8


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


********** no reduction after move 3 **********

