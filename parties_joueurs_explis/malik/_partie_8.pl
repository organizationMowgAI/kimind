ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,malik).
partie(8,'../parties_joueur/malik/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,7,[c(0,red,10,405.15,oui,moins),c(1,yellow,9,20.43,non,moins),c(2,green,4,6.78,non,plus),c(3,blue,1,6.9,oui,plus)]),
     coup(2,7,1,[c(0,red,9,81.02,oui,oui),c(1,green,5,12.81,oui,oui),c(2,yellow,7,6.95,oui,oui),c(3,blue,3,2.16,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c2,[blue,yellow])]=> c2 is yellow

yellow avant red                        : intial constraint 
c0 is red                               : seen 
[dans(c2,[yellow])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,green])]=> c1 is green

green avant red                         : intial constraint 
c0 is red                               : seen 
[dans(c1,[green])]=> c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

v0 < 10                                 : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5,6,7,8,9]

v1 < 9                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6,7,8]

[v1<v0]
[dans(v0,[1,2,3,4,5,6,7,8,9])]
[dans(v1,[1,2,3,4,5,6,7,8])]=> v0 in [2,3,4,5,6,7,8,9]

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]

[v2<v0]
[dans(v0,[2,3,4,5,6,7,8,9])]
[dans(v2,[5,6,7,8,9,10])]=> v0 in [6,7,8,9]
v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7] : 

blue avant green                        : intial constraint 
c1 is green                             : seen 
c3 is blue                              : seen 
     => c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

green avant yellow                      : intial constraint 
c1 is green                             : seen 
c2 is yellow                            : seen 
     => c1 avant c2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[avant(c1,c2)]=> v1 < v2

v2 < v0                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v2 in [5,6,7,8]

v1 in [1,2,3,4,5,6,7,8]                 : seen 
[v1<v2]
[dans(v0,[6,7,8,9]),dans(v2,[5,6,7,8])]=> v1 in [1,2,3,4,5,6,7]

blue avant red                          : intial constraint 
c0 is red                               : seen 
c3 is blue                              : seen 
     => c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v2 < v0                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v2 in [5,6,7,8]

1 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [2,3,4,5,6,7,8,9,10]

[v3<v0]
[dans(v0,[6,7,8,9]),dans(v2,[5,6,7,8])]
[dans(v3,[2,3,4,5,6,7,8,9,10])]=> v3 in [2,3,4,5,6,7,8]

[v3<v1]
[dans(v1,[1,2,3,4,5,6,7])]
[dans(v3,[2,3,4,5,6,7,8])]=> v1 in [3,4,5,6,7]
v3 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [2,3,4,5,6,7,8,9]                 : seen 
v2 in [5,6,7,8,9,10]                    : seen 
     => v0 in [6,7,8,9]
v2 in [5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v3 < v1                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5,6,7]                   : seen 
v3 in [2,3,4,5,6,7,8]                   : seen 
     => v1 in [3,4,5,6,7]
v3 in [2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : answer of the system 


