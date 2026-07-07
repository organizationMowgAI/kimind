ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,malik).
partie(16,'../parties_joueur/malik/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,1,[c(0,red,5,3.09,non,oui),c(1,blue,10,62.33,oui,oui),c(2,green,5,6.66,oui,oui),c(3,yellow,5,3.14,non,oui)]),
     coup(2,1,1,[c(0,yellow,5,7.71,oui,oui),c(3,red,5,1.74,oui,oui)])
   ]
            ).
resultat(16,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[green,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : answer of the system 


********** no reduction after move 2 **********

