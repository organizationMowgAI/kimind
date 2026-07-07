ident(21,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(21,veronique).
partie(21,'../parties_joueur/veronique/_partie_21').
somme(21,34).
ordre_couleurs(21,[blue,<,red,<,green,<,yellow]).
solution(21,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(21,24).
cartes_jouees(21,
   [
     coup(1,24,1,[c(0,blue,7,9.76,oui,oui),c(1,green,9,3.98,non,moins),c(2,red,8,5.05,non,plus),c(3,yellow,10,5.75,oui,oui)]),
     coup(2,1,1,[c(1,red,8,14.34,oui,oui),c(2,green,9,4.79,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c1 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c1,[red,yellow])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

blue avant red                          : intial constraint 
c0 is blue                              : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 is 7                                 : seen 
     => v0 max 7

8 < v2                                  : answer of the system 
v2 in [4,5,6,7,8,9,10]                  : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 max 10

v3 is 10                                : answer of the system 
     => v3 max 10

[max(v0,7)]
[max(v2,10)]
[max(v3,10)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<7,v0+(v1+(v2+v3))<34)]=> v1 in [7,8]

v0 is 7                                 : seen 
[v0<v1]
[dans(v1,[7,8])]=> v1 is 8


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c2 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v0 is 7                                 : seen 
     => v0 min 7

v1 is 8                                 : seen 
     => v1 min 8

v3 is 10                                : seen 
     => v3 min 10

[min(v0,7)]
[min(v1,8)]
[min(v3,10)]=> if v2 > 9 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>9,v0+(v1+(v2+v3))<34)]=> v2 is 9


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

