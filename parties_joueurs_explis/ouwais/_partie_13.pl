ident(13,'38blue<red=yellow=green0red101yellow102green103blue8').
joueur(13,ouwais).
partie(13,'../parties_joueur/ouwais/_partie_13').
somme(13,38).
ordre_couleurs(13,[blue,<,red,=,yellow,=,green]).
solution(13,[c(0,red,10),c(1,yellow,10),c(2,green,10),c(3,blue,8)]).
nb_solutions(13,24).
cartes_jouees(13,
   [
     coup(1,24,3,[c(0,green,10,2.34,non,oui),c(1,blue,2,38.76,non,plus),c(2,red,10,10.57,non,oui),c(3,yellow,10,1.35,non,moins)]),
     coup(2,3,1,[c(0,red,10,2.7,oui,oui),c(1,green,10,3.32,non,oui),c(2,yellow,10,6.44,non,oui),c(3,blue,8,23.33,oui,oui)]),
     coup(3,1,1,[c(1,yellow,10,1.06,oui,oui),c(2,green,10,7.52,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

v0 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
blue avant yellow                       : intial constraint 
[dans(c0,[blue,red,yellow])]
[dans(c2,[blue,green,yellow])]
[meme_rang(c0,c2)]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

c0 in [red,yellow]                      : seen 
c1 in [green,red,yellow]                : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 is 10                                : seen 
[v0=v1]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,yellow] : 

c0 \= c2                                : seen 
blue avant red                          : intial constraint 
blue avant yellow                       : seen 
c0 in [red,yellow]                      : seen 
c2 in [blue,green,yellow]               : seen 
c0 meme_rang c2                         : connu_simplification_equivalence 
     => c2 in [green,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

v3 < 10                                 : answer of the system 
v3 in [8,9,10]                          : known domain 
     => v3 in [8,9]

v0 is 10                                : seen 
[dans(v3,[8,9])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : seen 
c3 avant c0                             : connu_simplification_equivalence 
c0 in [red,yellow]                      : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c0 \= c3                                : intial constraint 
c0 in [red,yellow]                      : seen 
green meme_rang red                     : intial constraint 
green meme_rang yellow                  : intial constraint 
[avant(c3,c0)]
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



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= green                             : answer of the system 
c1 in [green,red,yellow]                : known domain 
     => c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
c0 meme_rang c1                         : intial constraint 
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 



********** no reduction after move 3 **********

