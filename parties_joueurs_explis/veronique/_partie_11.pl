ident(11,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(11,veronique).
partie(11,'../parties_joueur/veronique/_partie_11').
somme(11,10).
ordre_couleurs(11,[green,<,blue,<,red,<,yellow]).
solution(11,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(11,24).
cartes_jouees(11,
   [
     coup(1,24,1,[c(0,blue,2,68.86,non,plus),c(1,red,3,9.9,non,plus),c(2,green,1,3.96,non,plus),c(3,yellow,4,3.95,non,moins)]),
     coup(2,1,1,[c(0,red,3,10.04,oui,oui),c(1,yellow,4,17.49,oui,oui),c(2,blue,2,51.74,oui,oui),c(3,green,1,3.26,oui,oui)])
   ]
            ).
resultat(11,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [4,5,6,7]

[dans(v1,[4,5,6,7])]=> v1 min 4

1 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [2,3,4,5,6,7]

[dans(v2,[2,3,4,5,6,7])]=> v2 min 2

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2,3]

[dans(v3,[1,2,3])]=> v3 min 1

[min(v1,4)]
[min(v2,2)]
[min(v3,1)]=> if v0 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>3,v0+(v1+(v2+v3))<10)]=> v0 is 3

v0 is 3                                 : connu_somme_trop_grande 
     => v0 min 3

v1 min 4                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,3)]=> if v2 > 2 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>2,v0+(v1+(v2+v3))<10)]=> v2 is 2

[dans(v0,[3])]
[dans(v2,[2])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

v0 min 3                                : connu_min 
v2 min 2                                : connu_min 
v3 min 1                                : connu_min 
     => if v1 > 4 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>4,v0+(v1+(v2+v3))<10)]=> v1 is 4

v0 is 3                                 : connu_somme_trop_grande 
[dans(v1,[4])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
blue avant yellow                       : intial constraint 
green avant yellow                      : intial constraint 
[avant(c0,c1)]
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,green,yellow])]=> c0 in [green,red]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
green avant red                         : intial constraint 
c0 in [green,red]                       : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
green avant yellow                      : seen 
red avant yellow                        : intial constraint 
c0 in [green,red]                       : seen 
[dans(c2,[blue,yellow])]=> c2 is blue

c0 \= c2                                : intial constraint 
green avant blue                        : intial constraint 
[avant(c2,c0)]
[dans(c0,[green,red])]
[dans(c2,[blue])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
green avant red                         : seen 
c0 in [green,red]                       : seen 
c1 in [blue,green,yellow]               : seen 
     => c1 in [blue,yellow]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v1 is 4                                 : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,red])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v0 min 3                                : connu_min 
v1 min 4                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 1 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>1,v0+(v1+(v2+v3))<10)]=> v3 is 1



********** no reduction after move 2 **********

