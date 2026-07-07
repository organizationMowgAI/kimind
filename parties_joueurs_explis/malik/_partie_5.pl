ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,malik).
partie(5,'../parties_joueur/malik/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,1,[c(0,yellow,5,59.03,non,moins),c(1,red,2,6.26,non,plus),c(2,green,2,3.2,non,oui),c(3,blue,1,2.62,oui,oui)]),
     coup(2,1,1,[c(0,green,2,3.3,oui,oui),c(1,yellow,5,6.15,oui,oui),c(2,red,2,20.69,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [3,4,5,6,7]

v2 is 2                                 : answer of the system 
[dans(v1,[3,4,5,6,7])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [green,yellow]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c1 \= c2                                : intial constraint 
green avant yellow                      : intial constraint 
[avant(c2,c1)]
[dans(c1,[green,yellow])]
[dans(c2,[red,yellow])]=> c2 is red

c0 \= c2                                : intial constraint 
[dans(c0,[green,red])]
[dans(c2,[red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

c0 is green                             : seen 
c2 is red                               : seen 
green meme_rang red                     : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

c0 in [green,red]                       : seen 
c3 is blue                              : seen 
     => c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v0 in [1,2,3,4]                         : seen 
v3 is 1                                 : seen 
[v3<v0]=> v0 in [2,3,4]

v2 is 2                                 : seen 
[v0=v2]
[dans(v0,[2,3,4])]=> v0 is 2


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
c1 in [green,yellow]                    : seen 
c2 is red                               : seen 
green meme_rang red                     : seen 
     => c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

v2 is 2                                 : seen 
     => v2 max 2

v3 is 1                                 : seen 
     => v3 max 1

[max(v0,2)]
[max(v2,2)]
[max(v3,1)]=> if v1 < 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<5,v0+(v1+(v2+v3))<10)]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

