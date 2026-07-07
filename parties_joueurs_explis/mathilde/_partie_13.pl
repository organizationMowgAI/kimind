ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,mathilde).
partie(13,'../parties_joueur/mathilde/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,3,[c(0,blue,8,3.53,non,plus),c(1,red,10,3.13,non,oui),c(2,yellow,10,3.28,non,oui),c(3,green,10,9.29,non,moins)]),
     coup(2,3,1,[c(0,red,10,8.95,oui,oui),c(1,yellow,10,2.44,oui,oui),c(2,green,10,2.71,oui,oui),c(3,blue,8,11.65,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

v1 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v1 = v2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[v1=v2]=> c1 meme_rang c2

c1 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
blue avant red                          : intial constraint 
[dans(c1,[blue,green,yellow])]
[dans(c2,[blue,green,red])]
[meme_rang(c1,c2)]=> c1 in [green,yellow]

c0 in [green,red,yellow]                : seen 
[dans(c1,[green,yellow])]=> c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

8 < v0                                  : answer of the system 
v0 in [8,9,10]                          : known domain 
     => v0 in [9,10]

v1 is 10                                : seen 
[v0=v1]
[dans(v0,[9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,yellow] : 

c1 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c1 \= c2                                : seen 
blue avant green                        : seen 
blue avant yellow                       : intial constraint 
c1 in [green,yellow]                    : seen 
c2 in [blue,green,red]                  : seen 
c1 meme_rang c2                         : connu_simplification_equivalence 
     => c2 in [green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

v3 < 10                                 : answer of the system 
v3 in [8,9,10]                          : known domain 
     => v3 in [8,9]

v1 is 10                                : seen 
[dans(v3,[8,9])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : seen 
c3 avant c1                             : connu_simplification_equivalence 
c1 in [green,yellow]                    : seen 
green meme_rang red                     : intial constraint 
red meme_rang yellow                    : intial constraint 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 in [green,yellow]                    : seen 
green meme_rang yellow                  : intial constraint 
[avant(c3,c1)]
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



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 



