ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,ouwais).
partie(5,'../parties_joueur/ouwais/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,2,[c(0,red,7,40.42,non,moins),c(1,yellow,9,8.06,oui,moins),c(2,blue,1,17.79,non,plus),c(3,green,7,8.0,non,moins)]),
     coup(2,2,1,[c(0,blue,2,71.6,non,oui),c(1,yellow,3,1.18,oui,plus),c(2,red,2,8.19,oui,oui),c(3,green,3,6.91,non,moins)]),
     coup(3,1,1,[c(0,green,2,37.89,oui,oui),c(1,yellow,5,8.58,oui,oui),c(3,blue,1,19.51,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is yellow                            : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c1 is yellow                            : seen 
[dans(c2,[green,red])]=> c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

c0 in [blue,green]                      : seen 
c1 is yellow                            : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 < 7                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [1,2,3,4,5,6]

v0 in [1,2,3,4,5,6]                     : seen 
     => v0 min 1

1 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [2,3,4,5,6,7]

[dans(v2,[2,3,4,5,6,7])]=> v2 min 2

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 min 1

[min(v0,1)]
[min(v2,2)]
[min(v3,1)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>6,v0+(v1+(v2+v3))<10)]=> v1 in [1,2,3,4,5,6]

[v0<v1]
[dans(v0,[1,2,3,4,5,6])]
[dans(v1,[1,2,3,4,5,6])]=> v0 in [1,2,3,4,5]
v1 in [2,3,4,5,6]

v0 < v1                                 : connu_simplification_equivalence 
v0 in [1,2,3,4,5,6]                     : seen 
v1 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
     => v0 in [1,2,3,4,5]
v1 in [2,3,4,5,6]

[dans(v0,[1,2,3,4,5]),dans(v1,[2,3,4,5,6])]=> v1 min 2

v0 min 1                                : connu_min 
v3 min 1                                : connu_min 
[min(v1,2)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<10)]=> v2 in [2,3,4,5,6]

[v2<v1]
[dans(v0,[1,2,3,4,5]),dans(v1,[2,3,4,5,6])]
[dans(v2,[2,3,4,5,6])]=> v1 in [3,4,5,6]
v2 in [2,3,4,5]

[dans(v1,[3,4,5,6]),dans(v2,[2,3,4,5])]=> v1 min 3

v2 min 2                                : connu_min 
v3 min 1                                : connu_min 
[min(v1,3)]=> if v0 > 4 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>4,v0+(v1+(v2+v3))<10)]=> v0 in [1,2,3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [1,2,3,4,5,6]                     : seen 
v1 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
     => v0 in [1,2,3,4,5]
v1 in [2,3,4,5,6]

v2 < v1                                 : connu_simplification_equivalence 
v2 in [2,3,4,5,6]                       : connu_somme_trop_grande 
[dans(v0,[1,2,3,4,5]),dans(v1,[2,3,4,5,6])]=> v1 in [3,4,5,6]
v2 in [2,3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 in [green,red]                       : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5] : 

v0 < v1                                 : connu_simplification_equivalence 
v0 in [1,2,3,4,5,6]                     : seen 
v1 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
     => v0 in [1,2,3,4,5]
v1 in [2,3,4,5,6]

v2 < v1                                 : connu_simplification_equivalence 
v2 in [2,3,4,5,6]                       : connu_somme_trop_grande 
[dans(v0,[1,2,3,4,5]),dans(v1,[2,3,4,5,6])]=> v1 in [3,4,5,6]
v2 in [2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v0 min 1                                : connu_min 
v1 min 3                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 4 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<10)]=> v3 in [1,2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

v2 is 2                                 : answer of the system 
     => v2 max 2

c2 \= c3                                : intial constraint 
c2 is red                               : answer of the system 
c3 in [blue,red]                        : known domain 
     => c3 is blue

blue avant green                        : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4]                         : known domain 
     => v3 in [1,2]

v0 is 2                                 : seen 
[v3<v0]
[dans(v3,[1,2])]=> v3 is 1

[dans(v3,[1])]=> v3 max 1

[max(v0,2)]
[max(v2,2)]
[max(v3,1)]=> if v1 < 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<5,v0+(v1+(v2+v3))<10)]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 3 **********

