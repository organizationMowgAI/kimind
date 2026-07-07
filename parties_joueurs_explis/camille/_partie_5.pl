ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,camille).
partie(5,'../parties_joueur/camille/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,1,[c(0,yellow,5,5.46,non,moins),c(1,blue,1,31.66,non,plus),c(2,green,2,3.41,non,oui),c(3,red,2,4.72,non,moins)]),
     coup(2,1,1,[c(0,green,2,5.5,oui,oui),c(1,yellow,5,16.26,oui,oui),c(2,red,2,11.95,oui,oui),c(3,blue,1,10.68,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

v2 is 2                                 : answer of the system 
v3 < 2                                  : answer of the system 
     => v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

v0 < 5                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [1,2,3,4]

[dans(v0,[1,2,3,4])]=> v0 max 4

v2 is 2                                 : seen 
     => v2 max 2

v3 is 1                                 : seen 
     => v3 max 1

[max(v0,4)]
[max(v2,2)]
[max(v3,1)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<3,v0+(v1+(v2+v3))<10)]=> v1 in [3,4,5,6]

v2 is 2                                 : seen 
[dans(v1,[3,4,5,6])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
green avant yellow                      : intial constraint 
red avant yellow                        : intial constraint 
[avant(c2,c1)]
[dans(c1,[green,red,yellow])]
[dans(c2,[blue,red,yellow])]=> c2 in [blue,red]

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [2,3,4,5,6,7]

v3 is 1                                 : seen 
[dans(v1,[2,3,4,5,6,7])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
green avant yellow                      : seen 
red avant yellow                        : seen 
c1 in [green,red,yellow]                : seen 
[avant(c3,c1)]
[dans(c3,[blue,green,yellow])]=> c3 in [blue,green]

c2 \= c3                                : intial constraint 
blue avant green                        : intial constraint 
green meme_rang red                     : intial constraint 
[avant(c3,c2)]
[dans(c2,[blue,red])]
[dans(c3,[blue,green])]=> c3 is blue

c0 \= c3                                : intial constraint 
[dans(c0,[blue,green,red])]
[dans(c3,[blue])]=> c0 in [green,red]

c2 \= c3                                : seen 
c3 avant c2                             : connu_simplification_equivalence 
c2 in [blue,red]                        : seen 
c3 is blue                              : seen 
     => c2 is red

c0 \= c2                                : intial constraint 
[dans(c0,[green,red])]
[dans(c2,[red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

c0 is green                             : seen 
c2 is red                               : seen 
green meme_rang red                     : seen 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 in [1,2,3,4]                         : seen 
v2 is 2                                 : seen 
[v0=v2]=> v0 is 2


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
c1 in [green,red,yellow]                : seen 
     => c1 in [red,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
c2 is red                               : seen 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

v2 max 2                                : seen 
v3 max 1                                : seen 
[max(v0,2)]=> if v1 < 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<5,v0+(v1+(v2+v3))<10)]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

