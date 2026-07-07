ident(19,'39red<blue=yellow=green0blue101red92yellow103green10').
joueur(19,colin).
partie(19,'../parties_joueur/colin/_partie_19').
somme(19,39).
ordre_couleurs(19,[red,<,blue,=,yellow,=,green]).
solution(19,[c(0,blue,10),c(1,red,9),c(2,yellow,10),c(3,green,10)]).
nb_solutions(19,24).
cartes_jouees(19,
   [
     coup(1,24,1,[c(0,blue,10,9.76,oui,oui),c(1,yellow,10,1.94,non,moins),c(2,green,10,3.66,non,oui),c(3,red,9,2.44,non,plus)]),
     coup(2,1,1,[c(1,red,9,8.22,oui,oui),c(2,yellow,10,4.48,oui,oui),c(3,green,10,2.34,oui,oui)])
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

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : seen 
c0 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

v0 is 10                                : seen 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
red avant blue                          : intial constraint 
c0 is blue                              : seen 
[dans(c2,[red,yellow])]
[meme_rang(c0,c2)]=> c2 is yellow

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]

c2 \= c3                                : intial constraint 
[dans(c2,[yellow])]
[dans(c3,[green,yellow])]=> c3 is green

c1 \= c3                                : intial constraint 
[dans(c1,[green,red])]
[dans(c3,[green])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



********** no reduction after move 2 **********

