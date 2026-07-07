ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,jean_pierre).
partie(24,'../parties_joueur/jean_pierre/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,4,[c(0,blue,3,22.45,non,plus),c(1,green,7,6.7,non,moins),c(2,red,5,1.48,oui,oui),c(3,yellow,5,1.69,non,moins)]),
     coup(2,4,1,[c(0,green,7,30.06,oui,oui),c(1,yellow,5,15.04,oui,oui),c(3,blue,3,3.81,oui,oui)])
   ]
            ).
resultat(24,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

v1 < 7                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [1,2,3,4,5,6]

[dans(v1,[1,2,3,4,5,6])]=> v1 max 6

v2 is 5                                 : answer of the system 
     => v2 max 5

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 max 4

[max(v1,6)]
[max(v2,5)]
[max(v3,4)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<20)]=> v0 in [5,6,7,8,9,10]

v3 in [1,2,3,4]                         : seen 
[dans(v0,[5,6,7,8,9,10])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c0 \= c3                                : intial constraint 
yellow avant green                      : intial constraint 
c0 in [green,yellow]                    : seen 
[avant(c3,c0)]
[dans(c3,[blue,green])]=> c3 is blue

c1 \= c3                                : intial constraint 
[dans(c1,[blue,yellow])]
[dans(c3,[blue])]=> c1 is yellow

c0 \= c1                                : intial constraint 
[dans(c0,[green,yellow])]
[dans(c1,[yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

c1 is yellow                            : seen 
c2 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 in [1,2,3,4,5,6]                     : seen 
v2 is 5                                 : seen 
[v1=v2]=> v1 is 5

[dans(v1,[5])]=> v1 max 5

v2 max 5                                : seen 
v3 max 4                                : seen 
[max(v1,5)]=> if v0 < 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<6,v0+(v1+(v2+v3))<20)]=> v0 in [6,7,8,9]


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

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : seen 



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

v3 is 3                                 : answer of the system 


