ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,junkang).
partie(18,'../parties_joueur/junkang/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,8,[c(0,green,2,2.61,non,plus),c(1,red,4,6.81,non,plus),c(2,yellow,5,3.27,non,moins),c(3,blue,5,10.64,non,moins)]),
     coup(2,8,1,[c(0,blue,5,19.2,non,oui),c(1,yellow,5,2.38,non,oui),c(2,green,2,8.16,non,plus),c(3,red,4,2.68,non,moins)]),
     coup(3,1,1,[c(0,yellow,5,10.11,oui,oui),c(1,blue,5,1.59,oui,oui),c(2,red,4,25.32,oui,oui),c(3,green,2,5.94,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7,8,9] : 

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 min 1

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

[min(v1,5)]
[min(v2,1)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<16)]=> v0 in [3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,yellow] : 

v1 in [5,6,7,8,9,10]                    : seen 
v2 in [1,2,3,4]                         : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
green avant blue                        : intial constraint 
c1 in [blue,green,yellow]               : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[blue,green,red])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
green avant red                         : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,green,yellow])]
[dans(c2,[green,red])]=> c1 in [blue,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8,9,10] : 

v1 in [5,6,7,8,9,10]                    : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 in [green,red]                       : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

v1 in [5,6,7,8,9,10]                    : seen 
v3 in [1,2,3,4]                         : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 in [blue,yellow]                     : seen 
blue meme_rang yellow                   : seen 
[avant(c3,c1)]
[dans(c3,[green,red,yellow])]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 \= green                             : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4] : 

2 < v2                                  : answer of the system 
v2 in [1,2,3,4]                         : known domain 
     => v2 in [3,4]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= red                               : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3] : 

v0 is 5                                 : seen 
     => v0 max 5

v1 is 5                                 : seen 
     => v1 max 5

v2 in [3,4]                             : seen 
     => v2 max 4

[max(v0,5)]
[max(v1,5)]
[max(v2,4)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<2,v0+(v1+(v2+v3))<16)]=> v3 in [2,3]



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : answer of the system 


