ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,colin).
partie(24,'../parties_joueur/colin/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,1,[c(0,yellow,5,20.76,non,plus),c(1,red,5,2.03,non,oui),c(2,green,7,9.63,non,moins),c(3,blue,3,2.26,oui,oui)]),
     coup(2,1,1,[c(0,green,7,9.44,oui,oui),c(1,yellow,5,2.41,oui,oui),c(2,red,5,2.59,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

5 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [6,7,8,9,10]

v1 is 5                                 : answer of the system 
[dans(v0,[6,7,8,9,10])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [green,yellow]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
c0 in [green,red]                       : seen 
[dans(c1,[green,yellow])]=> c1 is yellow

c0 \= c1                                : intial constraint 
red meme_rang yellow                    : intial constraint 
[avant(c1,c0)]
[dans(c0,[green,red])]
[dans(c1,[yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v1 is 5                                 : seen 
     => v1 max 5

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[red,yellow])]=> c2 is red

c1 is yellow                            : seen 
red meme_rang yellow                    : seen 
[dans(c2,[red])]=> c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 is 5                                 : seen 
[v1=v2]=> v2 is 5

[dans(v2,[5])]=> v2 max 5

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v1,5)]
[max(v2,5)]
[max(v3,3)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<20)]=> v0 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



********** no reduction after move 2 **********

