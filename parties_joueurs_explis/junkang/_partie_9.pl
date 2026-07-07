ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,junkang).
partie(9,'../parties_joueur/junkang/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,20,[c(0,yellow,6,5.66,non,plus),c(1,red,9,52.32,non,moins),c(2,green,8,5.73,non,moins),c(3,blue,7,2.81,non,plus)]),
     coup(2,20,1,[c(0,green,8,2.65,oui,oui),c(1,yellow,6,38.88,non,plus),c(2,blue,7,5.09,non,moins),c(3,red,9,4.87,oui,plus)]),
     coup(3,1,1,[c(1,blue,7,27.47,oui,oui),c(2,yellow,5,6.2,oui,oui),c(3,red,10,7.03,oui,oui)])
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

the value (v0) of the card in position 0 is in [7,8,9,10] : 

6 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7,8] : 

v0 in [7,8,9,10]                        : seen 
     => v0 max 10

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]

[dans(v2,[1,2,3,4,5,6,7])]=> v2 max 7

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 max 10

[max(v0,10)]
[max(v2,7)]
[max(v3,10)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<3,v0+(v1+(v2+v3))<30)]=> v1 in [3,4,5,6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

v2 in [1,2,3,4,5,6,7]                   : seen 
v3 in [8,9,10]                          : seen 
     => v2 < v3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[v2<v3]=> c2 avant c3

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c2 \= c3                                : intial constraint 
green avant red                         : intial constraint 
yellow avant red                        : intial constraint 
[avant(c2,c3)]
[dans(c2,[blue,red,yellow])]
[dans(c3,[green,red,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5,6,7] : 

v2 in [2,3,4,5,6,7]                     : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

c2 \= c3                                : seen 
c2 avant c3                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c2 in [blue,yellow]                     : seen 
c3 in [green,red,yellow]                : seen 
     => c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v3 in [8,9,10]                          : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,yellow]               : known domain 
     => c1 in [blue,green]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

blue avant green                        : intial constraint 
c0 is green                             : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

6 < v1                                  : answer of the system 
v1 in [3,4,5,6,7,8]                     : known domain 
     => v1 in [7,8]

v0 is 8                                 : seen 
[v1<v0]
[dans(v1,[7,8])]=> v1 is 7


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 is 8                                 : seen 
     => v0 max 8

v1 is 7                                 : seen 
     => v1 max 7

v3 > 9                                  : answer of the system 
     => v3 max 10

[max(v0,8)]
[max(v1,7)]
[max(v3,10)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<30)]=> v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 3 **********

