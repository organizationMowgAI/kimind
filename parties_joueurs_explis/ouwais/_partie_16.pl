ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,ouwais).
partie(16,'../parties_joueur/ouwais/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,3,[c(0,green,5,1.73,non,oui),c(1,red,5,3.88,non,plus),c(2,blue,10,22.93,non,moins),c(3,yellow,5,1.57,non,oui)]),
     coup(2,3,1,[c(0,red,5,4.81,non,oui),c(1,blue,10,8.6,oui,oui),c(2,yellow,5,4.74,non,oui),c(3,green,5,1.44,non,oui)]),
     coup(3,1,1,[c(0,yellow,5,10.58,oui,oui),c(2,green,5,9.82,oui,oui),c(3,red,5,1.83,oui,oui)])
   ]
            ).
resultat(16,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

v0 is 5                                 : answer of the system 
v3 is 5                                 : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
red avant blue                          : intial constraint 
[dans(c0,[blue,red,yellow])]
[dans(c3,[blue,green,red])]
[meme_rang(c0,c3)]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

5 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [6,7,8,9,10]

v0 is 5                                 : seen 
[dans(v1,[6,7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 in [red,yellow]                      : seen 
red meme_rang yellow                    : intial constraint 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c0 \= c1                                : intial constraint 
c0 in [red,yellow]                      : seen 
green meme_rang red                     : intial constraint 
green meme_rang yellow                  : intial constraint 
[avant(c0,c1)]
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 5                                 : seen 
     => v0 max 5

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 in [red,yellow]                      : seen 
[dans(c2,[green,red,yellow])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 5                                 : seen 
[v0=v2]=> v2 is 5

[dans(v2,[5])]=> v2 max 5

v3 is 5                                 : seen 
     => v3 max 5

[max(v0,5)]
[max(v2,5)]
[max(v3,5)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

c2 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

c0 \= c3                                : seen 
red avant blue                          : seen 
yellow avant blue                       : intial constraint 
c0 in [red,yellow]                      : seen 
c3 in [blue,green,red]                  : seen 
c0 meme_rang c3                         : connu_simplification_equivalence 
     => c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [green,red,yellow]                : known domain 
     => c2 in [green,red]

c2 \= c3                                : intial constraint 
c3 \= green                             : answer of the system 
c2 meme_rang c3                         : intial constraint 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : known domain 



********** no reduction after move 3 **********

