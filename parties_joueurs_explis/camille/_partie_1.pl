ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,camille).
partie(1,'../parties_joueur/camille/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,2,[c(0,red,10,5.16,oui,oui),c(1,green,6,66.74,non,plus),c(2,blue,9,6.18,non,moins),c(3,yellow,7,58.66,non,moins)]),
     coup(2,2,1,[c(1,blue,9,3.06,oui,oui),c(2,yellow,7,14.67,oui,oui),c(3,green,6,55.8,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

6 < v1                                  : answer of the system 
v1 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v1 in [7,8,9,10]

v3 < 7                                  : answer of the system 
v3 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v3 in [2,3,4,5,6]

[dans(v1,[7,8,9,10])]
[dans(v3,[2,3,4,5,6])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c1 \= c3                                : intial constraint 
yellow avant blue                       : intial constraint 
c1 in [blue,yellow]                     : seen 
[avant(c3,c1)]
[dans(c3,[blue,green])]=> c3 is green

c2 \= c3                                : intial constraint 
[dans(c2,[green,yellow])]
[dans(c3,[green])]=> c2 is yellow

c1 \= c2                                : intial constraint 
[dans(c1,[blue,yellow])]
[dans(c2,[yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9] : 

c0 is red                               : seen 
c1 in [blue,yellow]                     : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

v0 is 10                                : seen 
v1 in [8,9,10]                          : seen 
[v1<v0]=> v1 in [8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [7,8] : 

v1 in [8,9]                             : seen 
     => v1 max 9

v0 max 10                               : seen 
v3 max 6                                : seen 
[max(v1,9)]=> if v2 < 7 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<7,v0+(v1+(v2+v3))<32)]=> v2 in [7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6] : 

v0 max 10                               : seen 
v1 max 9                                : seen 
v2 max 8                                : seen 
     => if v3 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<32)]=> v3 in [5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 is 6                                 : answer of the system 


