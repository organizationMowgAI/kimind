ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,junkang).
partie(4,'../parties_joueur/junkang/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,20,[c(0,blue,9,2.91,non,moins),c(1,red,6,21.82,non,plus),c(2,yellow,7,4.52,non,plus),c(3,green,8,2.11,non,moins)]),
     coup(2,20,1,[c(0,yellow,7,8.78,oui,oui),c(1,green,8,9.5,oui,oui),c(2,blue,9,30.03,oui,plus),c(3,red,6,3.26,oui,moins)]),
     coup(3,1,1,[c(2,blue,10,6.4,oui,oui),c(3,red,5,4.64,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7,8] : 

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 max 10

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 max 7

[max(v1,10)]
[max(v2,10)]
[max(v3,7)]=> if v0 < 3 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<3,v0+(v1+(v2+v3))<30)]=> v0 in [3,4,5,6,7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9,10] : 

v1 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

v2 in [8,9,10]                          : seen 
v3 in [1,2,3,4,5,6,7]                   : seen 
     => v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : seen 
c3 avant c2                             : connu_simplification_equivalence 
green avant blue                        : intial constraint 
red avant blue                          : intial constraint 
c2 in [blue,green,red]                  : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
red avant yellow                        : intial constraint 
[avant(c3,c2)]
[dans(c2,[blue,green,red])]
[dans(c3,[red,yellow])]=> c2 in [blue,green]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6,7] : 

v3 in [2,3,4,5,6,7]                     : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 is 7                                 : seen 
     => v0 max 7

v1 is 8                                 : seen 
     => v1 max 8

v2 is 10                                : seen 
     => v2 max 10

[max(v0,7)]
[max(v1,8)]
[max(v2,10)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<30)]=> v3 is 5



********** no reduction after move 3 **********

