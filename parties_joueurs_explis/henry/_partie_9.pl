ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,henry).
partie(9,'../parties_joueur/henry/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,7,[c(0,yellow,3,21.09,non,plus),c(1,red,8,28.25,non,moins),c(2,green,9,10.37,non,moins),c(3,blue,10,45.4,non,oui)]),
     coup(2,7,1,[c(0,green,9,26.69,oui,moins),c(1,yellow,3,15.47,non,plus),c(2,blue,8,36.94,non,moins),c(3,red,10,37.53,oui,oui)]),
     coup(3,1,1,[c(0,green,8,29.23,oui,oui),c(1,yellow,5,16.78,non,plus),c(2,blue,7,93.03,non,moins)]),
     coup(4,1,1,[c(1,blue,7,68.24,oui,oui),c(2,yellow,5,12.34,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [5,6,7,8,9,10] : 

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7]

[dans(v1,[1,2,3,4,5,6,7])]=> v1 max 7

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]

[dans(v2,[1,2,3,4,5,6,7,8])]=> v2 max 8

v3 is 10                                : answer of the system 
     => v3 max 10

[max(v1,7)]
[max(v2,8)]
[max(v3,10)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<30)]=> v0 in [5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5,6,7] : 

v0 in [5,6,7,8,9,10]                    : seen 
     => v0 max 10

v2 max 8                                : seen 
v3 max 10                               : seen 
[max(v0,10)]=> if v1 < 2 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<2,v0+(v1+(v2+v3))<30)]=> v1 in [2,3,4,5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

v2 in [1,2,3,4,5,6,7,8]                 : seen 
v3 is 10                                : seen 
     => v2 < v3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[v2<v3]=> c2 avant c3

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

v1 in [1,2,3,4,5,6,7]                   : seen 
v3 is 10                                : seen 
     => v1 < v3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[v1<v3]=> c1 avant c3

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
yellow avant blue                       : intial constraint 
yellow avant green                      : intial constraint 
c1 in [blue,green,yellow]               : seen 
[avant(c1,c3)]
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
green avant red                         : intial constraint 
[avant(c2,c3)]
[dans(c2,[blue,red,yellow])]
[dans(c3,[green,red])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8] : 

v2 in [3,4,5,6,7,8]                     : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

c3 in [green,red]                       : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,yellow]               : known domain 
     => c1 in [blue,green]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green])]=> c1 is blue

blue avant green                        : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue])]=> c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

3 < v1                                  : answer of the system 
v1 in [2,3,4,5,6,7]                     : known domain 
     => v1 in [4,5,6,7]

[dans(v1,[4,5,6,7])]=> v1 max 7

v2 < 8                                  : answer of the system 
v2 in [3,4,5,6,7,8]                     : known domain 
     => v2 in [3,4,5,6,7]

[dans(v2,[3,4,5,6,7])]=> v2 max 7

[max(v1,7)]
[max(v2,7)]=> if v0 < 6 then v0 + v1 + v2 < 20

20 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0<6,v0+(v1+v2)<20)]=> v0 in [6,7,8]

yellow avant blue                       : intial constraint 
c1 is blue                              : seen 
c2 \= blue                              : answer of the system 
     => c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

v0 in [6,7,8]                           : seen 
     => v0 max 8

v2 max 7                                : seen 
[max(v0,8)]=> if v1 < 5 then v0 + v1 + v2 < 20

20 = v0 + v1 + v2                       : seen 
[si_alors(v1<5,v0+(v1+v2)<20)]=> v1 in [5,6,7]

v0 max 8                                : seen 
v1 max 7                                : seen 
     => if v2 < 5 then v0 + v1 + v2 < 20

20 = v0 + v1 + v2                       : seen 
[si_alors(v2<5,v0+(v1+v2)<20)]=> v2 in [5,6,7]

[v2<v1]
[dans(v1,[5,6,7])]
[dans(v2,[5,6,7])]=> v1 in [6,7]
v2 in [5,6]

[v1<v0]
[dans(v0,[6,7,8])]
[dans(v1,[6,7]),dans(v2,[5,6])]=> v0 in [7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [6,7]
v2 in [5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [6,7]
v2 in [5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7] : 

v1 in [6,7]                             : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6] : 

v2 in [5,6]                             : known domain 



************* explanations of the reductions after move 4 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 


