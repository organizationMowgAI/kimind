ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,nouredine).
partie(14,'../parties_joueur/nouredine/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,4,[c(0,yellow,2,41.41,oui,plus),c(1,red,5,4.52,oui,oui),c(2,blue,7,4.93,non,plus),c(3,green,10,4.29,non,moins)]),
     coup(2,4,1,[c(0,yellow,3,87.15,oui,oui),c(2,green,9,10.33,oui,oui),c(3,blue,7,12.44,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4] : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : answer of the system 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]

v1 is 5                                 : answer of the system 
[v0<v1]
[dans(v0,[3,4,5,6,7,8,9,10])]=> v0 in [3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


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

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]


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

the value (v3) of the card in position 3 is in [6,7,8] : 

red avant blue                          : intial constraint 
c1 is red                               : seen 
c3 is blue                              : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v0 in [3,4]                             : seen 
     => v0 max 4

v1 is 5                                 : seen 
     => v1 max 5

v2 in [8,9,10]                          : seen 
     => v2 max 10

[max(v0,4)]
[max(v1,5)]
[max(v2,10)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<24)]=> v3 in [5,6,7,8]

v1 is 5                                 : seen 
[v1<v3]
[dans(v3,[5,6,7,8])]=> v3 in [6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


