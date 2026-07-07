ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,camille).
partie(0,'../parties_joueur/camille/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,1,[c(0,green,10,40.22,non,moins),c(1,red,8,96.15,non,plus),c(2,yellow,9,19.89,non,plus),c(3,blue,8,5.09,non,moins)]),
     coup(2,1,1,[c(0,red,9,7.95,oui,oui),c(1,blue,9,28.78,oui,oui),c(2,green,10,26.4,oui,oui),c(3,yellow,7,9.59,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

8 < v1                                  : answer of the system 
v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 in [9,10]

[dans(v1,[9,10])]=> v1 max 10

v2 > 9                                  : answer of the system 
     => v2 max 10

v3 < 8                                  : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7]

[dans(v3,[5,6,7])]=> v3 max 7

[max(v1,10)]
[max(v2,10)]
[max(v3,7)]=> if v0 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<8,v0+(v1+(v2+v3))<35)]=> v0 in [8,9]

v0 in [8,9]                             : seen 
     => v0 max 9

v1 max 10                               : seen 
v2 max 10                               : seen 
[max(v0,9)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<35)]=> v3 in [6,7]

[dans(v0,[8,9])]
[dans(v3,[6,7])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : seen 
c3 avant c0                             : connu_simplification_equivalence 
yellow avant red                        : intial constraint 
c0 in [blue,red,yellow]                 : seen 
blue meme_rang red                      : intial constraint 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c0 \= c3                                : seen 
blue avant green                        : intial constraint 
c3 avant c0                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
c0 in [blue,red,yellow]                 : seen 
[dans(c3,[green,yellow])]=> c3 is yellow

c0 \= c3                                : intial constraint 
[avant(c3,c0)]
[dans(c0,[blue,red,yellow])]
[dans(c3,[yellow])]=> c0 in [blue,red]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

v0 < 10                                 : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [5,6,7,8,9]

v2 is 10                                : seen 
[dans(v0,[5,6,7,8,9])]=> v0 < v2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[v0<v2]=> c0 avant c2

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : seen 
c0 avant c2                             : connu_simplification_equivalence 
c0 in [blue,red]                        : seen 
blue meme_rang red                      : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c0 \= c2                                : intial constraint 
c0 in [blue,red]                        : seen 
blue meme_rang red                      : seen 
[avant(c0,c2)]
[dans(c2,[blue,green])]=> c2 is green

c1 \= c2                                : intial constraint 
[dans(c1,[blue,green])]
[dans(c2,[green])]=> c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c1,[blue])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 in [8,9]                             : seen 
v1 in [9,10]                            : seen 
[v0=v1]=> v0 is 9
v1 is 9


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v0 = v1                                 : connu_simplification_equivalence 
v0 in [8,9]                             : seen 
v1 in [9,10]                            : seen 
     => v0 is 9
v1 is 9


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v0 = v1                                 : connu_simplification_equivalence 
v0 in [8,9]                             : seen 
v1 in [9,10]                            : seen 
     => v0 is 9
v1 is 9

[dans(v0,[9]),dans(v1,[9])]=> v1 max 9

v0 max 9                                : seen 
v2 max 10                               : seen 
[max(v1,9)]=> if v3 < 7 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<7,v0+(v1+(v2+v3))<35)]=> v3 is 7



********** no reduction after move 2 **********

