ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,camille).
partie(12,'../parties_joueur/camille/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,3,[c(0,green,7,2.43,non,moins),c(1,blue,4,42.22,non,plus),c(2,red,5,28.37,non,moins),c(3,yellow,4,2.91,non,oui)]),
     coup(2,3,1,[c(0,red,5,6.7,non,moins),c(1,green,7,5.69,oui,plus),c(2,yellow,4,7.57,oui,moins),c(3,blue,4,64.03,non,oui)]),
     coup(3,1,1,[c(0,blue,3,9.84,oui,oui),c(1,green,10,1.83,oui,oui),c(2,yellow,3,3.85,oui,oui),c(3,red,4,51.79,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6] : 

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 max 10

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 max 4

v3 is 4                                 : answer of the system 
     => v3 max 4

[max(v1,10)]
[max(v2,4)]
[max(v3,4)]=> if v0 < 2 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<2,v0+(v1+(v2+v3))<20)]=> v0 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

v1 in [5,6,7,8,9,10]                    : seen 
v2 in [1,2,3,4]                         : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
c1 in [green,red,yellow]                : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]

c1 \= c2                                : intial constraint 
blue meme_rang yellow                   : intial constraint 
[avant(c2,c1)]
[dans(c1,[green,red,yellow])]
[dans(c2,[blue,yellow])]=> c1 in [green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7,8,9,10] : 

v1 in [6,7,8,9,10]                      : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 in [blue,yellow]                     : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

v1 in [5,6,7,8,9,10]                    : seen 
v3 is 4                                 : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
red avant green                         : seen 
c1 in [green,red]                       : seen 
[avant(c3,c1)]
[dans(c3,[blue,green,red])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 is 4                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [blue,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c0 is blue                              : seen 
c2 is yellow                            : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

7 < v1                                  : answer of the system 
v1 in [6,7,8,9,10]                      : known domain 
     => v1 in [8,9,10]

[dans(v1,[8,9,10])]=> v1 max 10

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4]                         : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 max 3

[max(v1,10)]
[max(v2,3)]=> if v0 < 3 then v0 + v1 + v2 < 16

16 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0<3,v0+(v1+v2)<16)]=> v0 in [3,4]

v0 in [3,4]                             : seen 
     => v0 max 4

v1 max 10                               : seen 
[max(v0,4)]=> if v2 < 2 then v0 + v1 + v2 < 16

16 = v0 + v1 + v2                       : seen 
[si_alors(v2<2,v0+(v1+v2)<16)]=> v2 in [2,3]

[v0=v2]
[dans(v0,[3,4])]
[dans(v2,[2,3])]=> v0 is 3
v2 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [3,4]                             : seen 
v2 in [2,3]                             : seen 
     => v0 is 3
v2 is 3

[dans(v0,[3]),dans(v2,[3])]=> v0 max 3

v2 max 3                                : seen 
[max(v0,3)]=> if v1 < 10 then v0 + v1 + v2 < 16

16 = v0 + v1 + v2                       : seen 
[si_alors(v1<10,v0+(v1+v2)<16)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [3,4]                             : seen 
v2 in [2,3]                             : seen 
     => v0 is 3
v2 is 3


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 is 4                                 : known domain 



********** no reduction after move 3 **********

