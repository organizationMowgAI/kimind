ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,valerie).
partie(17,'../parties_joueur/valerie/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,3,[c(0,green,10,12.83,oui,oui),c(1,blue,10,5.72,oui,oui),c(2,yellow,8,12.1,non,moins),c(3,red,5,3.47,non,plus)]),
     coup(2,3,1,[c(2,red,5,8.18,oui,oui),c(3,yellow,8,4.42,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red])]=> c2 is red


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7] : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,yellow])]=> c3 is yellow

yellow avant green                      : intial constraint 
c0 is green                             : seen 
[dans(c3,[yellow])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

5 < v3                                  : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [6,7,8,9,10]

v0 is 10                                : seen 
[v3<v0]
[dans(v3,[6,7,8,9,10])]=> v3 in [6,7,8,9]

[dans(v3,[6,7,8,9])]=> v3 max 9

[max(v0,10)]
[max(v1,10)]
[max(v3,9)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<33)]=> v2 in [4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

v3 in [6,7,8,9]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


