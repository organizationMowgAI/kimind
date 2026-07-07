ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,alexis).
partie(3,'../parties_joueur/alexis/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,1,[c(0,yellow,4,47.52,oui,moins),c(1,red,4,1.73,non,plus),c(2,blue,5,2.72,oui,moins),c(3,green,7,2.39,non,moins)]),
     coup(2,1,1,[c(0,yellow,3,44.93,oui,oui),c(1,green,10,2.01,oui,oui),c(2,blue,4,3.02,oui,oui),c(3,red,3,8.14,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c3,[blue,red])]=> c3 is red

c0 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3]

v0 in [1,2,3]                           : seen 
     => v0 max 3

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 max 4

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 max 6

v0 max 3                                : seen 
[max(v2,4)]
[max(v3,6)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<7,v0+(v1+(v2+v3))<20)]=> v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

v2 max 4                                : seen 
[max(v0,3)]
[max(v1,10)]=> if v3 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<3,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6]

[v0=v3]
[dans(v0,[1,2,3])]
[dans(v3,[3,4,5,6])]=> v0 is 3
v3 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [1,2,3]                           : seen 
v3 in [3,4,5,6]                         : seen 
     => v0 is 3
v3 is 3

[dans(v0,[3]),dans(v3,[3])]=> v3 max 3

v0 max 3                                : seen 
v2 max 4                                : seen 
[max(v3,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<20)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v3 max 3                                : seen 
     => if v2 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<20)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [1,2,3]                           : seen 
v3 in [3,4,5,6]                         : seen 
     => v0 is 3
v3 is 3



********** no reduction after move 2 **********

