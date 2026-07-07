ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,ouwais).
partie(14,'../parties_joueur/ouwais/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,6,[c(0,red,4,7.47,non,moins),c(1,green,8,5.11,non,moins),c(2,yellow,3,27.64,non,plus),c(3,blue,7,7.06,oui,oui)]),
     coup(2,6,2,[c(0,yellow,3,33.35,oui,oui),c(1,green,4,10.72,non,plus),c(2,red,5,15.59,non,plus)]),
     coup(3,2,2,[c(1,red,8,43.69,oui,moins),c(2,green,5,4.91,oui,plus)]),
     coup(4,2,1,[c(1,red,5,13.45,oui,oui),c(2,green,9,82.28,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3]

v0 in [1,2,3]                           : seen 
     => v0 max 3

3 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [4,5,6,7,8,9,10]

[dans(v2,[4,5,6,7,8,9,10])]=> v2 max 10

v3 is 7                                 : answer of the system 
     => v3 max 7

[max(v0,3)]
[max(v2,10)]
[max(v3,7)]=> if v1 < 4 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<4,v0+(v1+(v2+v3))<24)]=> v1 in [4,5,6,7]

[dans(v0,[1,2,3])]
[dans(v1,[4,5,6,7])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c0 \= c1                                : intial constraint 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
[avant(c0,c1)]
[dans(c0,[green,yellow])]
[dans(c1,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3] : 

v0 in [1,2,3]                           : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 is yellow                            : seen 
c1 in [red,yellow]                      : seen 
     => c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6] : 

c1 in [red,yellow]                      : seen 
c3 is blue                              : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v1 in [4,5,6,7]                         : seen 
v3 is 7                                 : seen 
[v1<v3]=> v1 in [4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,green,red])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v1 in [4,5,6]                           : seen 
     => v1 max 6

v0 max 3                                : seen 
v3 max 7                                : seen 
[max(v1,6)]=> if v2 < 8 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<8,v0+(v1+(v2+v3))<24)]=> v2 in [8,9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

4 < v1                                  : answer of the system 
v1 in [4,5,6]                           : known domain 
     => v1 in [5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

v0 is 3                                 : seen 
     => v0 min 3

v1 in [5,6]                             : seen 
     => v1 min 5

[min(v0,3)]
[min(v1,5)]=> if v2 > 9 then v0 + v1 + v2 < 17

17 = v0 + v1 + v2                       : intial constraint 
[si_alors(v2>9,v0+(v1+v2)<17)]=> v2 in [8,9]



********** no reduction after move 3 **********

************* explanations of the reductions after move 4 *************

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

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 


