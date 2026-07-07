ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,colin).
partie(2,'../parties_joueur/colin/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,1,[c(0,green,10,7.55,oui,oui),c(1,blue,10,2.16,non,moins),c(2,red,10,2.75,non,oui),c(3,yellow,9,2.54,non,plus)]),
     coup(2,1,1,[c(1,yellow,9,8.57,oui,oui),c(2,blue,10,1.26,oui,oui),c(3,red,10,1.87,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : seen 
c0 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

v0 is 10                                : seen 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
yellow avant green                      : intial constraint 
c0 is green                             : seen 
[dans(c2,[blue,yellow])]
[meme_rang(c0,c2)]=> c2 is blue

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
[dans(c2,[blue])]
[dans(c3,[blue,red])]=> c3 is red

c1 \= c3                                : intial constraint 
[dans(c1,[red,yellow])]
[dans(c3,[red])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 < 10                                 : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



********** no reduction after move 2 **********

