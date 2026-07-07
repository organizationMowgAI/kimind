ident(20,'34blue<red<green<yellow0blue71red82green93yellow10').
joueur(20,camille).
partie(20,'../parties_joueur/camille/_partie_20').
somme(20,34).
ordre_couleurs(20,[blue,<,red,<,green,<,yellow]).
solution(20,[c(0,blue,7),c(1,red,8),c(2,green,9),c(3,yellow,10)]).
nb_solutions(20,24).
cartes_jouees(20,
   [
     coup(1,24,1,[c(0,red,8,2.39,non,moins),c(1,blue,7,32.08,non,plus),c(2,green,9,2.8,oui,oui),c(3,yellow,10,2.28,oui,oui)]),
     coup(2,1,1,[c(0,blue,7,6.79,oui,oui),c(1,red,8,2.46,oui,oui)])
   ]
            ).
resultat(20,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c1 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c1,[red,yellow])]=> c1 is red

red avant green                         : intial constraint 
c2 is green                             : seen 
[dans(c1,[red])]=> c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

7 < v1                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [8,9,10]

v2 is 9                                 : answer of the system 
[v1<v2]
[dans(v1,[8,9,10])]=> v1 is 8

[dans(v1,[8])]=> v1 max 8

v2 is 9                                 : seen 
     => v2 max 9

v3 is 10                                : answer of the system 
     => v3 max 10

[max(v1,8)]
[max(v2,9)]
[max(v3,10)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 34

34 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<34)]=> v0 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

