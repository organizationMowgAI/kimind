ident(25,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(25,veronique).
partie(25,'../parties_joueur/veronique/_partie_25').
somme(25,20).
ordre_couleurs(25,[blue,<,yellow,=,red,<,green]).
solution(25,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(25,168).
cartes_jouees(25,
   [
     coup(1,168,4,[c(0,blue,3,7.67,non,plus),c(1,yellow,5,4.6,oui,oui),c(2,red,5,2.53,oui,oui),c(3,green,7,3.18,non,moins)]),
     coup(2,4,1,[c(0,green,7,43.78,oui,oui),c(3,blue,3,3.06,oui,oui)])
   ]
            ).
resultat(25,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

yellow avant green                      : intial constraint 
c0 is green                             : seen 
c1 is yellow                            : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

v1 is 5                                 : answer of the system 
     => v1 min 5

v2 is 5                                 : answer of the system 
     => v2 min 5

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 min 1

[min(v1,5)]
[min(v2,5)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<20)]=> v0 in [4,5,6,7,8,9]

v1 is 5                                 : seen 
[v1<v0]
[dans(v0,[4,5,6,7,8,9])]=> v0 in [6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v0 in [6,7,8,9]                         : seen 
     => v0 min 6

v1 min 5                                : connu_min 
v2 min 5                                : connu_min 
[min(v0,6)]=> if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


