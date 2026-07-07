ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,malik).
partie(10,'../parties_joueur/malik/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,1,[c(0,yellow,4,68.96,non,moins),c(1,blue,2,3.19,non,plus),c(2,red,3,4.4,non,moins),c(3,green,1,2.77,oui,oui)]),
     coup(2,1,1,[c(0,red,3,6.27,oui,oui),c(1,yellow,4,10.32,oui,oui),c(2,blue,2,21.8,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [blue,red]

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [3,4,5,6,7]

v2 < 3                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2]

[dans(v1,[3,4,5,6,7])]
[dans(v2,[1,2])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

c1 \= c2                                : intial constraint 
red avant yellow                        : intial constraint 
[avant(c2,c1)]
[dans(c1,[red,yellow])]
[dans(c2,[blue,yellow])]=> c2 is blue

c0 \= c2                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c2,[blue])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

blue avant red                          : intial constraint 
c0 is red                               : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

c0 in [blue,red]                        : seen 
c3 is green                             : seen 
     => c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v0 in [1,2,3]                           : seen 
v3 is 1                                 : seen 
[v3<v0]=> v0 in [2,3]

c2 in [blue,yellow]                     : seen 
c3 is green                             : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 in [1,2]                             : seen 
v3 is 1                                 : seen 
[v3<v2]=> v2 is 2

[v2<v0]
[dans(v0,[2,3])]
[dans(v2,[2])]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

v0 in [1,2,3]                           : seen 
v1 in [4,5,6,7]                         : seen 
     => v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
c1 in [red,yellow]                      : seen 
[avant(c0,c1)]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v0 is 3                                 : seen 
     => v0 min 3

v2 is 2                                 : seen 
     => v2 min 2

v3 is 1                                 : seen 
     => v3 min 1

[min(v0,3)]
[min(v2,2)]
[min(v3,1)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 10

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

