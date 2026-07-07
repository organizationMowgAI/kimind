ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,malik).
partie(13,'../parties_joueur/malik/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,1,[c(0,red,10,2.75,oui,oui),c(1,green,10,9.96,non,oui),c(2,yellow,10,3.53,non,oui),c(3,blue,8,2.79,oui,oui)]),
     coup(2,1,1,[c(1,yellow,10,8.4,oui,oui),c(2,green,10,2.98,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c1,[blue,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


********** no reduction after move 2 **********

