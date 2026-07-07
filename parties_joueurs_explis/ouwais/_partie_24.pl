ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,ouwais).
partie(24,'../parties_joueur/ouwais/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,4,[c(0,red,5,2.45,non,plus),c(1,blue,4,147.03,non,plus),c(2,yellow,5,8.33,non,oui),c(3,green,6,12.63,non,moins)]),
     coup(2,4,4,[c(0,green,5,2.36,oui,plus),c(1,blue,2,10.62,non,plus),c(2,yellow,5,13.48,non,oui),c(3,red,5,21.73,non,moins)]),
     coup(3,4,1,[c(0,green,7,3.58,oui,oui),c(1,yellow,5,14.73,oui,oui),c(2,red,5,12.14,oui,oui),c(3,blue,3,6.44,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

5 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [6,7,8,9,10]

v2 is 5                                 : answer of the system 
[dans(v0,[6,7,8,9,10])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : seen 
blue avant green                        : intial constraint 
c2 avant c0                             : connu_simplification_equivalence 
yellow avant green                      : intial constraint 
c0 in [blue,green,yellow]               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c0 \= c2                                : seen 
blue avant red                          : intial constraint 
c2 avant c0                             : connu_simplification_equivalence 
[dans(c0,[blue,green,yellow])]
[dans(c2,[blue,red])]=> c0 in [green,yellow]

v0 in [6,7,8,9]                         : connu_somme_trop_grande 
     => v0 min 6

v1 min 5                                : connu_min 
v2 min 5                                : connu_min 
[min(v0,6)]=> if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4]

v2 is 5                                 : seen 
[dans(v3,[1,2,3,4])]=> v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : seen 
blue avant yellow                       : intial constraint 
c3 avant c2                             : connu_simplification_equivalence 
c2 in [blue,red]                        : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : seen 
blue avant red                          : seen 
c3 avant c2                             : connu_simplification_equivalence 
c2 in [blue,red]                        : seen 
[dans(c3,[blue,red])]=> c3 is blue

c2 \= c3                                : intial constraint 
c2 in [blue,red]                        : seen 
[avant(c3,c2)]
[dans(c3,[blue])]=> c2 is red

c0 \= c2                                : intial constraint 
red meme_rang yellow                    : seen 
[avant(c2,c0)]
[dans(c0,[green,yellow])]
[dans(c2,[red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

v0 in [6,7,8,9]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[green,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

c1 is yellow                            : seen 
c2 is red                               : seen 
red meme_rang yellow                    : seen 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v0 min 6                                : connu_min 
v2 min 5                                : connu_min 
v3 min 1                                : connu_min 
     => if v1 > 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>8,v0+(v1+(v2+v3))<20)]=> v1 in [5,6,7,8]

v2 is 5                                 : seen 
[v1=v2]
[dans(v1,[5,6,7,8])]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : connu_somme_trop_grande 



********** no reduction after move 2 **********

************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


