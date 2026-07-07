ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,ouwais).
partie(19,'../parties_joueur/ouwais/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,3,[c(0,red,9,11.61,non,plus),c(1,yellow,10,1.87,non,moins),c(2,green,10,1.83,non,oui),c(3,blue,10,1.49,non,oui)]),
     coup(2,3,1,[c(0,yellow,10,2.42,non,oui),c(1,red,9,2.28,oui,oui),c(2,blue,10,3.07,non,oui),c(3,green,10,8.96,oui,oui)]),
     coup(3,1,1,[c(0,yellow,10,1.11,non,oui),c(2,blue,10,5.7,non,oui)]),
     coup(4,1,1,[c(0,blue,10,6.08,oui,oui),c(2,yellow,10,1.21,oui,oui)])
   ]
            ).
resultat(19,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

v0 is 10                                : seen 
v1 < 10                                 : answer of the system 
     => v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
c0 in [blue,green,yellow]               : seen 
blue meme_rang green                    : intial constraint 
blue meme_rang yellow                   : intial constraint 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c0 \= c1                                : intial constraint 
c0 in [blue,green,yellow]               : seen 
blue meme_rang green                    : seen 
green meme_rang yellow                  : intial constraint 
[avant(c1,c0)]
[dans(c1,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

v0 is 10                                : seen 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
red avant blue                          : intial constraint 
red avant green                         : intial constraint 
red avant yellow                        : intial constraint 
c0 in [blue,green,yellow]               : seen 
[dans(c2,[blue,red,yellow])]
[meme_rang(c0,c2)]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

v0 is 10                                : seen 
v3 is 10                                : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
red avant blue                          : seen 
red avant green                         : seen 
red avant yellow                        : seen 
c0 in [blue,green,yellow]               : seen 
[dans(c3,[green,red,yellow])]
[meme_rang(c0,c3)]=> c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,yellow]               : known domain 
     => c0 in [blue,green]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
c0 meme_rang c3                         : intial constraint 
[dans(c0,[blue,green])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

********** no reduction after move 4 **********

