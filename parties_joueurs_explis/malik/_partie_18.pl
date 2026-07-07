ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,malik).
partie(18,'../parties_joueur/malik/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,1,[c(0,green,1,7.92,non,plus),c(1,blue,6,66.2,oui,moins),c(2,yellow,6,5.12,non,moins),c(3,red,3,4.43,non,moins)]),
     coup(2,1,1,[c(0,yellow,5,12.87,oui,oui),c(1,blue,5,15.48,oui,oui),c(2,red,4,7.37,oui,oui),c(3,green,2,29.33,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green,red])]=> c2 in [green,red]

v1 < 6                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5]

[dans(v1,[1,2,3,4,5])]=> v1 max 5

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 max 5

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2]

[dans(v3,[1,2])]=> v3 max 2

[max(v1,5)]
[max(v2,5)]
[max(v3,2)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<16)]=> v0 in [4,5,6,7,8,9,10]

v3 in [1,2]                             : seen 
[dans(v0,[4,5,6,7,8,9,10])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [green,yellow]

c0 \= c3                                : intial constraint 
red avant yellow                        : intial constraint 
c0 in [red,yellow]                      : seen 
[avant(c3,c0)]
[dans(c3,[green,yellow])]=> c3 is green

c2 \= c3                                : intial constraint 
[dans(c2,[green,red])]
[dans(c3,[green])]=> c2 is red

c0 \= c2                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c2,[red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c0 is yellow                            : seen 
c1 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

c1 is blue                              : seen 
c2 in [green,red]                       : seen 
     => c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

v1 in [1,2,3,4,5]                       : seen 
v2 in [1,2,3,4,5]                       : seen 
[v2<v1]=> v1 in [2,3,4,5]
v2 in [1,2,3,4]

[dans(v1,[2,3,4,5]),dans(v2,[1,2,3,4])]=> v2 max 4

v1 max 5                                : seen 
v3 max 2                                : seen 
[max(v2,4)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<16)]=> v0 in [5,6,7,8,9,10]

v2 < v1                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : seen 
v2 in [1,2,3,4,5]                       : seen 
     => v1 in [2,3,4,5]
v2 in [1,2,3,4]

[v0=v1]
[dans(v0,[5,6,7,8,9,10])]
[dans(v1,[2,3,4,5]),dans(v2,[1,2,3,4])]=> v0 is 5
v1 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : seen 
v2 in [1,2,3,4,5]                       : seen 
     => v1 in [2,3,4,5]
v2 in [1,2,3,4]

v0 = v1                                 : connu_simplification_equivalence 
v0 in [5,6,7,8,9,10]                    : seen 
[dans(v1,[2,3,4,5]),dans(v2,[1,2,3,4])]=> v0 is 5
v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < v1                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : seen 
v2 in [1,2,3,4,5]                       : seen 
     => v1 in [2,3,4,5]
v2 in [1,2,3,4]

v0 = v1                                 : connu_simplification_equivalence 
v0 in [5,6,7,8,9,10]                    : seen 
[dans(v1,[2,3,4,5]),dans(v2,[1,2,3,4])]=> v0 is 5
v1 is 5

[dans(v0,[5]),dans(v1,[5])]=> v0 max 5

v1 max 5                                : seen 
v3 max 2                                : seen 
[max(v0,5)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<16)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v0 max 5                                : seen 
v1 max 5                                : seen 
v2 max 4                                : seen 
     => if v3 < 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<16)]=> v3 is 2



********** no reduction after move 2 **********

