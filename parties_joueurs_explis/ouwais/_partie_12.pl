ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,ouwais).
partie(12,'../parties_joueur/ouwais/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,5,[c(0,red,8,9.57,non,moins),c(1,blue,5,281.94,non,plus),c(2,yellow,5,3.23,oui,moins),c(3,green,7,1.88,non,moins)]),
     coup(2,5,1,[c(0,green,7,19.21,non,moins),c(1,red,6,1.47,non,plus),c(2,yellow,4,17.87,oui,moins),c(3,blue,4,6.37,non,oui)]),
     coup(3,1,1,[c(0,blue,3,13.77,oui,oui),c(1,green,7,29.34,oui,plus),c(2,yellow,3,1.29,oui,oui),c(3,red,4,6.18,oui,oui)]),
     coup(4,1,1,[c(1,green,10,8.31,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6,7] : 

v0 < 8                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9,10] : 

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6] : 

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= green                             : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

blue avant red                          : intial constraint 
c0 is blue                              : seen 
c3 \= blue                              : answer of the system 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

6 < v1                                  : answer of the system 
v1 in [6,7,8,9,10]                      : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4]                         : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 max 3

v3 is 4                                 : answer of the system 
     => v3 max 4

[max(v1,10)]
[max(v2,3)]
[max(v3,4)]=> if v0 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<3,v0+(v1+(v2+v3))<20)]=> v0 in [3,4,5,6]

v3 is 4                                 : seen 
[v0<v3]
[dans(v0,[3,4,5,6])]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 3                                 : seen 
     => v0 max 3

v2 max 3                                : seen 
v3 max 4                                : seen 
[max(v0,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<20)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v3 max 4                                : seen 
     => if v2 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<3,v0+(v1+(v2+v3))<20)]=> v2 is 3


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 is 4                                 : seen 



********** no reduction after move 3 **********

********** no reduction after move 4 **********

