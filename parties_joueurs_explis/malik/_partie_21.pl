ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,malik).
partie(21,'../parties_joueur/malik/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,12,[c(0,red,6,3.87,non,moins),c(1,yellow,5,15.69,non,plus),c(2,blue,3,20.49,oui,moins),c(3,green,7,20.07,oui,plus)]),
     coup(2,12,1,[c(0,yellow,4,7.79,oui,oui),c(1,red,7,9.43,oui,moins),c(2,blue,1,5.67,oui,plus),c(3,green,9,191.67,oui,oui)]),
     coup(3,1,1,[c(1,red,6,4.85,oui,oui),c(2,blue,2,33.83,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

blue avant yellow                       : intial constraint 
c0 is yellow                            : seen 
c2 is blue                              : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 < 6                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5]

v2 < 3                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2]

[v2<v0]
[dans(v0,[1,2,3,4,5])]
[dans(v2,[1,2])]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9] : 

red avant green                         : intial constraint 
c1 is red                               : seen 
c3 is green                             : seen 
     => c1 avant c3

c1 avant c3 <=> v1 < v3                 : intial constraint 
[avant(c1,c3)]=> v1 < v3

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[v1<v3]
[dans(v1,[6,7,8,9,10])]
[dans(v3,[8,9,10])]=> v1 in [6,7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v2 in [1,2]                             : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v3 in [8,9,10]                          : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 < 7                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 > 1                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


********** no reduction after move 3 **********

