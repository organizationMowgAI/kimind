ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,colin).
partie(8,'../parties_joueur/colin/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,5,[c(0,green,5,25.91,non,plus),c(1,yellow,7,2.28,non,moins),c(2,red,9,2.92,non,moins),c(3,blue,3,2.18,oui,oui)]),
     coup(2,5,1,[c(0,red,9,2.38,oui,oui),c(1,green,5,25.03,oui,oui),c(2,yellow,7,2.37,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

v1 < 7                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6]

[dans(v1,[1,2,3,4,5,6])]=> v1 max 6

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]

[dans(v2,[1,2,3,4,5,6,7,8])]=> v2 max 8

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v1,6)]
[max(v2,8)]
[max(v3,3)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<24)]=> v0 in [7,8,9,10]

v0 in [7,8,9,10]                        : seen 
     => v0 max 10

v2 max 8                                : seen 
v3 max 3                                : seen 
[max(v0,10)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<3,v0+(v1+(v2+v3))<24)]=> v1 in [3,4,5,6]

[dans(v0,[7,8,9,10])]
[dans(v1,[3,4,5,6])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c0 \= c1                                : intial constraint 
yellow avant red                        : intial constraint 
c0 in [red,yellow]                      : seen 
[avant(c1,c0)]
[dans(c1,[green,red])]=> c1 is green

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
[dans(c1,[green])]
[dans(c2,[green,yellow])]=> c2 is yellow

c0 \= c2                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c2,[yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9,10] : 

v0 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6] : 

c1 in [green,red]                       : seen 
c3 is blue                              : seen 
     => c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

v1 in [3,4,5,6]                         : seen 
v3 is 3                                 : seen 
[v3<v1]=> v1 in [4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v0 max 10                               : seen 
v1 max 6                                : seen 
v3 max 3                                : seen 
     => if v2 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<24)]=> v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 


