ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,camille).
partie(23,'../parties_joueur/camille/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,3,[c(0,yellow,2,7.24,non,plus),c(1,blue,5,21.74,non,moins),c(2,red,2,2.28,non,oui),c(3,green,2,2.05,non,oui)]),
     coup(2,3,1,[c(0,blue,5,26.71,oui,oui),c(1,green,2,16.24,oui,oui),c(2,yellow,2,3.53,oui,oui),c(3,red,2,1.89,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

2 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v0 in [3,4,5,6,7,8]

v2 is 2                                 : answer of the system 
[dans(v0,[3,4,5,6,7,8])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

v2 is 2                                 : seen 
v3 is 2                                 : seen 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
red avant blue                          : intial constraint 
yellow avant blue                       : intial constraint 
[dans(c2,[blue,green,yellow])]
[dans(c3,[blue,red,yellow])]
[meme_rang(c2,c3)]=> c2 in [green,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
green meme_rang yellow                  : intial constraint 
[dans(c0,[blue,green,red])]
[dans(c2,[green,yellow])]=> c0 in [blue,red]

c0 \= c2                                : intial constraint 
c2 in [green,yellow]                    : seen 
green meme_rang red                     : intial constraint 
red meme_rang yellow                    : intial constraint 
[avant(c2,c0)]
[dans(c0,[blue,red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c2 in [green,yellow]                    : seen 
[dans(c1,[green,red,yellow])]=> c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 in [1,2,3,4]                         : seen 
v2 is 2                                 : seen 
[v1=v2]=> v1 is 2

[dans(v1,[2])]=> v1 max 2

v2 is 2                                 : seen 
     => v2 max 2

v3 is 2                                 : seen 
     => v3 max 2

[max(v1,2)]
[max(v2,2)]
[max(v3,2)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<11)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

c1 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c2 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c2 \= c3                                : seen 
green avant blue                        : intial constraint 
yellow avant blue                       : seen 
c2 in [green,yellow]                    : seen 
c3 in [blue,red,yellow]                 : seen 
c2 meme_rang c3                         : connu_simplification_equivalence 
     => c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : known domain 



