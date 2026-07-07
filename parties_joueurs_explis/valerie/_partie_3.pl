ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,valerie).
partie(3,'../parties_joueur/valerie/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,1,[c(0,yellow,2,15.99,oui,plus),c(1,red,2,32.5,non,plus),c(2,blue,4,11.89,oui,oui),c(3,green,10,13.11,non,moins)]),
     coup(2,1,1,[c(0,yellow,3,11.2,oui,oui),c(1,green,10,3.45,oui,oui),c(3,red,3,4.28,oui,oui)])
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

yellow avant blue                       : intial constraint 
c0 is yellow                            : seen 
c2 is blue                              : answer of the system 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red

c0 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [3,4,5,6,7,8,9,10]

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[v0=v3]
[dans(v0,[3,4,5,6,7,8,9,10])]
[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v0 in [3,4,5,6,7,8,9]
v3 in [3,4,5,6,7,8,9]

v2 is 4                                 : answer of the system 
[v0<v2]
[dans(v0,[3,4,5,6,7,8,9]),dans(v3,[3,4,5,6,7,8,9])]=> v0 is 3


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

v0 is 3                                 : seen 
     => v0 max 3

v2 is 4                                 : seen 
     => v2 max 4

v0 = v3                                 : connu_simplification_equivalence 
v0 is 3                                 : seen 
     => v3 is 3

[dans(v3,[3])]=> v3 max 3

[max(v0,3)]
[max(v2,4)]
[max(v3,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
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

v3 is 3                                 : seen 



********** no reduction after move 2 **********

