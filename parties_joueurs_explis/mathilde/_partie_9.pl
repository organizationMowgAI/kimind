ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,mathilde).
partie(9,'../parties_joueur/mathilde/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,3,[c(0,yellow,3,4.87,non,plus),c(1,blue,8,17.43,oui,moins),c(2,green,9,4.47,non,moins),c(3,red,10,8.66,oui,oui)]),
     coup(2,3,1,[c(0,green,9,3.48,oui,moins),c(1,blue,7,44.52,oui,oui),c(2,yellow,4,8.87,oui,plus)]),
     coup(3,1,1,[c(0,green,8,3.47,oui,oui),c(2,yellow,5,7.99,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow

yellow avant blue                       : intial constraint 
c1 is blue                              : seen 
[dans(c2,[yellow])]=> c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

green avant red                         : intial constraint 
c0 is green                             : seen 
c3 is red                               : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

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

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<30)]=> v0 in [5,6,7,8,9,10]

v3 is 10                                : seen 
[v0<v3]
[dans(v0,[5,6,7,8,9,10])]=> v0 in [5,6,7,8,9]

[dans(v0,[5,6,7,8,9])]=> v0 max 9

v2 max 8                                : seen 
v3 max 10                               : seen 
[max(v0,9)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<3,v0+(v1+(v2+v3))<30)]=> v1 in [3,4,5,6,7]

v0 max 9                                : seen 
v1 max 7                                : seen 
v3 max 10                               : seen 
     => if v2 < 4 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<30)]=> v2 in [4,5,6,7,8]

[v2<v1]
[dans(v1,[3,4,5,6,7])]
[dans(v2,[4,5,6,7,8])]=> v1 in [5,6,7]
v2 in [4,5,6]

[dans(v1,[5,6,7]),dans(v2,[4,5,6])]=> v1 max 7

v2 < v1                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7]                       : seen 
v2 in [4,5,6,7,8]                       : seen 
     => v1 in [5,6,7]
v2 in [4,5,6]

[dans(v1,[5,6,7]),dans(v2,[4,5,6])]=> v2 max 6

v3 max 10                               : seen 
[max(v1,7)]
[max(v2,6)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<30)]=> v0 in [7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7]                       : seen 
v2 in [4,5,6,7,8]                       : seen 
     => v1 in [5,6,7]
v2 in [4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6] : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [3,4,5,6,7]                       : seen 
v2 in [4,5,6,7,8]                       : seen 
     => v1 in [5,6,7]
v2 in [4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 < 9                                  : answer of the system 
v0 in [7,8,9]                           : known domain 
     => v0 in [7,8]

v1 < v0                                 : intial constraint 
v1 is 7                                 : answer of the system 
[dans(v0,[7,8])]=> v0 is 8


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

v0 is 8                                 : seen 
     => v0 min 8

v1 is 7                                 : seen 
     => v1 min 7

[min(v0,8)]
[min(v1,7)]=> if v2 > 5 then v0 + v1 + v2 < 20

20 = v0 + v1 + v2                       : intial constraint 
[si_alors(v2>5,v0+(v1+v2)<20)]=> v2 is 5



********** no reduction after move 3 **********

