ident(24,'20blue<yellow=red<green0green71yellow52red53blue3').
joueur(24,junkang).
partie(24,'../parties_joueur/junkang/_partie_24').
somme(24,20).
ordre_couleurs(24,[blue,<,yellow,=,red,<,green]).
solution(24,[c(0,green,7),c(1,yellow,5),c(2,red,5),c(3,blue,3)]).
nb_solutions(24,168).
cartes_jouees(24,
   [
     coup(1,168,4,[c(0,red,5,2.23,non,plus),c(1,yellow,5,2.14,oui,oui),c(2,blue,2,4.83,non,plus),c(3,green,8,19.64,non,moins)]),
     coup(2,4,2,[c(0,green,8,56.32,oui,moins),c(2,red,5,44.15,oui,oui),c(3,blue,2,5.87,oui,plus)]),
     coup(3,2,1,[c(0,green,7,2.4,oui,oui),c(3,blue,3,11.12,oui,oui)])
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

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : seen 
c1 is yellow                            : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,green]

c0 \= c1                                : intial constraint 
blue avant yellow                       : intial constraint 
c1 is yellow                            : seen 
[avant(c1,c0)]
[dans(c0,[blue,green])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7,8,9] : 

v1 is 5                                 : seen 
     => v1 min 5

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[green,red])]=> c2 is red

c1 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[dans(c2,[red])]=> c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 is 5                                 : seen 
[v1=v2]=> v2 is 5

[dans(v2,[5])]=> v2 min 5

v0 in [6,7,8,9,10]                      : seen 
     => v0 min 6

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 min 1

v0 min 6                                : connu_min 
v1 min 5                                : connu_min 
[min(v3,1)]=> if v2 > 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>8,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6,7,8]

[dans(v2,[3,4,5,6,7,8])]=> v2 min 3

v1 min 5                                : connu_min 
[min(v0,6)]
[min(v2,3)]=> if v3 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>6,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 min 1

[min(v1,5)]
[min(v2,5)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<20)]=> v0 in [6,7,8,9]


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

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v0 min 6                                : connu_min 
v1 min 5                                : connu_min 
v2 min 5                                : connu_min 
     => if v3 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>4,v0+(v1+(v2+v3))<20)]=> v3 in [1,2,3,4]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is in [6,7] : 

v0 < 8                                  : answer of the system 
v0 in [6,7,8,9]                         : known domain 
     => v0 in [6,7]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4] : 

2 < v3                                  : answer of the system 
v3 in [1,2,3,4]                         : known domain 
     => v3 in [3,4]



************* explanations of the reductions after move 3 *************

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


