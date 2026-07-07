ident(22,'38green=blue<yellow=red0yellow101red102green93blue9').
joueur(22,alexis).
partie(22,'../parties_joueur/alexis/_partie_22').
somme(22,38).
ordre_couleurs(22,[green,=,blue,<,yellow,=,red]).
solution(22,[c(0,yellow,10),c(1,red,10),c(2,green,9),c(3,blue,9)]).
nb_solutions(22,24).
cartes_jouees(22,
   [
     coup(1,24,4,[c(0,green,9,14.5,non,plus),c(1,blue,9,2.79,non,plus),c(2,yellow,10,2.82,non,moins),c(3,red,10,1.57,non,moins)]),
     coup(2,4,1,[c(0,yellow,10,8.26,oui,oui),c(1,red,10,2.15,oui,oui),c(2,green,9,3.93,oui,oui),c(3,blue,9,2.38,oui,oui)])
   ]
            ).
resultat(22,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

v2 < 10                                 : answer of the system 
v2 in [8,9,10]                          : known domain 
     => v2 in [8,9]

v0 > 9                                  : answer of the system 
[dans(v2,[8,9])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : seen 
blue avant red                          : intial constraint 
c2 avant c0                             : connu_simplification_equivalence 
c0 in [blue,red,yellow]                 : seen 
red meme_rang yellow                    : intial constraint 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c0 \= c2                                : intial constraint 
blue meme_rang green                    : intial constraint 
[avant(c2,c0)]
[dans(c0,[blue,red,yellow])]
[dans(c2,[blue,green])]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

v0 is 10                                : seen 
v1 is 10                                : seen 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
green avant red                         : intial constraint 
green avant yellow                      : intial constraint 
c0 in [red,yellow]                      : seen 
[dans(c1,[green,red,yellow])]
[meme_rang(c0,c1)]=> c1 in [red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 in [blue,green]                      : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

v2 is 9                                 : seen 
     => v2 max 9

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,9)]=> if v3 < 9 then v0 + v1 + v2 + v3 < 38

38 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<9,v0+(v1+(v2+v3))<38)]=> v3 is 9

v2 is 9                                 : seen 
[dans(v3,[9])]=> v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
blue avant yellow                       : intial constraint 
green avant yellow                      : seen 
c2 in [blue,green]                      : seen 
[dans(c3,[blue,green,yellow])]
[meme_rang(c2,c3)]=> c3 in [blue,green]


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : known domain 



