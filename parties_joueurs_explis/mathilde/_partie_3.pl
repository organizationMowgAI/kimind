ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,mathilde).
partie(3,'../parties_joueur/mathilde/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,6,[c(0,yellow,1,4.26,oui,plus),c(1,red,1,5.13,non,plus),c(2,blue,8,3.83,oui,moins),c(3,green,10,18.72,non,moins)]),
     coup(2,6,1,[c(0,yellow,2,3.27,oui,plus),c(1,green,10,23.21,oui,oui),c(2,blue,6,11.68,oui,moins),c(3,red,2,3.58,oui,plus)]),
     coup(3,1,1,[c(0,yellow,3,2.1,oui,oui),c(2,blue,4,15.69,oui,oui),c(3,red,3,3.58,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6] : 

yellow avant blue                       : intial constraint 
c0 is yellow                            : seen 
c2 is blue                              : answer of the system 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red

c0 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [2,3,4,5,6,7,8,9,10]

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[v0=v3]
[dans(v0,[2,3,4,5,6,7,8,9,10])]
[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6,7]

[v0<v2]
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]
[dans(v2,[1,2,3,4,5,6,7])]=> v0 in [2,3,4,5,6]
v2 in [3,4,5,6,7]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

blue avant green                        : intial constraint 
c1 is green                             : seen 
c2 is blue                              : seen 
     => c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

yellow avant green                      : intial constraint 
c0 is yellow                            : seen 
c1 is green                             : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 = v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [2,3,4,5,6,7,8,9,10]

[v0<v1]
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]
[dans(v1,[2,3,4,5,6,7,8,9,10])]=> v1 in [3,4,5,6,7,8,9,10]

v0 = v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

v0 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7]                   : seen 
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]=> v0 in [2,3,4,5,6]
v2 in [3,4,5,6,7]

[v2<v1]
[dans(v1,[3,4,5,6,7,8,9,10])]
[dans(v0,[2,3,4,5,6]),dans(v2,[3,4,5,6,7])]=> v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7] : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

v0 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7]                   : seen 
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]=> v0 in [2,3,4,5,6]
v2 in [3,4,5,6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

v0 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5,6,7]                   : seen 
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]=> v0 in [2,3,4,5,6]
v2 in [3,4,5,6,7]

v0 = v3                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9,10]              : seen 
v3 in [1,2,3,4,5,6,7,8,9]               : seen 
     => v0 in [2,3,4,5,6,7,8,9]
v3 in [2,3,4,5,6,7,8,9]

v0 = v3                                 : connu_simplification_equivalence 
[dans(v0,[2,3,4,5,6]),dans(v2,[3,4,5,6,7])]
[dans(v0,[2,3,4,5,6,7,8,9]),dans(v3,[2,3,4,5,6,7,8,9])]=> v3 in [2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v1 is 10                                : answer of the system 
     => v1 min 10

2 < v0                                  : answer of the system 
v0 in [2,3,4,5,6]                       : known domain 
     => v0 in [3,4,5,6]

v2 < 6                                  : answer of the system 
v2 in [3,4,5,6,7]                       : known domain 
     => v2 in [3,4,5]

v0 < v2                                 : intial constraint 
[dans(v0,[3,4,5,6])]
[dans(v2,[3,4,5])]=> v0 in [3,4]
v2 in [4,5]

[dans(v0,[3,4]),dans(v2,[4,5])]=> v2 min 4

v0 < v2                                 : seen 
v0 in [3,4,5,6]                         : seen 
v2 in [3,4,5]                           : seen 
     => v0 in [3,4]
v2 in [4,5]

2 < v3                                  : answer of the system 
v3 in [2,3,4,5,6]                       : known domain 
     => v3 in [3,4,5,6]

v0 = v3                                 : intial constraint 
[dans(v0,[3,4]),dans(v2,[4,5])]
[dans(v3,[3,4,5,6])]=> v3 in [3,4]

[dans(v3,[3,4])]=> v3 min 3

[min(v1,10)]
[min(v2,4)]
[min(v3,3)]=> if v0 > 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>3,v0+(v1+(v2+v3))<20)]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v0 is 3                                 : connu_somme_trop_grande 
     => v0 min 3

v1 min 10                               : connu_min 
v3 min 3                                : connu_min 
[min(v0,3)]=> if v2 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>4,v0+(v1+(v2+v3))<20)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v0 min 3                                : connu_min 
v1 min 10                               : connu_min 
v2 min 4                                : connu_min 
     => if v3 > 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>3,v0+(v1+(v2+v3))<20)]=> v3 is 3



********** no reduction after move 3 **********

