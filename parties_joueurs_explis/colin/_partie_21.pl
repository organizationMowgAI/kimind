ident(21,'21blue<yellow<red<green0yellow41red62blue23green9').
joueur(21,colin).
partie(21,'../parties_joueur/colin/_partie_21').
somme(21,21).
ordre_couleurs(21,[blue,<,yellow,<,red,<,green]).
solution(21,[c(0,yellow,4),c(1,red,6),c(2,blue,2),c(3,green,9)]).
nb_solutions(21,384).
cartes_jouees(21,
   [
     coup(1,384,4,[c(0,yellow,5,3.01,oui,moins),c(1,red,6,2.76,oui,oui),c(2,green,7,2.33,non,moins),c(3,blue,3,19.52,non,plus)]),
     coup(2,4,1,[c(0,yellow,4,17.16,oui,oui),c(2,blue,2,6.66,oui,oui),c(3,green,9,3.65,oui,oui)])
   ]
            ).
resultat(21,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,red]

c1 \= c2                                : intial constraint 
c1 is red                               : answer of the system 
[dans(c2,[blue,red])]=> c2 is blue

blue avant yellow                       : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 < 5                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4]

v2 < 7                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6]

[v2<v0]
[dans(v0,[1,2,3,4])]
[dans(v2,[1,2,3,4,5,6])]=> v0 in [2,3,4]
v2 in [1,2,3]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3] : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : seen 
v2 in [1,2,3,4,5,6]                     : seen 
     => v0 in [2,3,4]
v2 in [1,2,3]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[green,red])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : seen 
v2 in [1,2,3,4,5,6]                     : seen 
     => v0 in [2,3,4]
v2 in [1,2,3]

[dans(v0,[2,3,4]),dans(v2,[1,2,3])]=> v0 max 4

v1 is 6                                 : seen 
     => v1 max 6

v2 < v0                                 : connu_simplification_equivalence 
v0 in [1,2,3,4]                         : seen 
v2 in [1,2,3,4,5,6]                     : seen 
     => v0 in [2,3,4]
v2 in [1,2,3]

[dans(v0,[2,3,4]),dans(v2,[1,2,3])]=> v2 max 3

[max(v0,4)]
[max(v1,6)]
[max(v2,3)]=> if v3 < 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<8,v0+(v1+(v2+v3))<21)]=> v3 in [8,9,10]



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


