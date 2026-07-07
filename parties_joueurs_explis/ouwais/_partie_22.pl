ident(22,'38green=blue<yellow=red0yellow101red102green93blue9').
joueur(22,ouwais).
partie(22,'../parties_joueur/ouwais/_partie_22').
somme(22,38).
ordre_couleurs(22,[green,=,blue,<,yellow,=,red]).
solution(22,[c(0,yellow,10),c(1,red,10),c(2,green,9),c(3,blue,9)]).
nb_solutions(22,24).
cartes_jouees(22,
   [
     coup(1,24,1,[c(0,yellow,10,2.74,oui,oui),c(1,green,9,3.29,non,plus),c(2,red,10,18.82,non,moins),c(3,blue,9,1.9,oui,oui)]),
     coup(2,1,1,[c(1,red,10,1.7,oui,oui),c(2,green,9,6.61,oui,oui)])
   ]
            ).
resultat(22,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c1 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c1,[blue,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

v3 is 9                                 : answer of the system 
     => v3 max 9

[max(v0,10)]
[max(v1,10)]
[max(v3,9)]=> if v2 < 9 then v0 + v1 + v2 + v3 < 38

38 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<9,v0+(v1+(v2+v3))<38)]=> v2 is 9


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



********** no reduction after move 2 **********

