ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,colin).
partie(4,'../parties_joueur/colin/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,3,[c(0,yellow,6,71467.25,oui,plus),c(1,red,5,13.51,non,plus),c(2,blue,10,4.7,oui,oui),c(3,green,9,2.22,non,moins)]),
     coup(2,3,1,[c(0,yellow,7,55.18,oui,oui),c(1,green,9,2.29,oui,moins),c(3,red,4,2.06,oui,plus)]),
     coup(3,1,1,[c(1,green,8,6.8,oui,oui),c(3,red,5,2.02,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c1,[blue,green])]=> c1 is green

yellow avant green                      : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[green])]=> c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

6 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [7,8,9,10]

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

[v0<v1]
[dans(v0,[7,8,9,10])]
[dans(v1,[6,7,8,9,10])]=> v0 in [7,8,9]
v1 in [8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9] : 

green avant blue                        : intial constraint 
c1 is green                             : seen 
c2 is blue                              : seen 
     => c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

v0 < v1                                 : connu_simplification_equivalence 
v0 in [7,8,9,10]                        : seen 
v1 in [6,7,8,9,10]                      : seen 
     => v0 in [7,8,9]
v1 in [8,9,10]

v2 is 10                                : answer of the system 
[v1<v2]
[dans(v0,[7,8,9]),dans(v1,[8,9,10])]=> v1 in [8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [7,8,9,10]                        : seen 
v1 in [6,7,8,9,10]                      : seen 
     => v0 in [7,8,9]
v1 in [8,9,10]

[dans(v0,[7,8,9]),dans(v1,[8,9,10])]=> v0 max 9

v1 in [8,9]                             : seen 
     => v1 max 9

v2 is 10                                : seen 
     => v2 max 10

[max(v0,9)]
[max(v1,9)]
[max(v2,10)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<2,v0+(v1+(v2+v3))<30)]=> v3 in [2,3,4,5]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 < 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 > 4                                  : answer of the system 



********** no reduction after move 3 **********

