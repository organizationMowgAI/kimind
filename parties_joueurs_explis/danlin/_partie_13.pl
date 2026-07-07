ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,danlin).
partie(13,'../parties_joueur/danlin/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,1,[c(0,yellow,10,3.78,non,oui),c(1,blue,8,2.49,non,plus),c(2,green,10,36.26,oui,oui),c(3,red,10,2.51,non,moins)]),
     coup(2,1,1,[c(0,red,10,4.89,oui,oui),c(1,yellow,10,4.51,oui,oui),c(3,blue,8,12.9,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c2                                : seen 
c2 is green                             : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [blue,red]

v0 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
c2 is green                             : seen 
[dans(c0,[blue,red])]
[meme_rang(c0,c2)]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[green,red,yellow])]=> c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

c1 in [red,yellow]                      : seen 
c2 is green                             : seen 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

8 < v1                                  : answer of the system 
v1 in [8,9,10]                          : known domain 
     => v1 in [9,10]

v2 is 10                                : seen 
[v1=v2]
[dans(v1,[9,10])]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue


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

