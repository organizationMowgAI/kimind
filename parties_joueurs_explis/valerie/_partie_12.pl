ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,valerie).
partie(12,'../parties_joueur/valerie/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,3,[c(0,blue,3,8.39,oui,oui),c(1,yellow,3,7.38,non,plus),c(2,red,4,5.97,non,moins),c(3,green,10,4.51,non,moins)]),
     coup(2,3,1,[c(1,green,10,18.35,oui,oui),c(2,yellow,3,4.78,oui,oui),c(3,red,4,3.15,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

v0 is 3                                 : seen 
     => v0 max 3

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 max 3

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v3 max 9

v0 max 3                                : seen 
[max(v2,3)]
[max(v3,9)]=> if v1 < 5 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<5,v0+(v1+(v2+v3))<20)]=> v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 max 10

v2 max 3                                : seen 
[max(v0,3)]
[max(v1,10)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<4,v0+(v1+(v2+v3))<20)]=> v3 in [4,5,6,7,8,9]

v0 is 3                                 : seen 
[dans(v3,[4,5,6,7,8,9])]=> v0 < v3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[v0<v3]=> c0 avant c3

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : seen 
c0 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
[avant(c0,c3)]
[dans(c3,[red,yellow])]=> c3 is red

c1 \= c3                                : intial constraint 
[dans(c1,[green,red])]
[dans(c3,[red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8,9,10] : 

v1 in [5,6,7,8,9,10]                    : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[green,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

c0 is blue                              : seen 
c2 is yellow                            : seen 
blue meme_rang yellow                   : seen 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 3                                 : seen 
[v0=v2]=> v2 is 3


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6,7,8,9] : 

v3 in [4,5,6,7,8,9]                     : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 is 4                                 : answer of the system 


