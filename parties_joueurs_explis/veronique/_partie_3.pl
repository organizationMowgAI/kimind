ident(3,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(3,veronique).
partie(3,'../parties_joueur/veronique/_partie_3').
somme(3,39).
ordre_couleurs(3,[yellow,<,green,=,blue,=,red]).
solution(3,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(3,24).
cartes_jouees(3,
   [
     coup(1,24,2,[c(0,blue,10,49.54,non,oui),c(1,yellow,9,6.29,oui,oui),c(2,red,10,5.42,non,oui),c(3,green,10,3.77,non,oui)]),
     coup(2,2,1,[c(0,red,10,27.16,non,oui),c(2,green,10,8.35,non,oui),c(3,blue,10,2.32,non,oui)]),
     coup(3,1,1,[c(0,green,10,21.63,oui,oui),c(2,blue,10,6.74,oui,oui),c(3,red,10,2.8,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= red                               : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= green                             : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

