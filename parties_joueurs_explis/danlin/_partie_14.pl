ident(14,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(14,danlin).
partie(14,'../parties_joueur/danlin/_partie_14').
somme(14,24).
ordre_couleurs(14,[yellow,<,red,<,blue,<,green]).
solution(14,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(14,384).
cartes_jouees(14,
   [
     coup(1,384,7,[c(0,green,9,29.23,non,moins),c(1,red,5,4.87,oui,oui),c(2,blue,7,2.29,non,plus),c(3,yellow,3,2.75,non,plus)]),
     coup(2,7,1,[c(0,yellow,3,24.74,oui,oui),c(2,green,9,36.14,oui,oui),c(3,blue,7,5.85,oui,oui)])
   ]
            ).
resultat(14,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]

v1 is 5                                 : answer of the system 
     => v1 min 5

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

3 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [4,5,6,7,8,9,10]

[dans(v3,[4,5,6,7,8,9,10])]=> v3 min 4

[min(v1,5)]
[min(v2,8)]
[min(v3,4)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<24)]=> v0 in [1,2,3,4,5,6,7]

v2 in [8,9,10]                          : seen 
[dans(v0,[1,2,3,4,5,6,7])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
c0 in [blue,yellow]                     : seen 
[avant(c0,c2)]
[dans(c2,[green,yellow])]=> c2 is green

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c2 \= c3                                : intial constraint 
[dans(c2,[green])]
[dans(c3,[blue,green])]=> c3 is blue

c0 \= c3                                : intial constraint 
[dans(c0,[blue,yellow])]
[dans(c3,[blue])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4] : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

c1 is red                               : seen 
c3 in [blue,green]                      : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

v1 is 5                                 : seen 
v3 in [4,5,6,7,8,9,10]                  : seen 
[v1<v3]=> v3 in [6,7,8,9,10]

[dans(v3,[6,7,8,9,10])]=> v3 min 6

v1 min 5                                : connu_min 
v2 min 8                                : connu_min 
[min(v3,6)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>5,v0+(v1+(v2+v3))<24)]=> v0 in [1,2,3,4,5]

v1 is 5                                 : seen 
[v0<v1]
[dans(v0,[1,2,3,4,5])]=> v0 in [1,2,3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8,9] : 

blue avant green                        : intial constraint 
c2 is green                             : seen 
c3 is blue                              : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 in [8,9,10]                          : seen 
v3 in [6,7,8,9,10]                      : seen 
[v3<v2]=> v3 in [6,7,8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


