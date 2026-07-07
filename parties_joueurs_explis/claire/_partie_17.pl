ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,claire).
partie(17,'../parties_joueur/claire/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,2,[c(0,green,10,2.79,oui,oui),c(1,yellow,7,3.03,non,plus),c(2,red,6,64.25,oui,moins),c(3,blue,10,3.41,non,moins)]),
     coup(2,2,1,[c(1,blue,10,28.74,oui,oui),c(2,red,5,15.78,oui,oui),c(3,yellow,8,2.94,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

c1 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c1,[blue,red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

c0 is green                             : seen 
c1 is blue                              : seen 
blue meme_rang green                    : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 is 10                                : seen 
[v0=v1]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v0 is 10                                : seen 
     => v0 max 10

v2 < 6                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5]

[dans(v2,[3,4,5])]=> v2 max 5

v3 < 10                                 : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [3,4,5,6,7,8,9]

[dans(v3,[3,4,5,6,7,8,9])]=> v3 max 9

v0 max 10                               : seen 
[max(v2,5)]
[max(v3,9)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<9,v0+(v1+(v2+v3))<33)]=> v1 in [9,10]

[dans(v1,[9,10])]=> v1 max 10

v3 max 9                                : seen 
[max(v0,10)]
[max(v1,10)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<33)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[green,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[red,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is in [8,9] : 

v0 max 10                               : seen 
v1 max 10                               : seen 
v2 max 5                                : seen 
     => if v3 < 8 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<8,v0+(v1+(v2+v3))<33)]=> v3 in [8,9]



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


