ident(7,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(7,colin).
partie(7,'../parties_joueur/colin/_partie_3').
somme(7,20).
ordre_couleurs(7,[yellow,=,red,<,blue,<,green]).
solution(7,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(7,168).
cartes_jouees(7,
   [
     coup(1,168,6,[c(0,red,3,0,non,oui),c(1,blue,7,0,non,plus),c(2,green,8,0,non,moins),c(3,yellow,2,0,non,plus)]),
     coup(2,6,2,[c(0,yellow,3,0,oui,oui),c(1,green,8,0,oui,plus),c(2,blue,6,0,oui,moins),c(3,red,3,0,oui,oui)]),
     coup(3,2,1,[c(1,green,9,0,oui,plus),c(2,blue,5,0,oui,moins)]),
     coup(4,1,1,[c(1,green,10,0,oui,oui),c(2,blue,4,0,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction after move 0 **********

********** explinations of the reductions after move 1 **********

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,yellow] : 

7 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [8,9,10]

v0 is 3                                 : answer of the system 
[dans(v1,[8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
[avant(c0,c1)]
[dans(c0,[blue,green,yellow])]
[dans(c1,[green,red,yellow])]=> c0 in [blue,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c0 in [blue,yellow]                     : seen 
c1 in [green,red,yellow]                : seen 
     => c1 in [green,red]

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
red avant blue                          : intial constraint 
c0 in [blue,yellow]                     : seen 
red meme_rang yellow                    : intial constraint 
[dans(c1,[green,red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5,6] : 

v0 is 3                                 : seen 
     => v0 min 3

v1 in [8,9,10]                          : seen 
     => v1 min 8

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 min 3

[min(v0,3)]
[min(v1,8)]
[min(v3,3)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>6,v0+(v1+(v2+v3))<20)]=> v2 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5,6,7,8] : 

v2 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
     => v2 min 1

v0 min 3                                : connu_min 
v1 min 8                                : connu_min 
[min(v2,1)]=> if v3 > 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>8,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6,7,8]



********** explinations of the reductions after move 2 **********

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

8 < v1                                  : answer of the system 
v1 in [8,9,10]                          : known domain 
     => v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v1 in [9,10]                            : seen 
     => v1 max 10

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v1,10)]
[max(v3,3)]=> if v2 < 4 then v1 + v2 + v3 < 17

17 = v1 + v2 + v3                       : intial constraint 
[si_alors(v2<4,v1+(v2+v3)<17)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



********** explinations of the reductions after move 3 **********

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



********** no reduction after move 4 **********

