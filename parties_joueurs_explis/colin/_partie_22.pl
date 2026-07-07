ident(22,'38green=blue<yellow=red0yellow101red102green93blue9').
joueur(22,colin).
partie(22,'../parties_joueur/colin/_partie_22').
somme(22,38).
ordre_couleurs(22,[green,=,blue,<,yellow,=,red]).
solution(22,[c(0,yellow,10),c(1,red,10),c(2,green,9),c(3,blue,9)]).
nb_solutions(22,24).
cartes_jouees(22,
   [
     coup(1,24,1,[c(0,blue,9,13.8,non,plus),c(1,yellow,10,2.12,non,oui),c(2,red,10,4.59,non,moins),c(3,green,9,2.59,non,oui)]),
     coup(2,1,1,[c(0,yellow,10,7.04,oui,oui),c(1,red,10,1.89,oui,oui),c(2,green,9,4.51,oui,oui),c(3,blue,9,1.41,oui,oui)])
   ]
            ).
resultat(22,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

v2 < 10                                 : answer of the system 
v2 in [8,9,10]                          : known domain 
     => v2 in [8,9]

v0 > 9                                  : answer of the system 
[dans(v2,[8,9])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

v0 is 10                                : seen 
v1 is 10                                : seen 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
blue avant red                          : intial constraint 
green avant red                         : intial constraint 
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,green,red])]
[meme_rang(c0,c1)]=> c0 in [green,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

v2 is 9                                 : seen 
v3 is 9                                 : seen 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
blue avant red                          : seen 
blue avant yellow                       : intial constraint 
[dans(c2,[blue,green,yellow])]
[dans(c3,[blue,red,yellow])]
[meme_rang(c2,c3)]=> c2 in [green,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
green avant yellow                      : intial constraint 
c0 in [green,yellow]                    : seen 
[dans(c2,[green,yellow])]=> c2 is green

c0 \= c2                                : intial constraint 
[avant(c2,c0)]
[dans(c0,[green,yellow])]
[dans(c2,[green])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c0 \= c1                                : seen 
green avant yellow                      : seen 
c0 in [green,yellow]                    : seen 
c1 in [blue,green,red]                  : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
     => c1 in [blue,red]

c2 \= c3                                : seen 
green avant yellow                      : seen 
c2 in [green,yellow]                    : seen 
c3 in [blue,red,yellow]                 : seen 
c2 meme_rang c3                         : connu_simplification_equivalence 
     => c3 in [blue,red]

c2 \= c3                                : seen 
green avant red                         : seen 
c2 is green                             : seen 
c2 meme_rang c3                         : connu_simplification_equivalence 
[dans(c3,[blue,red])]=> c3 is blue

c1 \= c3                                : intial constraint 
[dans(c1,[blue,red])]
[dans(c3,[blue])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



********** no reduction after move 2 **********

