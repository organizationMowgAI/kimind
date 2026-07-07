ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,camille).
partie(21,'../parties_joueur/camille/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,3,[c(0,blue,3,25.31,non,plus),c(1,red,6,8.62,oui,oui),c(2,yellow,5,7.21,non,moins),c(3,green,8,3.73,oui,plus)]),
     coup(2,3,1,[c(0,yellow,4,10.1,oui,oui),c(2,blue,2,8.5,oui,oui),c(3,green,9,41.05,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5] : 

v1 is 6                                 : answer of the system 
     => v1 min 6

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 min 1

8 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [9,10]

[dans(v3,[9,10])]=> v3 min 9

[min(v1,6)]
[min(v2,1)]
[min(v3,9)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>5,v0+(v1+(v2+v3))<21)]=> v0 in [4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v0 in [4,5]                             : connu_somme_trop_grande 
     => v0 min 4

v1 min 6                                : connu_min 
v3 min 9                                : connu_min 
[min(v0,4)]=> if v2 > 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>2,v0+(v1+(v2+v3))<21)]=> v2 in [1,2]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : answer of the system 


