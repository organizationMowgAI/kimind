ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,mathilde).
partie(15,'../parties_joueur/mathilde/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,8,[c(0,yellow,6,12.15,non,plus),c(1,green,9,4.57,non,plus),c(2,red,10,3.72,non,moins),c(3,blue,10,8.63,non,moins)]),
     coup(2,8,1,[c(0,blue,10,15.26,non,oui),c(1,red,10,3.2,non,oui),c(2,green,9,9.15,oui,moins),c(3,yellow,6,2.69,oui,plus)]),
     coup(3,1,1,[c(0,red,10,9.38,oui,oui),c(1,blue,10,3.28,oui,oui),c(2,green,8,7.4,oui,oui),c(3,yellow,7,6.89,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9,10] : 

6 < v0                                  : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

v2 < 10                                 : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [5,6,7,8,9]

v1 > 9                                  : answer of the system 
[dans(v2,[5,6,7,8,9])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c1 in [blue,red,yellow]                 : seen 
blue meme_rang red                      : intial constraint 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
yellow avant green                      : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,red,yellow])]
[dans(c2,[green,yellow])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7,8,9] : 

v2 in [6,7,8,9]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

v1 is 10                                : seen 
v3 in [5,6,7,8,9]                       : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 in [blue,red]                        : seen 
blue meme_rang red                      : seen 
[avant(c3,c1)]
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

v3 in [6,7,8,9]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red]                  : known domain 
     => c0 in [green,red]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

yellow avant green                      : intial constraint 
c2 is green                             : seen 
c3 is yellow                            : answer of the system 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 < 9                                  : answer of the system 
v2 in [6,7,8,9]                         : known domain 
     => v2 in [6,7,8]

6 < v3                                  : answer of the system 
v3 in [6,7,8,9]                         : known domain 
     => v3 in [7,8,9]

[v3<v2]
[dans(v2,[6,7,8])]
[dans(v3,[7,8,9])]=> v2 is 8
v3 is 7


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [6,7,8]                           : seen 
v3 in [7,8,9]                           : seen 
     => v2 is 8
v3 is 7



********** no reduction after move 3 **********

