ident(5,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(5,veronique).
partie(5,'../parties_joueur/veronique/_partie_5').
somme(5,30).
ordre_couleurs(5,[red,<,yellow,<,green,<,blue]).
solution(5,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(5,120).
cartes_jouees(5,
   [
     coup(1,120,4,[c(0,red,6,90.08,non,plus),c(1,yellow,7,10.36,non,plus),c(2,green,8,5.23,non,plus),c(3,blue,9,5.82,non,moins)]),
     coup(2,4,1,[c(0,yellow,7,111.14,oui,oui),c(1,green,8,9.22,oui,oui),c(2,blue,9,20.19,oui,plus),c(3,red,6,4.83,oui,moins)]),
     coup(3,1,1,[c(2,blue,10,14.02,oui,oui),c(3,red,5,4.35,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9,10] : 

6 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

7 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [8,9,10]

v0 in [7,8,9,10]                        : seen 
     => v0 min 7

v1 in [8,9,10]                          : seen 
     => v1 min 8

8 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 min 9

[min(v0,7)]
[min(v1,8)]
[min(v2,9)]=> if v3 > 6 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>6,v0+(v1+(v2+v3))<30)]=> v3 in [1,2,3,4,5,6]

[dans(v1,[8,9,10])]
[dans(v3,[1,2,3,4,5,6])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
red avant green                         : intial constraint 
red avant yellow                        : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,green,red])]
[dans(c3,[green,red,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]

v2 in [9,10]                            : seen 
[dans(v3,[1,2,3,4,5,6,7,8])]=> v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
red avant green                         : seen 
red avant yellow                        : seen 
c3 in [green,red,yellow]                : seen 
[avant(c3,c2)]
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

c3 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6] : 

v3 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 is 7                                 : seen 
     => v0 max 7

v1 is 8                                 : seen 
     => v1 max 8

v2 is 10                                : seen 
     => v2 max 10

[max(v0,7)]
[max(v1,8)]
[max(v2,10)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<30)]=> v3 is 5



********** no reduction after move 3 **********

