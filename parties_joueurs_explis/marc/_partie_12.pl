ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,marc).
partie(12,'../parties_joueur/marc/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,4,[c(0,blue,2,9.36,oui,plus),c(1,yellow,2,4.09,non,plus),c(2,red,7,6.94,non,moins),c(3,green,9,4.96,non,moins)]),
     coup(2,4,2,[c(0,blue,3,9.45,oui,oui),c(1,green,8,3.29,oui,plus),c(2,yellow,3,26.56,oui,oui),c(3,red,6,8.32,oui,moins)]),
     coup(3,2,1,[c(1,green,9,1.72,oui,plus),c(3,red,5,34.36,oui,moins)]),
     coup(4,1,1,[c(1,green,10,1.08,oui,oui),c(3,red,4,3.37,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7,8,9] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c0 is blue                              : seen 
[dans(c1,[green,red])]=> c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [3,4,5,6,7,8,9,10]

[v0<v1]
[dans(v0,[3,4,5,6,7,8,9,10])]
[dans(v1,[3,4,5,6,7,8,9,10])]=> v0 in [3,4,5,6,7,8,9]
v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

c1 in [green,red]                       : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [3,4,5,6,7,8,9,10]                : seen 
v1 in [3,4,5,6,7,8,9,10]                : seen 
     => v0 in [3,4,5,6,7,8,9]
v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6] : 

v2 < 7                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7,8] : 

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v2 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5] : 

v0 is 3                                 : seen 
     => v0 max 3

v1 in [9,10]                            : seen 
     => v1 max 10

v2 is 3                                 : seen 
     => v2 max 3

[max(v0,3)]
[max(v1,10)]
[max(v2,3)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<4,v0+(v1+(v2+v3))<20)]=> v3 in [4,5]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 < 5                                  : answer of the system 



********** no reduction after move 4 **********

