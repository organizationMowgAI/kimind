ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,jean_pierre).
partie(2,'../parties_joueur/jean_pierre/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,1,[c(0,yellow,9,19.0,non,plus),c(1,red,10,14.12,non,moins),c(2,blue,10,3.8,oui,oui),c(3,green,10,2.41,non,oui)]),
     coup(2,1,1,[c(0,green,10,17.76,oui,oui),c(1,yellow,9,10.35,oui,oui),c(3,red,10,2.63,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

v0 > 9                                  : answer of the system 
v3 is 10                                : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
yellow avant red                        : intial constraint 
[dans(c0,[green,red])]
[dans(c3,[red,yellow])]
[meme_rang(c0,c3)]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [green,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[green,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c0 \= c3                                : seen 
yellow avant green                      : intial constraint 
c0 is green                             : seen 
c3 in [red,yellow]                      : seen 
c0 meme_rang c3                         : connu_simplification_equivalence 
     => c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

