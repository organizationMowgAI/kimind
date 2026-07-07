ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,danlin).
partie(2,'../parties_joueur/danlin/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,3,[c(0,red,10,9.24,non,oui),c(1,blue,10,3.06,non,moins),c(2,green,10,1.99,non,oui),c(3,yellow,9,2.99,non,plus)]),
     coup(2,3,1,[c(0,green,10,1.64,oui,oui),c(1,yellow,9,7.36,oui,oui),c(2,red,10,1.72,non,oui),c(3,blue,10,5.16,non,oui)]),
     coup(3,1,1,[c(2,blue,10,4.68,oui,oui),c(3,red,10,1.6,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

v0 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
yellow avant red                        : intial constraint 
[dans(c0,[blue,green,yellow])]
[dans(c2,[blue,red,yellow])]
[meme_rang(c0,c2)]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

v0 is 10                                : seen 
v1 < 10                                 : answer of the system 
     => v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
c0 in [blue,green]                      : seen 
blue meme_rang green                    : intial constraint 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 in [blue,green]                      : seen 
blue meme_rang red                      : intial constraint 
green meme_rang red                     : intial constraint 
[avant(c1,c0)]
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red] : 

c0 \= c2                                : seen 
yellow avant blue                       : seen 
yellow avant green                      : intial constraint 
c0 in [blue,green]                      : seen 
c2 in [blue,red,yellow]                 : seen 
c0 meme_rang c2                         : connu_simplification_equivalence 
     => c2 in [blue,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= red                               : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [green,red]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
c0 meme_rang c3                         : intial constraint 
[dans(c3,[green,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

