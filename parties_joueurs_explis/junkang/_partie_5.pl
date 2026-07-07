ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,junkang).
partie(5,'../parties_joueur/junkang/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,1,[c(0,green,2,4.94,oui,oui),c(1,blue,1,28.77,non,plus),c(2,red,2,3.4,oui,oui),c(3,yellow,5,3.62,non,moins)]),
     coup(2,1,1,[c(1,yellow,5,18.25,oui,oui),c(3,blue,1,3.11,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

v2 is 2                                 : answer of the system 
     => v2 max 2

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue

blue avant green                        : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v0 is 2                                 : seen 
     => v0 min 2

green avant yellow                      : intial constraint 
c0 is green                             : seen 
c1 is yellow                            : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v2 is 2                                 : seen 
     => v2 min 2

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

v0 min 2                                : connu_min 
[min(v2,2)]
[min(v3,1)]=> if v1 > 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>5,v0+(v1+(v2+v3))<10)]=> v1 in [2,3,4,5]

v0 is 2                                 : seen 
[v0<v1]
[dans(v1,[2,3,4,5])]=> v1 in [3,4,5]

[dans(v1,[3,4,5])]=> v1 min 3

v2 min 2                                : connu_min 
[min(v0,2)]
[min(v1,3)]=> if v3 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>3,v0+(v1+(v2+v3))<10)]=> v3 in [1,2,3]

v0 is 2                                 : seen 
[v3<v0]
[dans(v3,[1,2,3])]=> v3 is 1

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



********** no reduction after move 2 **********

