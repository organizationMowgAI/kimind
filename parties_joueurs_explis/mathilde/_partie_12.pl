ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,mathilde).
partie(12,'../parties_joueur/mathilde/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,7,[c(0,blue,1,2.79,oui,plus),c(1,yellow,1,3.24,non,plus),c(2,red,8,4.86,non,moins),c(3,green,10,14.24,non,moins)]),
     coup(2,7,1,[c(0,blue,2,31.32,oui,plus),c(1,green,10,19.72,oui,oui),c(2,yellow,2,26.3,oui,plus),c(3,red,6,3.97,oui,moins)]),
     coup(3,1,1,[c(0,blue,3,10.35,oui,oui),c(2,yellow,3,2.38,oui,oui),c(3,red,4,6.9,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6,7,8,9] : 

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

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [2,3,4,5,6,7,8,9,10]

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [2,3,4,5,6,7,8,9,10]

[v0<v1]
[dans(v0,[2,3,4,5,6,7,8,9,10])]
[dans(v1,[2,3,4,5,6,7,8,9,10])]=> v0 in [2,3,4,5,6,7,8,9]
v1 in [3,4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

c1 in [green,red]                       : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7,8,9,10] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v1 in [2,3,4,5,6,7,8,9,10]              : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v1 in [3,4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6,7] : 

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7,8,9] : 

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v1 is 10                                : answer of the system 
     => v1 min 10

yellow avant red                        : intial constraint 
c2 is yellow                            : answer of the system 
c3 is red                               : answer of the system 
     => c2 avant c3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[avant(c2,c3)]=> v2 < v3

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [3,4,5,6,7]

[dans(v2,[3,4,5,6,7])]=> v2 min 3

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9]               : known domain 
     => v3 in [1,2,3,4,5]

[dans(v3,[1,2,3,4,5])]=> v3 min 1

v1 min 10                               : connu_min 
[min(v2,3)]
[min(v3,1)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>6,v0+(v1+(v2+v3))<20)]=> v0 in [3,4,5,6]

[dans(v0,[3,4,5,6])]=> v0 min 3

v1 min 10                               : connu_min 
v3 min 1                                : connu_min 
[min(v0,3)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6]

v0 min 3                                : connu_min 
v1 min 10                               : connu_min 
v2 min 3                                : connu_min 
     => if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4]

[v2<v3]
[dans(v2,[3,4,5,6])]
[dans(v3,[1,2,3,4])]=> v2 is 3
v3 is 4

[dans(v2,[3]),dans(v3,[4])]=> v2 min 3

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
v3 in [1,2,3,4]                         : connu_somme_trop_grande 
     => v2 is 3
v3 is 4

[dans(v2,[3]),dans(v3,[4])]=> v3 min 4

[min(v1,10)]
[min(v2,3)]
[min(v3,4)]=> if v0 > 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>3,v0+(v1+(v2+v3))<20)]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
v3 in [1,2,3,4]                         : connu_somme_trop_grande 
     => v2 is 3
v3 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
v3 in [1,2,3,4]                         : connu_somme_trop_grande 
     => v2 is 3
v3 is 4



********** no reduction after move 3 **********

