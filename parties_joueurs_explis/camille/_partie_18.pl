ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,camille).
partie(18,'../parties_joueur/camille/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,1,[c(0,green,2,2.31,non,plus),c(1,blue,5,4.78,oui,oui),c(2,yellow,5,55.03,non,moins),c(3,red,4,5.13,non,moins)]),
     coup(2,1,1,[c(0,yellow,5,17.85,oui,oui),c(2,red,4,40.5,oui,oui),c(3,green,2,3.33,oui,oui)])
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

v1 is 5                                 : answer of the system 
     => v1 max 5

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 max 4

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3]

[dans(v3,[1,2,3])]=> v3 max 3

[max(v1,5)]
[max(v2,4)]
[max(v3,3)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<16)]=> v0 in [4,5,6,7,8,9]

v3 in [1,2,3]                           : seen 
[dans(v0,[4,5,6,7,8,9])]=> v3 < v0

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

v0 in [4,5,6,7,8,9]                     : seen 
v1 is 5                                 : seen 
[v0=v1]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4] : 

v0 is 5                                 : seen 
     => v0 max 5

v1 max 5                                : seen 
v3 max 3                                : seen 
[max(v0,5)]=> if v2 < 3 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<3,v0+(v1+(v2+v3))<16)]=> v2 in [3,4]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3] : 

v0 max 5                                : seen 
v1 max 5                                : seen 
v2 max 4                                : seen 
     => if v3 < 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<16)]=> v3 in [2,3]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : answer of the system 


