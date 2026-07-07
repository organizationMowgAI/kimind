ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,ouwais).
partie(15,'../parties_joueur/ouwais/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,4,[c(0,yellow,7,4.33,non,plus),c(1,green,8,14.75,non,plus),c(2,blue,9,2.66,non,moins),c(3,red,9,20.61,non,moins)]),
     coup(2,4,1,[c(0,blue,10,3.98,non,oui),c(1,red,10,11.47,non,oui),c(2,green,8,14.74,oui,oui),c(3,yellow,7,1.85,oui,oui)]),
     coup(3,1,1,[c(0,red,10,0.91,oui,oui),c(1,blue,10,4.2,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 in [9,10]

[dans(v1,[9,10])]=> v1 max 10

v2 < 9                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [5,6,7,8]

[dans(v2,[5,6,7,8])]=> v2 max 8

v3 < 9                                  : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7,8]

[dans(v3,[5,6,7,8])]=> v3 max 8

[max(v1,10)]
[max(v2,8)]
[max(v3,8)]=> if v0 < 9 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<9,v0+(v1+(v2+v3))<35)]=> v0 in [9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

v1 in [9,10]                            : seen 
v2 in [5,6,7,8]                         : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

v0 in [9,10]                            : seen 
v2 in [7,8]                             : seen 
     => v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
green avant red                         : intial constraint 
c0 in [blue,green,red]                  : seen 
blue meme_rang red                      : intial constraint 
[avant(c2,c0)]
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
yellow avant green                      : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,red,yellow])]
[dans(c2,[green,yellow])]=> c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v1 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8] : 

v2 in [7,8]                             : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,yellow] : 

v0 max 10                               : seen 
v1 max 10                               : seen 
v2 max 8                                : seen 
     => if v3 < 7 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<7,v0+(v1+(v2+v3))<35)]=> v3 in [7,8]

v0 in [9,10]                            : seen 
[dans(v3,[7,8])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
c0 in [blue,green,red]                  : seen 
blue meme_rang red                      : seen 
[avant(c3,c0)]
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [7,8] : 

v3 in [7,8]                             : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red]                  : known domain 
     => c0 in [green,red]

c0 \= c2                                : intial constraint 
c2 avant c0                             : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


********** no reduction after move 3 **********

