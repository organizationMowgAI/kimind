ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,ouwais).
partie(6,'../parties_joueur/ouwais/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,24,[c(0,green,7,5.18,non,moins),c(1,blue,7,109.59,non,moins),c(2,red,6,11.83,non,plus),c(3,yellow,1,8.15,non,plus)]),
     coup(2,24,1,[c(0,yellow,3,2.43,oui,moins),c(1,green,4,136.69,non,moins),c(2,blue,8,25.27,non,oui),c(3,red,8,2.01,non,oui)]),
     coup(3,1,1,[c(0,yellow,2,1.28,oui,oui),c(1,green,3,14.48,non,oui),c(2,red,8,3.03,non,oui),c(3,blue,8,19.43,oui,oui)]),
     coup(4,1,1,[c(1,red,3,1.03,oui,oui),c(2,green,8,4.55,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

v0 < 7                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6]

6 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [7,8,9,10]

[dans(v0,[1,2,3,4,5,6])]
[dans(v2,[7,8,9,10])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
blue meme_rang green                    : intial constraint 
[avant(c0,c2)]
[dans(c0,[blue,red,yellow])]
[dans(c2,[blue,green,yellow])]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6] : 

v0 in [1,2,3,4,5,6]                     : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [red,yellow] : 

v1 < 7                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6]

v2 in [7,8,9,10]                        : seen 
[dans(v1,[1,2,3,4,5,6])]=> v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
yellow avant red                        : intial constraint 
c0 in [red,yellow]                      : seen 
c2 in [blue,green,yellow]               : seen 
     => c2 in [blue,green]

c1 \= c2                                : intial constraint 
blue meme_rang green                    : seen 
[avant(c1,c2)]
[dans(c1,[green,red,yellow])]
[dans(c2,[blue,green])]=> c1 in [red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6] : 

v1 in [1,2,3,4,5,6]                     : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 in [blue,green]                      : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8,9,10] : 

v2 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6,7,8,9,10] : 

1 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [2,3,4,5,6,7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v1 < 4                                  : answer of the system 
v1 in [1,2,3,4,5,6]                     : known domain 
     => v1 in [1,2,3]

[dans(v1,[1,2,3])]=> v1 max 3

v2 is 8                                 : answer of the system 
     => v2 max 8

v3 is 8                                 : answer of the system 
     => v3 max 8

[max(v1,3)]
[max(v2,8)]
[max(v3,8)]=> if v0 < 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<2,v0+(v1+(v2+v3))<21)]=> v0 is 2


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
c1 in [red,yellow]                      : known domain 
     => c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v0 is 2                                 : seen 
     => v0 max 2

v2 max 8                                : seen 
v3 max 8                                : seen 
[max(v0,2)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<3,v0+(v1+(v2+v3))<21)]=> v1 is 3


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [blue,green]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : seen 



********** no reduction after move 3 **********

********** no reduction after move 4 **********

