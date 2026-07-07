ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,danlin).
partie(17,'../parties_joueur/danlin/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,2,[c(0,red,7,10.94,non,plus),c(1,blue,9,45.8,oui,plus),c(2,yellow,8,1.75,non,moins),c(3,green,9,4.45,non,moins)]),
     coup(2,2,1,[c(0,green,10,2.79,oui,oui),c(1,blue,10,48.25,oui,oui),c(2,red,5,15.12,oui,oui),c(3,yellow,8,2.19,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [green,yellow]

7 < v0                                  : answer of the system 
v0 in [3,4,5,6,7,8,9,10]                : known domain 
     => v0 in [8,9,10]

v2 < 8                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5,6,7]

[dans(v0,[8,9,10])]
[dans(v2,[3,4,5,6,7])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green,red])]=> c2 in [green,red]

c0 \= c2                                : intial constraint 
yellow avant green                      : intial constraint 
c0 in [green,yellow]                    : seen 
[avant(c2,c0)]
[dans(c2,[green,red])]=> c2 is red

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
[dans(c2,[red])]
[dans(c3,[red,yellow])]=> c3 is yellow

c0 \= c3                                : intial constraint 
[dans(c0,[green,yellow])]
[dans(c3,[yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 is green                             : seen 
c1 is blue                              : seen 
blue meme_rang green                    : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 in [8,9,10]                          : seen 
v1 is 10                                : seen 
[v0=v1]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7] : 

v2 in [5,6,7]                           : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7,8] : 

v2 in [5,6,7]                           : seen 
     => v2 max 7

v0 max 10                               : seen 
v1 max 10                               : seen 
[max(v2,7)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<33)]=> v3 in [6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v3 is 8                                 : answer of the system 


