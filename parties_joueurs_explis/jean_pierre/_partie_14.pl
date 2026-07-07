ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,jean_pierre).
partie(14,'../parties_joueur/jean_pierre/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,6,[c(0,yellow,5,50.4,oui,moins),c(1,red,6,10.15,oui,moins),c(2,blue,7,39.63,non,plus),c(3,green,8,2.6,non,moins)]),
     coup(2,6,2,[c(0,yellow,4,30.78,oui,moins),c(1,red,5,1.78,oui,oui),c(2,green,8,5.35,oui,plus),c(3,blue,7,2.35,oui,oui)]),
     coup(3,2,1,[c(0,yellow,2,11.82,oui,plus),c(2,green,10,1.38,oui,moins)]),
     coup(4,1,1,[c(0,yellow,3,7.85,oui,oui),c(2,green,9,1.4,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4] : 

v1 < 6                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5]

[dans(v1,[1,2,3,4,5])]=> v1 max 5

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 max 10

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 max 7

[max(v1,5)]
[max(v2,10)]
[max(v3,7)]=> if v0 < 2 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<2,v0+(v1+(v2+v3))<24)]=> v0 in [2,3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5] : 

v0 in [2,3,4]                           : seen 
     => v0 max 4

v2 max 10                               : seen 
v3 max 7                                : seen 
[max(v0,4)]=> if v1 < 3 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<3,v0+(v1+(v2+v3))<24)]=> v1 in [3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6,7] : 

v0 max 4                                : seen 
v1 max 5                                : seen 
v2 max 10                               : seen 
     => if v3 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<24)]=> v3 in [5,6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3] : 

v0 < 4                                  : answer of the system 
v0 in [2,3,4]                           : known domain 
     => v0 in [2,3]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

8 < v2                                  : answer of the system 
v2 in [8,9,10]                          : known domain 
     => v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 > 2                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 < 10                                 : answer of the system 



********** no reduction after move 4 **********

