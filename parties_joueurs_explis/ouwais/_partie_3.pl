ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,ouwais).
partie(3,'../parties_joueur/ouwais/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,8,[c(0,green,2,57.73,non,plus),c(1,red,3,3.29,non,plus),c(2,yellow,5,2.01,non,moins),c(3,blue,4,1.72,non,moins)]),
     coup(2,8,4,[c(0,red,7,1.53,non,moins),c(1,yellow,7,13.82,non,plus),c(2,green,2,132.25,non,plus),c(3,blue,3,50.86,non,oui)]),
     coup(3,4,1,[c(0,yellow,8,2.01,oui,moins),c(1,red,8,88.0,non,plus),c(2,blue,4,70.42,oui,oui),c(3,green,3,16.13,non,oui)]),
     coup(4,1,1,[c(0,yellow,3,69.15,oui,oui),c(1,green,10,21.38,oui,oui),c(3,red,3,2.84,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7,8,9,10] : 

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3]

[dans(v1,[4,5,6,7,8,9,10])]
[dans(v3,[1,2,3])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : seen 
blue avant green                        : intial constraint 
c3 avant c1                             : connu_simplification_equivalence 
yellow avant green                      : intial constraint 
c1 in [blue,green,yellow]               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]

c1 \= c3                                : intial constraint 
red meme_rang yellow                    : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,green,yellow])]
[dans(c3,[red,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

v1 in [4,5,6,7,8,9,10]                  : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3] : 

v3 in [1,2,3]                           : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6] : 

v0 < 7                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

c1 in [blue,green]                      : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

7 < v1                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red]                  : known domain 
     => c2 in [blue,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4] : 

2 < v2                                  : answer of the system 
v2 in [1,2,3,4]                         : known domain 
     => v2 in [3,4]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 in [red,yellow]                      : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

yellow avant blue                       : intial constraint 
c0 is yellow                            : seen 
c2 is blue                              : answer of the system 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

8 < v1                                  : answer of the system 
v1 in [8,9,10]                          : known domain 
     => v1 in [9,10]

[dans(v1,[9,10])]=> v1 min 9

v2 is 4                                 : answer of the system 
     => v2 min 4

[min(v1,9)]
[min(v2,4)]=> if v0 > 4 then v0 + v1 + v2 < 17

17 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0>4,v0+(v1+v2)<17)]=> v0 in [3,4]

v2 is 4                                 : seen 
[v0<v2]
[dans(v0,[3,4])]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= c2                                : intial constraint 
c2 avant c1                             : intial constraint 
c1 in [blue,green]                      : known domain 
c2 is blue                              : seen 
     => c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 3                                 : seen 
     => v0 max 3

v2 is 4                                 : seen 
     => v2 max 4

[max(v0,3)]
[max(v2,4)]=> if v1 < 10 then v0 + v1 + v2 < 17

17 = v0 + v1 + v2                       : seen 
[si_alors(v1<10,v0+(v1+v2)<17)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
c3 in [red,yellow]                      : known domain 
     => c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : known domain 



********** no reduction after move 4 **********

