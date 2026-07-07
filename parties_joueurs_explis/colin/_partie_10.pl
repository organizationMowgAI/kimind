ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,colin).
partie(10,'../parties_joueur/colin/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,5,[c(0,blue,1,15.34,non,plus),c(1,green,1,17.5,non,plus),c(2,yellow,4,4.11,non,moins),c(3,red,3,2.06,non,moins)]),
     coup(2,5,1,[c(0,yellow,4,13.59,non,moins),c(1,blue,2,3.45,non,plus),c(2,red,3,4.6,non,moins),c(3,green,1,2.79,oui,oui)]),
     coup(3,1,1,[c(0,red,3,15.74,oui,oui),c(1,yellow,4,4.85,oui,oui),c(2,blue,2,3.57,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6] : 

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [2,3,4,5,6,7]

[dans(v1,[2,3,4,5,6,7])]=> v1 min 2

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 min 1

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2]

[dans(v3,[1,2])]=> v3 min 1

[min(v1,2)]
[min(v2,1)]
[min(v3,1)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<10)]=> v0 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5,6] : 

v0 in [2,3,4,5,6]                       : connu_somme_trop_grande 
     => v0 min 2

v2 min 1                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,2)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>6,v0+(v1+(v2+v3))<10)]=> v1 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3] : 

v2 in [1,2,3]                           : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2] : 

v3 in [1,2]                             : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [green,red,yellow]                : known domain 
     => c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red]                  : known domain 
     => c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green])]=> c2 is blue

blue avant red                          : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 < 4                                  : answer of the system 
v0 in [2,3,4,5,6]                       : known domain 
     => v0 in [2,3]

green avant blue                        : intial constraint 
c2 is blue                              : seen 
c3 is green                             : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 < 3                                  : answer of the system 
v2 in [1,2,3]                           : known domain 
     => v2 in [1,2]

v3 is 1                                 : answer of the system 
[v3<v2]
[dans(v2,[1,2])]=> v2 is 2

[v2<v0]
[dans(v0,[2,3])]
[dans(v2,[2])]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,red,yellow]                 : known domain 
     => c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[red,yellow])]=> c1 is yellow


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

10 = v0 + v1 + v2 + v3                  : intial constraint 
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



********** no reduction after move 3 **********

