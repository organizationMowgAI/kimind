ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,danlin).
partie(9,'../parties_joueur/danlin/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,2,[c(0,red,9,31.58,non,moins),c(1,blue,7,6.76,oui,oui),c(2,green,8,2.43,non,moins),c(3,yellow,6,3.02,non,plus)]),
     coup(2,2,1,[c(0,green,8,2.67,oui,oui),c(2,yellow,6,12.35,oui,moins),c(3,red,9,10.95,oui,plus)]),
     coup(3,1,1,[c(2,yellow,5,3.18,oui,oui),c(3,red,10,14.13,oui,oui)])
   ]
            ).
resultat(9,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

v1 is 7                                 : answer of the system 
     => v1 max 7

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]

[dans(v2,[1,2,3,4,5,6,7])]=> v2 max 7

6 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [7,8,9,10]

[dans(v3,[7,8,9,10])]=> v3 max 10

[max(v1,7)]
[max(v2,7)]
[max(v3,10)]=> if v0 < 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<6,v0+(v1+(v2+v3))<30)]=> v0 in [6,7,8]

[dans(v0,[6,7,8])]=> v0 max 8

v1 max 7                                : seen 
v3 max 10                               : seen 
[max(v0,8)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<30)]=> v2 in [5,6,7]

v0 max 8                                : seen 
v1 max 7                                : seen 
v2 max 7                                : seen 
     => if v3 < 8 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<8,v0+(v1+(v2+v3))<30)]=> v3 in [8,9,10]

[dans(v2,[5,6,7])]
[dans(v3,[8,9,10])]=> v2 < v3

c2 avant c3 <=> v2 < v3                 : intial constraint 
[v2<v3]=> c2 avant c3

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
green avant red                         : intial constraint 
[avant(c2,c3)]
[dans(c2,[red,yellow])]
[dans(c3,[green,red])]=> c2 is yellow

c0 \= c2                                : intial constraint 
[dans(c0,[green,yellow])]
[dans(c2,[yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

blue avant green                        : intial constraint 
c0 is green                             : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

v0 in [6,7,8]                           : seen 
v1 is 7                                 : seen 
[v1<v0]=> v0 is 8


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6] : 

v0 is 8                                 : seen 
     => v0 min 8

v1 is 7                                 : seen 
     => v1 min 7

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
c3 in [green,red]                       : seen 
     => c3 is red

green avant red                         : seen 
c0 is green                             : seen 
[dans(c3,[red])]=> c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

v0 is 8                                 : seen 
v3 in [8,9,10]                          : seen 
[v0<v3]=> v3 in [9,10]

[dans(v3,[9,10])]=> v3 min 9

[min(v0,8)]
[min(v1,7)]
[min(v3,9)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<30)]=> v2 in [5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 < 6                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 > 9                                  : answer of the system 



********** no reduction after move 3 **********

