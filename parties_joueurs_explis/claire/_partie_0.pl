ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,claire).
partie(0,'../parties_joueur/claire/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,1,[c(0,green,10,4.69,non,moins),c(1,red,9,28.55,non,oui),c(2,yellow,7,6.09,non,plus),c(3,blue,9,4.35,non,moins)]),
     coup(2,1,1,[c(0,red,9,31.08,oui,oui),c(1,blue,9,9.36,oui,oui),c(2,green,10,6.63,oui,oui),c(3,yellow,7,11.92,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

v1 is 9                                 : answer of the system 
     => v1 max 9

7 < v2                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 max 10

v3 < 9                                  : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7,8]

[dans(v3,[5,6,7,8])]=> v3 max 8

[max(v1,9)]
[max(v2,10)]
[max(v3,8)]=> if v0 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<8,v0+(v1+(v2+v3))<35)]=> v0 in [8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

v1 is 9                                 : seen 
v3 in [5,6,7,8]                         : seen 
     => v3 < v1

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
yellow avant red                        : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,green,yellow])]
[dans(c3,[red,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v0 max 9                                : seen 
v1 max 9                                : seen 
v3 max 8                                : seen 
     => if v2 < 9 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<9,v0+(v1+(v2+v3))<35)]=> v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c3 in [red,yellow]                      : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8] : 

v3 in [7,8]                             : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


