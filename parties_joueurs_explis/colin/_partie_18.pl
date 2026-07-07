ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,colin).
partie(18,'../parties_joueur/colin/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,1,[c(0,red,4,17.43,non,plus),c(1,yellow,5,6.68,non,oui),c(2,blue,5,2.59,non,moins),c(3,green,2,2.63,oui,oui)]),
     coup(2,1,1,[c(0,yellow,5,4.63,oui,oui),c(1,blue,5,13.3,oui,oui),c(2,red,4,2.38,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v0,[5,6,7,8,9,10])]
[dans(v2,[1,2,3,4])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[green,red,yellow])]=> c2 in [red,yellow]

c0 \= c2                                : intial constraint 
c0 in [blue,yellow]                     : seen 
blue meme_rang yellow                   : intial constraint 
[avant(c2,c0)]
[dans(c2,[red,yellow])]=> c2 is red

c1 \= c2                                : intial constraint 
[dans(c1,[blue,red])]
[dans(c2,[red])]=> c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,yellow])]
[dans(c1,[blue])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c0 is yellow                            : seen 
c1 is blue                              : seen 
blue meme_rang yellow                   : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

c2 in [red,yellow]                      : seen 
c3 is green                             : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v2 in [1,2,3,4]                         : seen 
v3 is 2                                 : seen 
[v3<v2]=> v2 in [3,4]

[dans(v2,[3,4])]=> v2 min 3

v1 min 5                                : connu_min 
v3 min 2                                : connu_min 
[min(v2,3)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>6,v0+(v1+(v2+v3))<16)]=> v0 in [5,6]

v1 is 5                                 : seen 
[v0=v1]
[dans(v0,[5,6])]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v0 is 5                                 : seen 
     => v0 max 5

v1 is 5                                 : seen 
     => v1 max 5

v3 is 2                                 : seen 
     => v3 max 2

[max(v0,5)]
[max(v1,5)]
[max(v3,2)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<16)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 2 **********

