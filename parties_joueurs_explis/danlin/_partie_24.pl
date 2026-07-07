ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,danlin).
partie(24,'../parties_joueur/danlin/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,3,[c(0,green,6,7.49,oui,plus),c(1,blue,4,55.3,non,plus),c(2,red,5,1.5,oui,oui),c(3,yellow,5,1.63,non,moins)]),
     coup(2,3,1,[c(0,green,7,9.09,oui,oui),c(1,yellow,5,4.23,oui,oui),c(3,blue,4,22.89,oui,moins)]),
     coup(3,1,1,[c(3,blue,3,6.83,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [7,8,9] : 

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

v2 is 5                                 : answer of the system 
     => v2 min 5

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

[min(v1,5)]
[min(v2,5)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<20)]=> v0 in [7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

c1 is yellow                            : seen 
c2 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v0 in [7,8,9]                           : connu_somme_trop_grande 
     => v0 min 7

v2 min 5                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,7)]=> if v1 > 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>7,v0+(v1+(v2+v3))<20)]=> v1 in [5,6,7]

v2 is 5                                 : seen 
[v1=v2]
[dans(v1,[5,6,7])]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3] : 

v0 min 7                                : connu_min 
v1 min 5                                : connu_min 
v2 min 5                                : connu_min 
     => if v3 > 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>3,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

10 = v0 + v3                            : intial constraint 
     => v3 is 3



********** no reduction after move 3 **********

