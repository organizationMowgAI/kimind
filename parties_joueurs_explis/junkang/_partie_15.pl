ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,junkang).
partie(15,'../parties_joueur/junkang/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,2,[c(0,red,10,32.37,oui,oui),c(1,green,8,10.81,non,plus),c(2,yellow,7,2.8,non,plus),c(3,blue,10,2.18,non,moins)]),
     coup(2,2,1,[c(1,blue,10,38.07,oui,oui),c(2,green,8,4.13,oui,oui),c(3,yellow,7,2.61,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

8 < v1                                  : answer of the system 
v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 in [9,10]

v0 is 10                                : seen 
     => v0 min 10

v1 in [9,10]                            : seen 
     => v1 min 9

7 < v2                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

[min(v0,10)]
[min(v1,9)]
[min(v2,8)]=> if v3 > 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>8,v0+(v1+(v2+v3))<35)]=> v3 in [5,6,7,8]

[dans(v1,[9,10])]
[dans(v3,[5,6,7,8])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c1 \= c3                                : intial constraint 
yellow avant green                      : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,yellow])]
[dans(c3,[green,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 is 10                                : seen 
[v0=v1]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

green avant red                         : intial constraint 
c0 is red                               : seen 
c2 is green                             : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

v0 is 10                                : seen 
v2 in [8,9,10]                          : seen 
[v2<v0]=> v2 in [8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
c3 in [green,yellow]                    : seen 
     => c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7] : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

v2 in [8,9]                             : seen 
     => v2 max 9

[max(v0,10)]
[max(v1,10)]
[max(v2,9)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<35)]=> v3 in [6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


