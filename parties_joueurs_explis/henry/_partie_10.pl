ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,henry).
partie(10,'../parties_joueur/henry/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,1,[c(0,green,4,53.48,non,moins),c(1,blue,3,9.8,non,plus),c(2,red,2,7.89,non,oui),c(3,yellow,1,4.54,non,oui)]),
     coup(2,1,1,[c(0,red,3,11.75,oui,oui),c(1,yellow,4,19.93,oui,oui),c(2,blue,2,4.06,oui,oui),c(3,green,1,49.29,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [1,2,3]

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [4,5,6,7]

[dans(v0,[1,2,3])]
[dans(v1,[4,5,6,7])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
green avant yellow                      : intial constraint 
red avant yellow                        : intial constraint 
[avant(c0,c1)]
[dans(c0,[blue,red,yellow])]
[dans(c1,[green,red,yellow])]=> c0 in [blue,red]

v2 is 2                                 : seen 
v3 is 1                                 : seen 
     => v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

v1 in [4,5,6,7]                         : seen 
v2 is 2                                 : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
green avant blue                        : intial constraint 
green avant red                         : intial constraint 
c0 in [blue,red]                        : seen 
c1 in [green,red,yellow]                : seen 
     => c1 in [red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
red avant yellow                        : seen 
[avant(c2,c1)]
[dans(c1,[red,yellow])]
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : seen 
c3 avant c2                             : connu_simplification_equivalence 
green avant blue                        : seen 
c2 in [blue,green]                      : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c2 \= c3                                : seen 
blue avant red                          : intial constraint 
c3 avant c2                             : connu_simplification_equivalence 
green avant red                         : seen 
c2 in [blue,green]                      : seen 
[dans(c3,[green,red])]=> c3 is green

c2 \= c3                                : intial constraint 
[avant(c3,c2)]
[dans(c2,[blue,green])]
[dans(c3,[green])]=> c2 is blue

c0 \= c2                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c2,[blue])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

blue avant red                          : seen 
c0 is red                               : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 in [1,2,3]                           : seen 
v2 is 2                                 : seen 
[v2<v0]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 is red                               : seen 
c1 in [red,yellow]                      : seen 
     => c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v0 is 3                                 : seen 
     => v0 min 3

v2 min 2                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,3)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>4,v0+(v1+(v2+v3))<10)]=> v1 is 4


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

