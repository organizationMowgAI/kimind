ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,david).
partie(3,'../parties_joueur/david/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,1,[c(0,green,7,92.54,non,moins),c(1,blue,5,9.29,non,plus),c(2,yellow,4,7.36,non,oui),c(3,red,4,2.99,oui,moins)]),
     coup(2,1,1,[c(0,yellow,3,202.3,oui,oui),c(1,green,10,8.59,oui,oui),c(2,blue,4,5.31,oui,oui),c(3,red,3,6.43,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

[dans(v1,[6,7,8,9,10])]=> v1 max 10

v2 is 4                                 : answer of the system 
     => v2 max 4

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3]

[dans(v3,[1,2,3])]=> v3 max 3

[max(v1,10)]
[max(v2,4)]
[max(v3,3)]=> if v0 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<3,v0+(v1+(v2+v3))<20)]=> v0 in [3,4,5,6]

v0 in [3,4,5,6]                         : seen 
     => v0 max 6

v2 max 4                                : seen 
v3 max 3                                : seen 
[max(v0,6)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<7,v0+(v1+(v2+v3))<20)]=> v1 in [7,8,9,10]

[dans(v0,[3,4,5,6])]
[dans(v1,[7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,yellow]

c0 \= c1                                : intial constraint 
yellow avant blue                       : intial constraint 
c0 in [blue,yellow]                     : seen 
[avant(c0,c1)]
[dans(c1,[green,yellow])]=> c1 is green

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
[dans(c1,[green])]
[dans(c2,[blue,green])]=> c2 is blue

c0 \= c2                                : intial constraint 
[dans(c0,[blue,yellow])]
[dans(c2,[blue])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c0 is yellow                            : seen 
c3 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 in [3,4,5,6]                         : seen 
v3 in [1,2,3]                           : seen 
[v0=v3]=> v0 is 3
v3 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [3,4,5,6]                         : seen 
v3 in [1,2,3]                           : seen 
     => v0 is 3
v3 is 3

[dans(v0,[3]),dans(v3,[3])]=> v0 max 3

v2 max 4                                : seen 
v3 max 3                                : seen 
[max(v0,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<20)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [3,4,5,6]                         : seen 
v3 in [1,2,3]                           : seen 
     => v0 is 3
v3 is 3



********** no reduction after move 2 **********

