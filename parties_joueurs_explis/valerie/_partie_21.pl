ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,valerie).
partie(21,'../parties_joueur/valerie/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,3,[c(0,yellow,4,183.1,oui,oui),c(1,blue,2,60.12,non,plus),c(2,red,6,9.87,non,moins),c(3,green,9,7.99,oui,oui)]),
     coup(2,3,1,[c(1,red,6,13.12,oui,oui),c(2,blue,2,3.21,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c1,[green,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7] : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 is 4                                 : seen 
     => v0 min 4

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 min 1

v3 is 9                                 : answer of the system 
     => v3 min 9

[min(v0,4)]
[min(v2,1)]
[min(v3,9)]=> if v1 > 7 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>7,v0+(v1+(v2+v3))<21)]=> v1 in [3,4,5,6,7]

v0 is 4                                 : seen 
[v0<v1]
[dans(v1,[3,4,5,6,7])]=> v1 in [5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3] : 

v1 in [5,6,7]                           : seen 
     => v1 min 5

v0 min 4                                : connu_min 
v3 min 9                                : connu_min 
[min(v1,5)]=> if v2 > 3 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>3,v0+(v1+(v2+v3))<21)]=> v2 in [1,2,3]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 


