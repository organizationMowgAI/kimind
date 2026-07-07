ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,junkang).
partie(3,'../parties_joueur/junkang/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,2,[c(0,red,3,4.53,non,oui),c(1,yellow,3,38.52,non,plus),c(2,blue,6,11.01,oui,moins),c(3,green,8,2.21,non,moins)]),
     coup(2,2,1,[c(0,yellow,3,18.16,oui,oui),c(1,green,9,2.66,oui,plus),c(2,blue,5,27.43,oui,moins),c(3,red,3,8.23,oui,oui)]),
     coup(3,1,1,[c(1,green,10,3.95,oui,oui),c(2,blue,4,3.47,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

3 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [4,5,6,7,8,9,10]

v0 is 3                                 : answer of the system 
[dans(v1,[4,5,6,7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c0 \= c1                                : intial constraint 
red avant green                         : intial constraint 
[avant(c0,c1)]
[dans(c0,[green,yellow])]
[dans(c1,[green,red])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 is yellow                            : seen 
c1 in [green,red]                       : seen 
red meme_rang yellow                    : intial constraint 
     => c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[red,yellow])]=> c3 is red

c0 is yellow                            : seen 
red meme_rang yellow                    : seen 
[dans(c3,[red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 is 3                                 : seen 
[v0=v3]=> v3 is 3

[dans(v3,[3])]=> v3 max 3

v0 max 3                                : seen 
v2 max 5                                : seen 
[max(v3,3)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<9,v0+(v1+(v2+v3))<20)]=> v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

c2 is blue                              : seen 
c3 in [red,yellow]                      : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v1 in [5,6,7,8,9,10]                    : seen 
     => v1 max 10

v0 max 3                                : seen 
v2 max 5                                : seen 
[max(v1,10)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<20)]=> v3 in [2,3,4,5,6,7]

v3 < v2                                 : connu_simplification_equivalence 
v2 in [1,2,3,4,5]                       : seen 
[dans(v3,[2,3,4,5,6,7])]=> v2 in [3,4,5]
v3 in [2,3,4]

v3 is 3                                 : seen 
[v3<v2]
[dans(v2,[3,4,5]),dans(v3,[2,3,4])]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < 5                                  : answer of the system 



********** no reduction after move 3 **********

