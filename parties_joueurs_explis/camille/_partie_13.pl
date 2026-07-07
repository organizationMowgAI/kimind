ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,camille).
partie(13,'../parties_joueur/camille/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,1,[c(0,blue,8,5.54,non,plus),c(1,red,10,12.31,non,oui),c(2,green,10,2.6,oui,oui),c(3,yellow,10,3.33,non,moins)]),
     coup(2,1,1,[c(0,red,10,6.38,oui,oui),c(1,yellow,10,10.44,oui,oui),c(3,blue,8,6.84,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : seen 
c2 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

v1 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v1 = v2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[v1=v2]=> c1 meme_rang c2

c1 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,yellow])]
[meme_rang(c1,c2)]=> c1 is yellow

c0 \= c1                                : intial constraint 
[dans(c0,[red,yellow])]
[dans(c1,[yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 in [red,yellow]                      : seen 
c2 is green                             : seen 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

8 < v0                                  : answer of the system 
v0 in [8,9,10]                          : known domain 
     => v0 in [9,10]

v2 is 10                                : seen 
[v0=v2]
[dans(v0,[9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v0 is 10                                : seen 
     => v0 min 10

v1 is 10                                : seen 
     => v1 min 10

v2 is 10                                : seen 
     => v2 min 10

[min(v0,10)]
[min(v1,10)]
[min(v2,10)]=> if v3 > 8 then v0 + v1 + v2 + v3 < 38

38 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>8,v0+(v1+(v2+v3))<38)]=> v3 is 8



********** no reduction after move 2 **********

