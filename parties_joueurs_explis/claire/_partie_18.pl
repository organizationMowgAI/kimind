ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,claire).
partie(18,'../parties_joueur/claire/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,8,[c(0,red,4,95.35,non,plus),c(1,green,2,3.06,non,plus),c(2,blue,5,4.68,non,moins),c(3,yellow,5,4.97,non,moins)]),
     coup(2,8,1,[c(0,blue,5,7.67,non,oui),c(1,yellow,5,3.11,non,oui),c(2,green,2,9.47,non,plus),c(3,red,4,2.32,non,moins)]),
     coup(3,1,1,[c(0,yellow,5,3.76,oui,oui),c(1,blue,5,1.66,oui,oui),c(2,red,4,3.76,oui,oui),c(3,green,2,2.72,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v0,[5,6,7,8,9,10])]
[dans(v2,[1,2,3,4])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
green avant yellow                      : intial constraint 
c0 in [blue,green,yellow]               : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c0 \= c2                                : intial constraint 
green avant red                         : intial constraint 
[avant(c2,c0)]
[dans(c0,[blue,green,yellow])]
[dans(c2,[green,red])]=> c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [5,6,7,8,9,10] : 

v0 in [5,6,7,8,9,10]                    : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red,yellow] : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [3,4,5,6,7,8,9] : 

v0 in [5,6,7,8,9,10]                    : seen 
     => v0 min 5

v2 in [1,2,3,4]                         : seen 
     => v2 min 1

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

[min(v0,5)]
[min(v2,1)]
[min(v3,1)]=> if v1 > 9 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>9,v0+(v1+(v2+v3))<16)]=> v1 in [3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 in [green,red]                       : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

v0 in [5,6,7,8,9,10]                    : seen 
v3 in [1,2,3,4]                         : seen 
     => v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 in [blue,yellow]                     : seen 
blue meme_rang yellow                   : seen 
[avant(c3,c0)]
[dans(c3,[blue,green,red])]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,red,yellow]                 : known domain 
     => c1 in [blue,red]

c1 \= c2                                : intial constraint 
c2 \= green                             : answer of the system 
[dans(c1,[blue,red])]=> c1 is blue


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


