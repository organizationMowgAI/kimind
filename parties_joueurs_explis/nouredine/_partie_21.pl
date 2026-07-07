ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,nouredine).
partie(21,'../parties_joueur/nouredine/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,6,[c(0,blue,2,34.55,non,plus),c(1,yellow,4,3.34,non,plus),c(2,red,6,3.65,non,moins),c(3,green,9,3.87,oui,oui)]),
     coup(2,6,1,[c(0,yellow,4,30.22,oui,oui),c(1,red,6,4.05,oui,oui),c(2,blue,2,5.92,oui,oui)])
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

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 min 1

v3 is 9                                 : answer of the system 
     => v3 min 9

[min(v1,5)]
[min(v2,1)]
[min(v3,9)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>6,v0+(v1+(v2+v3))<21)]=> v0 in [3,4,5,6]

[dans(v0,[3,4,5,6])]=> v0 min 3

v2 min 1                                : connu_min 
v3 min 9                                : connu_min 
[min(v0,3)]=> if v1 > 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>8,v0+(v1+(v2+v3))<21)]=> v1 in [5,6,7,8]

v0 min 3                                : connu_min 
v1 min 5                                : connu_min 
v3 min 9                                : connu_min 
     => if v2 > 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>4,v0+(v1+(v2+v3))<21)]=> v2 in [1,2,3,4]

[dans(v1,[5,6,7,8])]
[dans(v2,[1,2,3,4])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

c1 \= c2                                : intial constraint 
blue avant yellow                       : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,red])]
[dans(c2,[blue,yellow])]=> c1 is red

c0 \= c1                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c1,[red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6] : 

v0 in [3,4,5,6]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8] : 

v1 in [5,6,7,8]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
c2 in [blue,yellow]                     : seen 
     => c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : connu_somme_trop_grande 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v3 is 9                                 : seen 



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

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 


