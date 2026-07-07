ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,jean_pierre).
partie(9,'../parties_joueur/jean_pierre/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,3,[c(0,yellow,5,55.88,non,plus),c(1,blue,6,2.57,oui,plus),c(2,green,9,2.2,non,moins),c(3,red,10,2.34,oui,oui)]),
     coup(2,3,1,[c(0,green,9,11.65,oui,moins),c(1,blue,7,44.67,oui,oui),c(2,yellow,4,2.52,oui,plus)]),
     coup(3,1,1,[c(0,green,8,15.59,oui,oui),c(2,yellow,5,1.8,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

green avant red                         : intial constraint 
c0 is green                             : seen 
c3 is red                               : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

blue avant green                        : intial constraint 
c0 is green                             : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

5 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [6,7,8,9,10]

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[v1<v0]
[dans(v0,[6,7,8,9,10])]
[dans(v1,[7,8,9,10])]=> v0 in [8,9,10]
v1 in [7,8,9]

v3 is 10                                : answer of the system 
[v0<v3]
[dans(v0,[8,9,10]),dans(v1,[7,8,9])]=> v0 in [8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9] : 

v1 < v0                                 : connu_simplification_equivalence 
v0 in [6,7,8,9,10]                      : seen 
v1 in [7,8,9,10]                        : seen 
     => v0 in [8,9,10]
v1 in [7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5] : 

v0 in [8,9]                             : seen 
     => v0 max 9

v1 < v0                                 : connu_simplification_equivalence 
v0 in [6,7,8,9,10]                      : seen 
v1 in [7,8,9,10]                        : seen 
     => v0 in [8,9,10]
v1 in [7,8,9]

[dans(v0,[8,9,10]),dans(v1,[7,8,9])]=> v1 max 9

v3 is 10                                : seen 
     => v3 max 10

[max(v0,9)]
[max(v1,9)]
[max(v3,10)]=> if v2 < 2 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<2,v0+(v1+(v2+v3))<30)]=> v2 in [2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 < 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 > 4                                  : answer of the system 



********** no reduction after move 3 **********

