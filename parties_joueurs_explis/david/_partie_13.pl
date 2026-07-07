ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,david).
partie(13,'../parties_joueur/david/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,1,[c(0,red,10,43.97,oui,oui),c(1,green,10,8.54,non,oui),c(2,blue,8,5.6,non,plus),c(3,yellow,10,1.92,non,moins)]),
     coup(2,1,1,[c(1,yellow,10,33.11,oui,oui),c(2,green,10,5.98,oui,oui),c(3,blue,8,5.31,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : seen 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

v0 is 10                                : seen 
v1 is 10                                : answer of the system 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
blue avant red                          : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,yellow])]
[meme_rang(c0,c1)]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
c1 is yellow                            : seen 
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

c0 is red                               : seen 
c2 in [green,yellow]                    : seen 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 10                                : seen 
[v0=v2]=> v2 is 10


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green])]=> c3 is blue


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

