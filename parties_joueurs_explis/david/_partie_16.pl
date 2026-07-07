ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,david).
partie(16,'../parties_joueur/david/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,1,[c(0,blue,10,111.71,non,moins),c(1,green,5,14.72,non,plus),c(2,yellow,5,3.26,non,oui),c(3,red,5,2.43,oui,oui)]),
     coup(2,1,1,[c(0,yellow,5,60.67,oui,oui),c(1,blue,10,4.84,oui,oui),c(2,green,5,1.89,oui,oui)])
   ]
            ).
resultat(16,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c2 \= c3                                : seen 
c3 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

v2 is 5                                 : answer of the system 
v3 is 5                                 : answer of the system 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
red avant blue                          : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,green])]
[meme_rang(c2,c3)]=> c2 is green

c0 \= c2                                : intial constraint 
[dans(c0,[green,yellow])]
[dans(c2,[green])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c0 in [green,yellow]                    : seen 
c3 is red                               : seen 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

[dans(v1,[6,7,8,9,10])]=> v1 max 10

v2 is 5                                 : seen 
     => v2 max 5

v3 is 5                                 : seen 
     => v3 max 5

[max(v1,10)]
[max(v2,5)]
[max(v3,5)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<25)]=> v0 in [5,6,7,8,9]

v3 is 5                                 : seen 
[v0=v3]
[dans(v0,[5,6,7,8,9])]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 5                                 : seen 
     => v0 max 5

v2 max 5                                : seen 
v3 max 5                                : seen 
[max(v0,5)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : seen 



********** no reduction after move 2 **********

