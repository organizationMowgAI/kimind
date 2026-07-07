ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,claire).
partie(4,'../parties_joueur/claire/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,2,[c(0,blue,9,4.44,non,moins),c(1,green,8,3.26,oui,oui),c(2,red,6,87.34,non,plus),c(3,yellow,7,2.79,non,moins)]),
     coup(2,2,1,[c(0,yellow,7,9.1,oui,oui),c(2,blue,9,3.79,oui,plus),c(3,red,6,4.02,oui,moins)]),
     coup(3,1,1,[c(2,blue,10,7.83,oui,oui),c(3,red,5,2.88,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

v1 is 8                                 : answer of the system 
[dans(v3,[1,2,3,4,5,6])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : seen 
c1 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c1 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
c1 is green                             : seen 
[avant(c3,c1)]
[dans(c3,[blue,red])]=> c3 is red

c0 \= c3                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c3,[red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7] : 

c0 in [red,yellow]                      : seen 
c1 is green                             : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 in [6,7,8]                           : seen 
v1 is 8                                 : seen 
[v0<v1]=> v0 in [6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,yellow])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v0 in [6,7]                             : seen 
     => v0 max 7

v1 max 8                                : seen 
v3 max 6                                : seen 
[max(v0,7)]=> if v2 < 9 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<9,v0+(v1+(v2+v3))<30)]=> v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6] : 

v0 max 7                                : seen 
v1 max 8                                : seen 
v2 max 10                               : seen 
     => if v3 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<30)]=> v3 in [5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 < 6                                  : answer of the system 



********** no reduction after move 3 **********

