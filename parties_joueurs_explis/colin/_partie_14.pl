ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,colin).
partie(14,'../parties_joueur/colin/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,30,[c(0,red,5,35.32,non,moins),c(1,yellow,3,4.6,non,plus),c(2,blue,7,6.45,non,plus),c(3,green,9,2.55,non,moins)]),
     coup(2,30,1,[c(0,yellow,3,10.91,oui,oui),c(1,red,5,2.9,oui,oui),c(2,green,9,7.54,oui,oui),c(3,blue,7,13.14,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

v0 < 5                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4]

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v0,[1,2,3,4])]
[dans(v2,[8,9,10])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
[avant(c0,c2)]
[dans(c0,[blue,green,yellow])]
[dans(c2,[green,red,yellow])]=> c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4] : 

v0 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c0 in [blue,yellow]                     : seen 
c2 in [green,red,yellow]                : seen 
     => c2 in [green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red,yellow] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7,8] : 

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


