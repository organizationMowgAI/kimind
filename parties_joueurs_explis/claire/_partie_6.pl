ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,claire).
partie(6,'../parties_joueur/claire/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,30,[c(0,blue,7,56.19,non,moins),c(1,green,7,2.97,non,moins),c(2,yellow,2,3.36,non,plus),c(3,red,5,4.27,non,plus)]),
     coup(2,30,2,[c(0,red,5,9.64,non,moins),c(1,yellow,2,2.8,non,plus),c(2,blue,7,5.02,non,plus),c(3,green,7,19.4,non,plus)]),
     coup(3,2,1,[c(0,yellow,2,3.28,oui,oui),c(1,red,3,6.67,oui,oui),c(2,green,8,88.96,oui,oui),c(3,blue,8,3.69,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6] : 

v0 < 7                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5,6] : 

v1 < 7                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8,9,10] : 

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [3,4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9,10] : 

5 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [6,7,8,9,10]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6]                     : known domain 
     => v1 in [3,4,5,6]

[dans(v1,[3,4,5,6])]=> v1 min 3

7 < v2                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

7 < v3                                  : answer of the system 
v3 in [6,7,8,9,10]                      : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 min 8

[min(v1,3)]
[min(v2,8)]
[min(v3,8)]=> if v0 > 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>2,v0+(v1+(v2+v3))<21)]=> v0 in [1,2]

v0 in [1,2]                             : connu_somme_trop_grande 
     => v0 min 1

v2 min 8                                : connu_min 
v3 min 8                                : connu_min 
[min(v0,1)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>4,v0+(v1+(v2+v3))<21)]=> v1 in [3,4]

[dans(v0,[1,2])]
[dans(v1,[3,4])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [green,red,yellow]                : known domain 
     => c0 in [green,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,red,yellow]                 : known domain 
     => c1 in [blue,red]

c0 \= c1                                : intial constraint 
red avant green                         : intial constraint 
blue meme_rang green                    : intial constraint 
[avant(c0,c1)]
[dans(c0,[green,yellow])]
[dans(c1,[blue,red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2] : 

v0 in [1,2]                             : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c3 \= green                             : answer of the system 
c3 in [blue,green,yellow]               : known domain 
     => c3 in [blue,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue

c1 \= c3                                : intial constraint 
c1 in [blue,red]                        : seen 
[dans(c3,[blue])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4] : 

v1 in [3,4]                             : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red]                  : known domain 
     => c2 in [green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

v0 min 1                                : connu_min 
v1 min 3                                : connu_min 
v3 min 8                                : connu_min 
     => if v2 > 9 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>9,v0+(v1+(v2+v3))<21)]=> v2 in [8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9] : 

v0 min 1                                : connu_min 
v1 min 3                                : connu_min 
v2 min 8                                : connu_min 
     => if v3 > 9 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>9,v0+(v1+(v2+v3))<21)]=> v3 in [8,9]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v1 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


