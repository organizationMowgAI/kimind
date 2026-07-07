ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,jean_pierre).
partie(15,'../parties_joueur/jean_pierre/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,8,[c(0,yellow,7,18.78,non,plus),c(1,green,8,2.73,non,plus),c(2,red,10,2.72,non,moins),c(3,blue,10,2.41,non,moins)]),
     coup(2,8,2,[c(0,red,10,11.21,oui,oui),c(1,blue,10,2.13,oui,oui),c(2,yellow,7,5.47,non,plus),c(3,green,8,2.09,non,moins)]),
     coup(3,2,1,[c(2,green,8,15.48,oui,oui),c(3,yellow,7,1.55,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

7 < v0                                  : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7,8,9] : 

v0 in [8,9,10]                          : seen 
     => v0 max 10

v1 in [9,10]                            : seen 
     => v1 max 10

v3 < 10                                 : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7,8,9]

[dans(v3,[5,6,7,8,9])]=> v3 max 9

[max(v0,10)]
[max(v1,10)]
[max(v3,9)]=> if v2 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<6,v0+(v1+(v2+v3))<35)]=> v2 in [6,7,8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

v2 in [6,7,8,9]                         : seen 
     => v2 max 9

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,9)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<35)]=> v3 in [6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

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

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,yellow]               : known domain 
     => c2 in [blue,green]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

7 < v2                                  : answer of the system 
v2 in [6,7,8,9]                         : known domain 
     => v2 in [8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= green                             : answer of the system 
c3 in [green,red,yellow]                : known domain 
     => c3 in [red,yellow]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[red,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7] : 

v3 < 8                                  : answer of the system 
v3 in [6,7,8,9]                         : known domain 
     => v3 in [6,7]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


