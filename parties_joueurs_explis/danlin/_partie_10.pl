ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,danlin).
partie(10,'../parties_joueur/danlin/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,1,[c(0,blue,1,2.22,non,plus),c(1,yellow,5,20.44,oui,moins),c(2,red,4,3.85,non,moins),c(3,green,1,12.46,oui,oui)]),
     coup(2,1,1,[c(0,red,3,9.02,oui,oui),c(1,yellow,4,19.76,oui,oui),c(2,blue,2,3.61,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green])]=> c2 is blue

blue avant red                          : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

red avant yellow                        : intial constraint 
c0 is red                               : seen 
c1 is yellow                            : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [2,3,4,5,6,7]

v1 < 5                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [1,2,3,4]

[v0<v1]
[dans(v0,[2,3,4,5,6,7])]
[dans(v1,[1,2,3,4])]=> v0 in [2,3]
v1 in [3,4]

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7]                     : seen 
v1 in [1,2,3,4]                         : seen 
     => v0 in [2,3]
v1 in [3,4]

[dans(v0,[2,3]),dans(v1,[3,4])]=> v0 max 3

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7]                     : seen 
v1 in [1,2,3,4]                         : seen 
     => v0 in [2,3]
v1 in [3,4]

[dans(v0,[2,3]),dans(v1,[3,4])]=> v1 max 4

v3 is 1                                 : answer of the system 
     => v3 max 1

[max(v0,3)]
[max(v1,4)]
[max(v3,1)]=> if v2 < 2 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<2,v0+(v1+(v2+v3))<10)]=> v2 in [2,3]

[v2<v0]
[dans(v0,[2,3]),dans(v1,[3,4])]
[dans(v2,[2,3])]=> v0 is 3
v2 is 2


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7]                     : seen 
v1 in [1,2,3,4]                         : seen 
     => v0 in [2,3]
v1 in [3,4]

v2 < v0                                 : connu_simplification_equivalence 
v2 in [2,3]                             : seen 
[dans(v0,[2,3]),dans(v1,[3,4])]=> v0 is 3
v2 is 2

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7]                     : seen 
v1 in [1,2,3,4]                         : seen 
     => v0 in [2,3]
v1 in [3,4]

v0 < v1                                 : connu_simplification_equivalence 
[dans(v0,[3]),dans(v2,[2])]
[dans(v0,[2,3]),dans(v1,[3,4])]=> v1 is 4


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7]                     : seen 
v1 in [1,2,3,4]                         : seen 
     => v0 in [2,3]
v1 in [3,4]

v2 < v0                                 : connu_simplification_equivalence 
v2 in [2,3]                             : seen 
[dans(v0,[2,3]),dans(v1,[3,4])]=> v0 is 3
v2 is 2


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

