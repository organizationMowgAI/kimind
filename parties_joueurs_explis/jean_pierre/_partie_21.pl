ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,jean_pierre).
partie(21,'../parties_joueur/jean_pierre/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,2,[c(0,blue,4,2.59,non,oui),c(1,yellow,5,3.09,non,plus),c(2,red,6,11.85,non,moins),c(3,green,9,41.0,oui,oui)]),
     coup(2,2,1,[c(0,yellow,4,42.15,oui,oui),c(1,red,6,51.94,oui,oui),c(2,blue,1,4.55,oui,plus)]),
     coup(3,1,1,[c(2,blue,2,11.81,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

v0 is 4                                 : answer of the system 
[dans(v1,[6,7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

c0 \= c1                                : intial constraint 
blue avant red                          : intial constraint 
[avant(c0,c1)]
[dans(c0,[red,yellow])]
[dans(c1,[blue,red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 4 : 

v0 is 4                                 : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c0 \= c1                                : seen 
blue avant yellow                       : intial constraint 
c0 avant c1                             : connu_simplification_equivalence 
c0 is yellow                            : seen 
c1 in [blue,red]                        : seen 
     => c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7] : 

v1 in [6,7]                             : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,yellow])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2] : 

v1 in [6,7]                             : connu_somme_trop_grande 
     => v1 min 6

v0 min 4                                : connu_min 
v3 min 9                                : connu_min 
[min(v1,6)]=> if v2 > 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>2,v0+(v1+(v2+v3))<21)]=> v2 in [1,2]


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

v2 > 1                                  : answer of the system 



********** no reduction after move 3 **********

