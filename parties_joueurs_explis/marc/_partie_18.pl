ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,marc).
partie(18,'../parties_joueur/marc/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,10,[c(0,green,1,127.82,non,plus),c(1,red,3,2.54,non,plus),c(2,yellow,6,4.91,non,moins),c(3,blue,6,2.29,non,moins)]),
     coup(2,10,1,[c(0,yellow,6,6.69,oui,moins),c(1,blue,6,2.25,oui,moins),c(2,green,1,2.27,non,plus),c(3,red,3,1.97,non,moins)]),
     coup(3,1,1,[c(0,yellow,5,20.95,oui,oui),c(1,blue,5,1.23,oui,oui),c(2,red,4,4.86,oui,oui),c(3,green,2,9.58,oui,oui)])
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

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red]                  : known domain 
     => c2 in [blue,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c2,[blue,red])]=> c2 is red

red avant yellow                        : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[red])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v1 < 6                                  : answer of the system 
v1 in [4,5,6,7,8,9,10]                  : known domain 
     => v1 in [4,5]

[dans(v1,[4,5])]=> v1 max 5

1 < v2                                  : answer of the system 
v2 in [1,2,3,4,5]                       : known domain 
     => v2 in [2,3,4,5]

[dans(v2,[2,3,4,5])]=> v2 max 5

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4,5]                       : known domain 
     => v3 in [1,2]

[dans(v3,[1,2])]=> v3 max 2

[max(v1,5)]
[max(v2,5)]
[max(v3,2)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<16)]=> v0 in [4,5]

v0 in [4,5]                             : seen 
     => v0 max 5

v1 max 5                                : seen 
v3 max 2                                : seen 
[max(v0,5)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<16)]=> v2 in [4,5]

[v2<v0]
[dans(v0,[4,5])]
[dans(v2,[4,5])]=> v0 is 5
v2 is 4


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

c0 is yellow                            : seen 
c1 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4

[v0=v1]
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

c3 \= red                               : answer of the system 
c3 in [green,red,yellow]                : known domain 
     => c3 in [green,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,yellow])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v2 < v0                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [4,5]                             : seen 
     => v0 is 5
v2 is 4

[dans(v0,[5]),dans(v2,[4])]=> v2 max 4

v0 max 5                                : seen 
v1 max 5                                : seen 
[max(v2,4)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<16)]=> v3 is 2



********** no reduction after move 3 **********

