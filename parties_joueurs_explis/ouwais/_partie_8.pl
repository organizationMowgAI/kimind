ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,ouwais).
partie(8,'../parties_joueur/ouwais/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,14,[c(0,red,8,100.6,oui,plus),c(1,yellow,8,17.15,non,moins),c(2,blue,3,7.71,non,plus),c(3,green,5,10.92,non,moins)]),
     coup(2,14,1,[c(0,red,9,18.57,oui,oui),c(1,green,4,18.01,oui,plus),c(2,yellow,8,15.38,oui,moins),c(3,blue,3,25.8,oui,oui)]),
     coup(3,1,1,[c(1,green,5,1.37,oui,oui),c(2,yellow,7,22.64,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

8 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6,7] : 

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5,6,7,8,9] : 

c0 is red                               : seen 
c2 in [green,yellow]                    : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

3 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [4,5,6,7,8,9,10]

v0 in [9,10]                            : seen 
[v2<v0]
[dans(v2,[4,5,6,7,8,9,10])]=> v2 in [4,5,6,7,8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,yellow] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

green avant yellow                      : intial constraint 
c1 is green                             : seen 
c2 is yellow                            : answer of the system 
     => c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [5,6,7]

v0 is 9                                 : seen 
     => v0 max 9

v1 in [5,6,7]                           : seen 
     => v1 max 7

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v0,9)]
[max(v1,7)]
[max(v3,3)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<24)]=> v2 in [5,6,7]

[v1<v2]
[dans(v1,[5,6,7])]
[dans(v2,[5,6,7])]=> v1 in [5,6]
v2 in [6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7] : 

v1 < v2                                 : connu_simplification_equivalence 
v1 in [5,6,7]                           : seen 
v2 in [5,6,7]                           : seen 
     => v1 in [5,6]
v2 in [6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 3 *************

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


