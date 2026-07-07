ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,malik).
partie(12,'../parties_joueur/malik/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,4,[c(0,green,10,262.65,non,moins),c(1,red,6,4.91,non,plus),c(2,yellow,2,3.68,oui,plus),c(3,blue,2,2.05,non,plus)]),
     coup(2,4,1,[c(0,blue,3,116.38,oui,oui),c(1,green,9,24.04,oui,plus),c(2,yellow,3,3.16,oui,oui),c(3,red,5,4.22,oui,moins)]),
     coup(3,1,1,[c(1,green,10,8.3,oui,oui),c(3,red,4,2.16,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,red]

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 min 7

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c2 is yellow                            : seen 
[dans(c3,[green,red])]=> c2 avant c3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[avant(c2,c3)]=> v2 < v3

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [3,4,5,6,7,8,9,10]

[dans(v2,[3,4,5,6,7,8,9,10])]=> v2 min 3

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 min 3

v1 min 7                                : connu_min 
[min(v2,3)]
[min(v3,3)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>7,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4,5,6,7]

[dans(v0,[1,2,3,4,5,6,7])]=> v0 min 1

v1 min 7                                : connu_min 
v3 min 3                                : connu_min 
[min(v0,1)]=> if v2 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>9,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6,7,8,9]

v0 min 1                                : connu_min 
v1 min 7                                : connu_min 
v2 min 3                                : connu_min 
     => if v3 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>9,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6,7,8,9]

[v2<v3]
[dans(v2,[3,4,5,6,7,8,9])]
[dans(v3,[3,4,5,6,7,8,9])]=> v2 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]

[dans(v2,[3,4,5,6,7,8]),dans(v3,[4,5,6,7,8,9])]=> v2 min 3

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v3 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
     => v2 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]

[dans(v2,[3,4,5,6,7,8]),dans(v3,[4,5,6,7,8,9])]=> v3 min 4

[min(v1,7)]
[min(v2,3)]
[min(v3,4)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4,5,6]

v1 in [7,8,9,10]                        : seen 
[dans(v0,[1,2,3,4,5,6])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c0 \= c1                                : intial constraint 
blue avant red                          : intial constraint 
c0 in [blue,red]                        : seen 
[avant(c0,c1)]
[dans(c1,[blue,green])]=> c1 is green

c1 \= c3                                : intial constraint 
c3 in [green,red]                       : seen 
[dans(c1,[green])]=> c3 is red

c0 \= c3                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c3,[red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6] : 

c0 is blue                              : seen 
c2 is yellow                            : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v3 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
     => v2 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]

v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
[v0=v2]
[dans(v2,[3,4,5,6,7,8]),dans(v3,[4,5,6,7,8,9])]=> v0 in [3,4,5,6]
v2 in [3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9,10] : 

v1 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6] : 

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v3 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
     => v2 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]

v0 = v2                                 : connu_simplification_equivalence 
v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
[dans(v2,[3,4,5,6,7,8]),dans(v3,[4,5,6,7,8,9])]=> v0 in [3,4,5,6]
v2 in [3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7] : 

v2 < v3                                 : connu_simplification_equivalence 
v2 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
v3 in [3,4,5,6,7,8,9]                   : connu_somme_trop_grande 
     => v2 in [3,4,5,6,7,8]
v3 in [4,5,6,7,8,9]

v0 = v2                                 : connu_simplification_equivalence 
v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
[dans(v2,[3,4,5,6,7,8]),dans(v3,[4,5,6,7,8,9])]=> v0 in [3,4,5,6]
v2 in [3,4,5,6]

[dans(v0,[3,4,5,6]),dans(v2,[3,4,5,6])]=> v0 min 3

v1 min 7                                : connu_min 
v2 min 3                                : connu_min 
[min(v0,3)]=> if v3 > 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>7,v0+(v1+(v2+v3))<20)]=> v3 in [4,5,6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v2 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 < 5                                  : answer of the system 



********** no reduction after move 3 **********

