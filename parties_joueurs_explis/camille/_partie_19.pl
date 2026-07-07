ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,camille).
partie(19,'../parties_joueur/camille/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,1,[c(0,blue,10,3.61,oui,oui),c(1,green,10,2.52,non,moins),c(2,red,9,12.45,non,plus),c(3,yellow,10,3.79,non,oui)]),
     coup(2,1,1,[c(1,red,9,6.2,oui,oui),c(2,yellow,10,8.44,oui,oui),c(3,green,10,13.4,oui,oui)])
   ]
            ).
resultat(19,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : seen 
c0 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

v0 is 10                                : seen 
v3 is 10                                : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
red avant blue                          : intial constraint 
c0 is blue                              : seen 
[dans(c3,[green,red])]
[meme_rang(c0,c3)]=> c3 is green

c2 \= c3                                : intial constraint 
[dans(c2,[green,yellow])]
[dans(c3,[green])]=> c2 is yellow

c1 \= c2                                : intial constraint 
[dans(c1,[red,yellow])]
[dans(c2,[yellow])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

