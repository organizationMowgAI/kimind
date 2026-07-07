ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,david).
partie(8,'../parties_joueur/david/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,15,[c(0,yellow,7,14.37,non,plus),c(1,blue,3,73.34,non,plus),c(2,green,5,14.18,non,plus),c(3,red,9,6.14,non,moins)]),
     coup(2,15,1,[c(0,red,9,174.3,oui,oui),c(1,green,5,7.79,oui,oui),c(2,yellow,7,5.18,oui,oui),c(3,blue,3,5.51,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red] : 

7 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [8,9,10]

v0 in [8,9,10]                          : seen 
     => v0 min 8

5 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [6,7,8,9,10]

[dans(v2,[6,7,8,9,10])]=> v2 min 6

v3 < 9                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8]

[dans(v3,[1,2,3,4,5,6,7,8])]=> v3 min 1

v0 min 8                                : connu_min 
[min(v2,6)]
[min(v3,1)]=> if v1 > 9 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>9,v0+(v1+(v2+v3))<24)]=> v1 in [4,5,6,7,8,9]

[dans(v1,[4,5,6,7,8,9])]=> v1 min 4

v2 min 6                                : connu_min 
[min(v0,8)]
[min(v1,4)]=> if v3 > 6 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>6,v0+(v1+(v2+v3))<24)]=> v3 in [1,2,3,4,5,6]

[dans(v0,[8,9,10])]
[dans(v3,[1,2,3,4,5,6])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
blue avant green                        : intial constraint 
blue avant yellow                       : intial constraint 
[avant(c3,c0)]
[dans(c0,[blue,green,red])]
[dans(c3,[blue,green,yellow])]=> c0 in [green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

v0 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9] : 

v1 in [4,5,6,7,8,9]                     : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7,8,9,10] : 

v2 in [6,7,8,9,10]                      : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,yellow] : 

c3 in [blue,green,yellow]               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6] : 

v3 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


