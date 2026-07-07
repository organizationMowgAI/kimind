ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,alexis).
partie(23,'../parties_joueur/alexis/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,3,[c(0,green,2,19.21,non,plus),c(1,yellow,2,4.53,non,oui),c(2,red,2,4.47,non,oui),c(3,blue,5,4.24,non,moins)]),
     coup(2,3,1,[c(0,blue,5,12.74,oui,oui),c(1,red,2,6.44,non,oui),c(2,green,2,6.27,non,oui),c(3,yellow,2,4.39,non,oui)]),
     coup(3,1,1,[c(1,green,2,1.92,oui,oui),c(2,yellow,2,2.66,oui,oui),c(3,red,2,7.99,oui,oui)])
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

v1 is 2                                 : answer of the system 
[dans(v0,[3,4,5,6,7,8])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

v1 is 2                                 : seen 
v2 is 2                                 : seen 
     => v1 = v2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[v1=v2]=> c1 meme_rang c2

c1 \= c2                                : intial constraint 
green avant blue                        : intial constraint 
yellow avant blue                       : intial constraint 
[dans(c1,[blue,green,red])]
[dans(c2,[blue,green,yellow])]
[meme_rang(c1,c2)]=> c1 in [green,red]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
green meme_rang yellow                  : intial constraint 
red meme_rang yellow                    : intial constraint 
[dans(c0,[blue,red,yellow])]
[dans(c1,[green,red])]=> c0 in [blue,red]

c0 \= c1                                : intial constraint 
c1 in [green,red]                       : seen 
green meme_rang red                     : intial constraint 
[avant(c1,c0)]
[dans(c0,[blue,red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v1 is 2                                 : seen 
     => v1 max 2

v2 is 2                                 : seen 
     => v2 max 2

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 in [green,red]                       : seen 
[dans(c3,[green,red,yellow])]=> c1 meme_rang c3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[meme_rang(c1,c3)]=> v1 = v3

v1 is 2                                 : seen 
[v1=v3]=> v3 is 2

[dans(v3,[2])]=> v3 max 2

[max(v1,2)]
[max(v2,2)]
[max(v3,2)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<11)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

c1 in [green,red]                       : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c1 \= c2                                : seen 
green avant blue                        : seen 
red avant blue                          : intial constraint 
c1 in [green,red]                       : seen 
c2 in [blue,green,yellow]               : seen 
c1 meme_rang c2                         : connu_simplification_equivalence 
     => c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

c3 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= yellow                            : answer of the system 
c3 in [green,red,yellow]                : known domain 
     => c3 in [green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
c1 meme_rang c3                         : intial constraint 
[dans(c3,[green,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : known domain 



********** no reduction after move 3 **********

