ident(4,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(4,veronique).
partie(4,'../parties_joueur/veronique/_partie_4').
somme(4,20).
ordre_couleurs(4,[yellow,=,red,<,blue,<,green]).
solution(4,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(4,168).
cartes_jouees(4,
   [
     coup(1,168,4,[c(0,red,4,79.89,non,moins),c(1,yellow,4,6.84,non,plus),c(2,green,7,6.15,non,moins),c(3,blue,5,15.04,non,moins)]),
     coup(2,4,2,[c(0,yellow,3,125.61,oui,oui),c(1,green,8,6.47,oui,plus),c(2,blue,6,6.05,oui,moins),c(3,red,3,4.98,oui,oui)]),
     coup(3,2,1,[c(1,green,9,73.31,oui,plus),c(2,blue,5,3.1,oui,moins)]),
     coup(4,1,1,[c(1,green,10,23.05,oui,oui),c(2,blue,4,3.5,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3]

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v0,[1,2,3])]
[dans(v1,[5,6,7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
blue avant green                        : intial constraint 
red avant green                         : intial constraint 
[avant(c0,c1)]
[dans(c0,[blue,green,yellow])]
[dans(c1,[blue,green,red])]=> c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3] : 

v0 in [1,2,3]                           : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
red avant blue                          : intial constraint 
c0 in [blue,yellow]                     : seen 
c1 in [blue,green,red]                  : seen 
red meme_rang yellow                    : intial constraint 
     => c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9,10] : 

v1 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6] : 

v1 in [7,8,9,10]                        : seen 
     => v1 max 10

v0 max 3                                : seen 
v3 max 4                                : seen 
[max(v1,10)]=> if v2 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<3,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

v3 in [1,2,3,4]                         : seen 
[dans(v1,[5,6,7,8,9,10])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
blue avant green                        : seen 
c1 in [blue,green]                      : seen 
[avant(c3,c1)]
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [7,8,9,10]                        : known domain 
     => v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v0 is 3                                 : seen 
     => v0 max 3

v1 in [9,10]                            : seen 
     => v1 max 10

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v0,3)]
[max(v1,10)]
[max(v3,3)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<20)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < 5                                  : answer of the system 



********** no reduction after move 4 **********

