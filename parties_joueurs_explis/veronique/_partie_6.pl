ident(6,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(6,veronique).
partie(6,'../parties_joueur/veronique/_partie_6').
somme(6,10).
ordre_couleurs(6,[blue,<,green,=,red,<,yellow]).
solution(6,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(6,24).
cartes_jouees(6,
   [
     coup(1,24,1,[c(0,green,2,10.7,oui,oui),c(1,red,2,13.68,non,plus),c(2,blue,1,7.59,non,plus),c(3,yellow,5,4.92,non,moins)]),
     coup(2,1,1,[c(1,yellow,5,34.44,oui,oui),c(2,red,2,5.74,oui,oui),c(3,blue,1,123.99,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

2 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7]                   : known domain 
     => v1 in [3,4,5,6,7]

v0 is 2                                 : seen 
[dans(v1,[3,4,5,6,7])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : seen 
c0 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

c0 \= c1                                : intial constraint 
blue avant green                        : intial constraint 
c0 is green                             : seen 
[avant(c0,c1)]
[dans(c1,[blue,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[green,red,yellow])]=> c2 in [red,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[red,yellow])]=> c2 is red

c0 is green                             : seen 
green meme_rang red                     : intial constraint 
[dans(c2,[red])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 2                                 : seen 
[v0=v2]=> v2 is 2

[dans(v2,[2])]=> v2 max 2

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue

blue avant green                        : seen 
c0 is green                             : seen 
[dans(c3,[blue])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v1 in [3,4,5]                           : connu_somme_trop_grande 
     => v1 min 3

v0 min 2                                : connu_min 
v2 min 2                                : connu_min 
[min(v1,3)]=> if v3 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>3,v0+(v1+(v2+v3))<10)]=> v3 in [1,2,3]

v0 is 2                                 : seen 
[v3<v0]
[dans(v3,[1,2,3])]=> v3 is 1

[dans(v3,[1])]=> v3 max 1

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

