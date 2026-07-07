ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,ouwais).
partie(9,'../parties_joueur/ouwais/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,2,[c(0,green,7,4.54,oui,plus),c(1,red,9,77.36,non,moins),c(2,yellow,5,1.41,oui,oui),c(3,blue,6,7.26,non,plus)]),
     coup(2,2,1,[c(0,green,8,13.7,oui,oui),c(1,blue,7,23.37,oui,oui),c(3,red,9,3.15,oui,plus)]),
     coup(3,1,1,[c(3,red,10,4.4,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c3,[red,yellow])]=> c3 is red

green avant red                         : intial constraint 
c0 is green                             : seen 
[dans(c3,[red])]=> c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

7 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [8,9,10]

6 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [7,8,9,10]

[v0<v3]
[dans(v0,[8,9,10])]
[dans(v3,[7,8,9,10])]=> v0 in [8,9]
v3 in [9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8] : 

v0 < v3                                 : connu_simplification_equivalence 
v0 in [8,9,10]                          : seen 
v3 in [7,8,9,10]                        : seen 
     => v0 in [8,9]
v3 in [9,10]

[dans(v0,[8,9]),dans(v3,[9,10])]=> v0 max 9

v2 is 5                                 : answer of the system 
     => v2 max 5

v0 < v3                                 : connu_simplification_equivalence 
v0 in [8,9,10]                          : seen 
v3 in [7,8,9,10]                        : seen 
     => v0 in [8,9]
v3 in [9,10]

[dans(v0,[8,9]),dans(v3,[9,10])]=> v3 max 10

[max(v0,9)]
[max(v2,5)]
[max(v3,10)]=> if v1 < 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<6,v0+(v1+(v2+v3))<30)]=> v1 in [6,7,8]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v0 < v3                                 : connu_simplification_equivalence 
v0 in [8,9,10]                          : seen 
v3 in [7,8,9,10]                        : seen 
     => v0 in [8,9]
v3 in [9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



********** no reduction after move 3 **********

