ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,camille).
partie(6,'../parties_joueur/camille/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,3,[c(0,yellow,3,6.84,oui,moins),c(1,green,7,55.99,non,moins),c(2,red,4,10.71,non,plus),c(3,blue,7,3.21,oui,plus)]),
     coup(2,3,1,[c(0,yellow,1,2.77,oui,plus),c(1,red,3,11.19,oui,oui),c(2,green,8,8.0,oui,oui),c(3,blue,8,61.18,oui,oui)]),
     coup(3,1,1,[c(0,yellow,2,15.83,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2] : 

v0 < 3                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2]


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c1 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c1,[blue,red])]=> c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4] : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 in [1,2]                             : seen 
     => v0 min 1

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green

c3 is blue                              : seen 
blue meme_rang green                    : intial constraint 
[dans(c2,[green])]=> c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[v2=v3]
[dans(v2,[5,6,7,8,9,10])]
[dans(v3,[8,9,10])]=> v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

v3 in [8,9,10]                          : seen 
     => v3 min 8

[min(v0,1)]
[min(v2,8)]
[min(v3,8)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>4,v0+(v1+(v2+v3))<21)]=> v1 in [1,2,3,4]

v0 in [1,2]                             : seen 
[v0<v1]
[dans(v1,[1,2,3,4])]=> v1 in [2,3,4]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9,10] : 

v3 in [8,9,10]                          : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 > 1                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

v1 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


********** no reduction after move 3 **********

