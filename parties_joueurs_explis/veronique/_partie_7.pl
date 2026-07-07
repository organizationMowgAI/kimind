ident(7,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(7,veronique).
partie(7,'../parties_joueur/veronique/_partie_7').
somme(7,21).
ordre_couleurs(7,[yellow,<,red,<,green,=,blue]).
solution(7,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(7,168).
cartes_jouees(7,
   [
     coup(1,168,2,[c(0,red,5,51.45,non,moins),c(1,yellow,2,8.2,non,plus),c(2,green,7,6.43,oui,plus),c(3,blue,7,4.68,oui,plus)]),
     coup(2,2,1,[c(0,yellow,2,46.35,oui,oui),c(1,red,3,15.04,oui,oui),c(2,green,8,29.43,oui,oui),c(3,blue,8,2.36,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,yellow]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2] : 

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [3,4,5,6,7,8,9,10]

[dans(v1,[3,4,5,6,7,8,9,10])]=> v1 min 3

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 min 8

[min(v1,3)]
[min(v2,8)]
[min(v3,8)]=> if v0 > 2 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>2,v0+(v1+(v2+v3))<21)]=> v0 in [1,2]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4] : 

v0 in [1,2]                             : connu_somme_trop_grande 
     => v0 min 1

v2 min 8                                : connu_min 
v3 min 8                                : connu_min 
[min(v0,1)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>4,v0+(v1+(v2+v3))<21)]=> v1 in [3,4]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

v0 min 1                                : connu_min 
v1 min 3                                : connu_min 
v3 min 8                                : connu_min 
     => if v2 > 9 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>9,v0+(v1+(v2+v3))<21)]=> v2 in [8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9] : 

v0 min 1                                : connu_min 
v1 min 3                                : connu_min 
v2 min 8                                : connu_min 
     => if v3 > 9 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>9,v0+(v1+(v2+v3))<21)]=> v3 in [8,9]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v1 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


