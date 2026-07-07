ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,malik).
partie(24,'../parties_joueur/malik/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,1,[c(0,yellow,4,2.98,non,plus),c(1,green,9,127.51,non,moins),c(2,red,4,5.27,oui,plus),c(3,blue,3,5.04,oui,oui)]),
     coup(2,1,1,[c(0,green,7,8.76,oui,oui),c(1,yellow,5,5.31,oui,oui),c(2,red,5,88.1,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [blue,green]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,green])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,yellow])]=> c1 is yellow

yellow avant green                      : intial constraint 
c0 is green                             : seen 
[dans(c1,[yellow])]=> c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

c1 is yellow                            : seen 
c2 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]

[dans(v0,[5,6,7,8,9,10])]=> v0 min 5

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]

[dans(v2,[5,6,7,8,9,10])]=> v2 min 5

v3 is 3                                 : answer of the system 
     => v3 min 3

[min(v0,5)]
[min(v2,5)]
[min(v3,3)]=> if v1 > 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>7,v0+(v1+(v2+v3))<20)]=> v1 in [1,2,3,4,5,6,7]

v2 in [5,6,7,8,9,10]                    : seen 
[v1=v2]
[dans(v1,[1,2,3,4,5,6,7])]=> v1 in [5,6,7]
v2 in [5,6,7]

[dans(v1,[5,6,7]),dans(v2,[5,6,7])]=> v1 min 5

v2 min 5                                : connu_min 
v3 min 3                                : connu_min 
[min(v1,5)]=> if v0 > 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>7,v0+(v1+(v2+v3))<20)]=> v0 in [5,6,7]

v1 = v2                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5,6,7]                   : connu_somme_trop_grande 
v2 in [5,6,7,8,9,10]                    : seen 
     => v1 in [5,6,7]
v2 in [5,6,7]

[v1<v0]
[dans(v0,[5,6,7])]
[dans(v1,[5,6,7]),dans(v2,[5,6,7])]=> v0 in [6,7]
v1 in [5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6] : 

v1 = v2                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5,6,7]                   : connu_somme_trop_grande 
v2 in [5,6,7,8,9,10]                    : seen 
     => v1 in [5,6,7]
v2 in [5,6,7]

v1 < v0                                 : connu_simplification_equivalence 
v0 in [5,6,7]                           : connu_somme_trop_grande 
[dans(v1,[5,6,7]),dans(v2,[5,6,7])]=> v0 in [6,7]
v1 in [5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6] : 

v1 = v2                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5,6,7]                   : connu_somme_trop_grande 
v2 in [5,6,7,8,9,10]                    : seen 
     => v1 in [5,6,7]
v2 in [5,6,7]

v1 < v0                                 : connu_simplification_equivalence 
v0 in [5,6,7]                           : connu_somme_trop_grande 
[dans(v1,[5,6,7]),dans(v2,[5,6,7])]=> v0 in [6,7]
v1 in [5,6]

v1 = v2                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5,6,7]                   : connu_somme_trop_grande 
v2 in [5,6,7,8,9,10]                    : seen 
     => v1 in [5,6,7]
v2 in [5,6,7]

v1 = v2                                 : connu_simplification_equivalence 
[dans(v0,[6,7]),dans(v1,[5,6])]
[dans(v1,[5,6,7]),dans(v2,[5,6,7])]=> v2 in [5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 


