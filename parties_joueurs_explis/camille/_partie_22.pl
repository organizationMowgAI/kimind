ident(22,'38green=blue<yellow=red0yellow101red102green93blue9').
joueur(22,camille).
partie(22,'../parties_joueur/camille/_partie_22').
somme(22,38).
ordre_couleurs(22,[green,=,blue,<,yellow,=,red]).
solution(22,[c(0,yellow,10),c(1,red,10),c(2,green,9),c(3,blue,9)]).
nb_solutions(22,24).
cartes_jouees(22,
   [
     coup(1,24,1,[c(0,blue,9,48.19,non,plus),c(1,red,10,2.58,oui,oui),c(2,green,9,4.18,oui,oui),c(3,yellow,10,2.01,non,moins)]),
     coup(2,1,1,[c(0,yellow,10,14.14,oui,oui),c(3,blue,9,5.49,oui,oui)])
   ]
            ).
resultat(22,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

v2 is 9                                 : seen 
     => v2 max 9

[max(v0,10)]
[max(v1,10)]
[max(v2,9)]=> if v3 < 9 then v0 + v1 + v2 + v3 < 38

38 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<9,v0+(v1+(v2+v3))<38)]=> v3 is 9



********** no reduction after move 2 **********

