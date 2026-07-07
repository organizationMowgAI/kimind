ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,danlin).
partie(8,'../parties_joueur/danlin/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,3,[c(0,blue,4,2.37,non,plus),c(1,green,5,4.43,oui,oui),c(2,yellow,7,2.37,oui,oui),c(3,red,8,23.44,non,moins)]),
     coup(2,3,2,[c(0,red,8,10.22,oui,plus),c(3,blue,4,2.01,oui,moins)]),
     coup(3,2,1,[c(0,red,9,4.19,oui,oui),c(3,blue,3,1.7,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c2 is yellow                            : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

green avant red                         : intial constraint 
c0 is red                               : seen 
c1 is green                             : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]

v1 is 5                                 : answer of the system 
[v1<v0]
[dans(v0,[5,6,7,8,9,10])]=> v0 in [6,7,8,9,10]

v2 is 7                                 : answer of the system 
[v2<v0]
[dans(v0,[6,7,8,9,10])]=> v0 in [8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4] : 

v0 in [8,9,10]                          : seen 
     => v0 min 8

v1 is 5                                 : seen 
     => v1 min 5

v2 is 7                                 : seen 
     => v2 min 7

[min(v0,8)]
[min(v1,5)]
[min(v2,7)]=> if v3 > 4 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>4,v0+(v1+(v2+v3))<24)]=> v3 in [2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

8 < v0                                  : answer of the system 
v0 in [8,9,10]                          : known domain 
     => v0 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3] : 

v3 < 4                                  : answer of the system 
v3 in [2,3,4]                           : known domain 
     => v3 in [2,3]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


