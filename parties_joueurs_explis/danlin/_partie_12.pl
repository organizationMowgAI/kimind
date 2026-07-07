ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,danlin).
partie(12,'../parties_joueur/danlin/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,1,[c(0,red,7,17.93,non,moins),c(1,green,9,28.52,oui,plus),c(2,yellow,2,3.46,oui,plus),c(3,blue,2,4.14,non,plus)]),
     coup(2,1,1,[c(0,blue,3,2.84,oui,oui),c(1,green,10,79.06,oui,oui),c(2,yellow,3,5.73,oui,oui),c(3,red,4,6.35,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[red,yellow])]=> c3 is red

blue avant red                          : intial constraint 
c0 is blue                              : seen 
[dans(c3,[red])]=> c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

c0 is blue                              : seen 
c2 is yellow                            : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v1 > 9                                  : answer of the system 
     => v1 min 10

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [3,4,5,6,7,8,9,10]

[dans(v2,[3,4,5,6,7,8,9,10])]=> v2 min 3

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 min 3

[min(v1,10)]
[min(v2,3)]
[min(v3,3)]=> if v0 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>4,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4]

v0 in [1,2,3,4]                         : connu_somme_trop_grande 
     => v0 min 1

v1 min 10                               : connu_min 
v3 min 3                                : connu_min 
[min(v0,1)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6]

[v0=v2]
[dans(v0,[1,2,3,4])]
[dans(v2,[3,4,5,6])]=> v0 in [3,4]
v2 in [3,4]

v0 = v2                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : connu_somme_trop_grande 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
     => v0 in [3,4]
v2 in [3,4]

[dans(v0,[3,4]),dans(v2,[3,4])]=> v0 min 3

v1 min 10                               : connu_min 
v2 min 3                                : connu_min 
[min(v0,3)]=> if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [3,4]

[v0<v3]
[dans(v0,[3,4]),dans(v2,[3,4])]
[dans(v3,[3,4])]=> v0 is 3
v3 is 4


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : connu_somme_trop_grande 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
     => v0 in [3,4]
v2 in [3,4]

v0 < v3                                 : connu_simplification_equivalence 
v3 in [3,4]                             : connu_somme_trop_grande 
[dans(v0,[3,4]),dans(v2,[3,4])]=> v0 is 3
v3 is 4

v0 = v2                                 : connu_simplification_equivalence 
[dans(v0,[3]),dans(v3,[4])]=> v2 is 3


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : connu_somme_trop_grande 
v2 in [3,4,5,6]                         : connu_somme_trop_grande 
     => v0 in [3,4]
v2 in [3,4]

v0 < v3                                 : connu_simplification_equivalence 
v3 in [3,4]                             : connu_somme_trop_grande 
[dans(v0,[3,4]),dans(v2,[3,4])]=> v0 is 3
v3 is 4



********** no reduction after move 2 **********

