ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,nouredine).
partie(18,'../parties_joueur/nouredine/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,10,[c(0,green,1,47.68,non,plus),c(1,red,3,4.62,non,plus),c(2,yellow,6,3.06,non,moins),c(3,blue,6,3.91,non,moins)]),
     coup(2,10,1,[c(0,blue,6,37.19,non,moins),c(1,yellow,6,5.54,non,moins),c(2,red,3,4.07,oui,plus),c(3,green,1,2.9,oui,plus)]),
     coup(3,1,1,[c(0,yellow,5,19.28,oui,oui),c(1,blue,5,3.54,oui,oui),c(2,red,4,3.02,oui,oui),c(3,green,2,3.7,oui,oui)])
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

the value (v0) of the card in position 0 is in [2,3,4,5,6,7,8,9,10] : 

1 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [2,3,4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7,8,9,10] : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green,red] : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5] : 

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5] : 

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

red avant yellow                        : intial constraint 
c0 is yellow                            : seen 
c2 is red                               : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

c1 \= yellow                            : answer of the system 
c1 in [blue,green,yellow]               : known domain 
     => c1 in [blue,green]

c1 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c1,[blue,green])]=> c1 is blue

c0 is yellow                            : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c1,[blue])]=> c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 < 6                                  : answer of the system 
v0 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v0 in [2,3,4,5]

v1 < 6                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [4,5]

[v0=v1]
[dans(v0,[2,3,4,5])]
[dans(v1,[4,5])]=> v0 in [4,5]

3 < v2                                  : answer of the system 
v2 in [1,2,3,4,5]                       : known domain 
     => v2 in [4,5]

[v2<v0]
[dans(v0,[4,5])]
[dans(v2,[4,5])]=> v0 is 5
v2 is 4


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4

v0 = v1                                 : connu_simplification_equivalence 
[dans(v0,[5]),dans(v2,[4])]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4

[dans(v0,[5]),dans(v2,[4])]=> v0 min 5

v1 is 5                                 : seen 
     => v1 min 5

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4

[dans(v0,[5]),dans(v2,[4])]=> v2 min 4

[min(v0,5)]
[min(v1,5)]
[min(v2,4)]=> if v3 > 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>2,v0+(v1+(v2+v3))<16)]=> v3 is 2



********** no reduction after move 3 **********

