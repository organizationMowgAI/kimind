ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,colin).
partie(9,'../parties_joueur/colin/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,23,[c(0,blue,7,187.99,non,plus),c(1,green,8,1.99,non,moins),c(2,red,10,2.94,non,moins),c(3,yellow,5,2.49,non,plus)]),
     coup(2,23,1,[c(0,green,8,61.88,oui,oui),c(1,blue,7,3.64,oui,oui),c(2,yellow,5,2.22,oui,oui),c(3,red,10,2.45,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red] : 

7 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [8,9,10]

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7]

[dans(v0,[8,9,10])]
[dans(v1,[1,2,3,4,5,6,7])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
green avant red                         : intial constraint 
yellow avant red                        : intial constraint 
c0 in [green,red,yellow]                : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c0 \= c1                                : intial constraint 
yellow avant blue                       : intial constraint 
[avant(c1,c0)]
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,yellow])]=> c0 in [green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

v0 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,yellow] : 

c1 in [blue,yellow]                     : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6,7] : 

v1 in [1,2,3,4,5,6,7]                   : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8,9] : 

v0 in [8,9,10]                          : seen 
     => v0 max 10

v1 in [1,2,3,4,5,6,7]                   : seen 
     => v1 max 7

5 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [6,7,8,9,10]

[dans(v3,[6,7,8,9,10])]=> v3 max 10

[max(v0,10)]
[max(v1,7)]
[max(v3,10)]=> if v2 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<3,v0+(v1+(v2+v3))<30)]=> v2 in [3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

v3 in [6,7,8,9,10]                      : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


