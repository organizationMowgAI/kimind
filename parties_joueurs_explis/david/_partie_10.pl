ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,david).
partie(10,'../parties_joueur/david/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,1,[c(0,yellow,4,5.31,non,moins),c(1,green,1,60.43,non,plus),c(2,blue,2,6.95,oui,oui),c(3,red,3,5.18,non,moins)]),
     coup(2,1,1,[c(0,red,3,59.42,oui,oui),c(1,yellow,4,4.93,oui,oui),c(3,green,1,6.6,oui,oui)])
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

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [1,2,3]

[dans(v0,[1,2,3])]=> v0 max 3

v2 is 2                                 : answer of the system 
     => v2 max 2

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2]

[dans(v3,[1,2])]=> v3 max 2

[max(v0,3)]
[max(v2,2)]
[max(v3,2)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<3,v0+(v1+(v2+v3))<10)]=> v1 in [3,4,5,6]

v3 in [1,2]                             : seen 
[dans(v1,[3,4,5,6])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]

c1 \= c3                                : intial constraint 
red avant yellow                        : intial constraint 
[avant(c3,c1)]
[dans(c1,[red,yellow])]
[dans(c3,[green,yellow])]=> c3 is green

c0 \= c3                                : intial constraint 
[dans(c0,[green,red])]
[dans(c3,[green])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

blue avant red                          : intial constraint 
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

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
c1 in [red,yellow]                      : seen 
     => c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v0 is 3                                 : seen 
     => v0 min 3

v2 is 2                                 : seen 
     => v2 min 2

v3 in [1,2]                             : seen 
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

v1 is 4                                 : connu_somme_trop_grande 
     => v1 min 4

v0 min 3                                : connu_min 
v2 min 2                                : connu_min 
[min(v1,4)]=> if v3 > 1 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>1,v0+(v1+(v2+v3))<10)]=> v3 is 1



********** no reduction after move 2 **********

