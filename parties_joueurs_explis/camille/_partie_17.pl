ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,camille).
partie(17,'../parties_joueur/camille/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,2,[c(0,red,7,72.2,non,plus),c(1,green,9,3.74,non,plus),c(2,yellow,8,7.12,non,moins),c(3,blue,9,3.1,non,moins)]),
     coup(2,2,1,[c(0,green,10,36.38,oui,oui),c(1,blue,10,13.86,oui,oui),c(2,red,6,36.5,oui,moins),c(3,yellow,7,4.79,oui,plus)]),
     coup(3,1,1,[c(2,red,5,10.72,oui,oui),c(3,yellow,8,5.03,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

v3 < 9                                  : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [3,4,5,6,7,8]

v1 > 9                                  : answer of the system 
[dans(v3,[3,4,5,6,7,8])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

v2 < 8                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5,6,7]

v0 in [8,9,10]                          : seen 
[dans(v2,[3,4,5,6,7])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
yellow avant green                      : seen 
c0 in [blue,green,yellow]               : seen 
blue meme_rang green                    : intial constraint 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
c0 in [blue,green,yellow]               : seen 
blue meme_rang green                    : seen 
[avant(c2,c0)]
[dans(c2,[blue,red])]=> c2 is red

c1 \= c2                                : intial constraint 
[dans(c1,[blue,red,yellow])]
[dans(c2,[red])]=> c1 in [blue,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c1 \= c3                                : intial constraint 
yellow avant green                      : intial constraint 
blue meme_rang green                    : seen 
[avant(c3,c1)]
[dans(c1,[blue,yellow])]
[dans(c3,[green,yellow])]=> c3 is yellow

c0 \= c3                                : intial constraint 
[dans(c0,[blue,green,yellow])]
[dans(c3,[yellow])]=> c0 in [blue,green]

c1 \= c3                                : seen 
c3 avant c1                             : connu_simplification_equivalence 
c1 in [blue,yellow]                     : seen 
c3 is yellow                            : seen 
     => c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,green])]
[dans(c1,[blue])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 is green                             : seen 
c1 is blue                              : seen 
blue meme_rang green                    : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 in [8,9,10]                          : seen 
v1 is 10                                : seen 
[v0=v1]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7] : 

v2 in [5,6,7]                           : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8] : 

v3 in [6,7,8]                           : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 < 6                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 > 7                                  : answer of the system 



********** no reduction after move 3 **********

