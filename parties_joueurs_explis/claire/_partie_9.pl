ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,claire).
partie(9,'../parties_joueur/claire/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,4,[c(0,blue,7,3.14,non,plus),c(1,yellow,6,34.91,non,plus),c(2,red,9,2.39,non,moins),c(3,green,8,3.35,non,plus)]),
     coup(2,4,1,[c(0,green,8,4.69,oui,oui),c(1,blue,7,2.41,oui,oui),c(2,yellow,6,8.29,oui,moins),c(3,red,9,5.07,oui,plus)]),
     coup(3,1,1,[c(2,yellow,5,4.29,oui,oui),c(3,red,10,39.38,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red] : 

7 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [8,9,10]

v0 in [8,9,10]                          : seen 
     => v0 min 8

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 min 7

8 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [9,10]

[dans(v3,[9,10])]=> v3 min 9

[min(v0,8)]
[min(v1,7)]
[min(v3,9)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>6,v0+(v1+(v2+v3))<30)]=> v2 in [1,2,3,4,5,6]

[dans(v0,[8,9,10])]
[dans(v2,[1,2,3,4,5,6])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
yellow avant green                      : intial constraint 
[avant(c2,c0)]
[dans(c0,[green,red,yellow])]
[dans(c2,[blue,green,yellow])]=> c0 in [green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

v0 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [7,8,9,10] : 

v1 in [7,8,9,10]                        : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,yellow] : 

c2 in [blue,green,yellow]               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6] : 

v2 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

v2 < 9                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7,8]

v3 in [9,10]                            : seen 
[dans(v2,[1,2,3,4,5,6,7,8])]=> v2 < v3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[v2<v3]=> c2 avant c3

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
yellow avant blue                       : seen 
yellow avant green                      : seen 
c2 in [blue,green,yellow]               : seen 
[avant(c2,c3)]
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 is 8                                 : seen 
     => v0 max 8

v1 is 7                                 : seen 
     => v1 max 7

v3 > 9                                  : answer of the system 
     => v3 max 10

[max(v0,8)]
[max(v1,7)]
[max(v3,10)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<30)]=> v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 3 **********

