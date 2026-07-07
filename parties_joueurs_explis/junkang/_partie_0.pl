ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,junkang).
partie(0,'../parties_joueur/junkang/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,1,[c(0,yellow,7,43.08,non,plus),c(1,red,9,6.16,non,oui),c(2,blue,9,3.68,non,plus),c(3,green,10,3.6,non,moins)]),
     coup(2,1,1,[c(0,red,9,3.31,oui,oui),c(1,blue,9,10.95,oui,oui),c(2,green,10,6.97,oui,oui),c(3,yellow,7,7.92,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

7 < v0                                  : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [8,9,10]

[dans(v0,[8,9,10])]=> v0 max 10

v1 is 9                                 : seen 
     => v1 max 9

v2 > 9                                  : answer of the system 
     => v2 max 10

[max(v0,10)]
[max(v1,9)]
[max(v2,10)]=> if v3 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<6,v0+(v1+(v2+v3))<35)]=> v3 in [6,7,8]

v1 is 9                                 : answer of the system 
[dans(v3,[6,7,8])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

v1 is 9                                 : seen 
v2 is 10                                : seen 
     => v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : intial constraint 
red avant green                         : intial constraint 
yellow avant green                      : intial constraint 
[avant(c1,c2)]
[dans(c1,[blue,green,yellow])]
[dans(c2,[green,red,yellow])]=> c1 in [blue,yellow]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : seen 
c3 avant c1                             : connu_simplification_equivalence 
yellow avant red                        : intial constraint 
c1 in [blue,yellow]                     : seen 
blue meme_rang red                      : intial constraint 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,yellow]

c1 \= c3                                : seen 
c3 avant c1                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c1 in [blue,yellow]                     : seen 
[dans(c3,[blue,yellow])]=> c3 is yellow

c1 \= c3                                : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,yellow])]
[dans(c3,[yellow])]=> c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,green,red])]
[dans(c1,[blue])]=> c0 in [green,red]

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
yellow avant blue                       : seen 
c1 in [blue,yellow]                     : seen 
c2 in [green,red,yellow]                : seen 
     => c2 in [green,red]

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
c1 is blue                              : seen 
blue meme_rang red                      : seen 
[dans(c2,[green,red])]=> c2 is green

c0 \= c2                                : intial constraint 
[dans(c0,[green,red])]
[dans(c2,[green])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 in [8,9,10]                          : seen 
v1 is 9                                 : seen 
[v0=v1]=> v0 is 9


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


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

v0 is 9                                 : seen 
     => v0 max 9

v1 max 9                                : seen 
v2 max 10                               : seen 
[max(v0,9)]=> if v3 < 7 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<7,v0+(v1+(v2+v3))<35)]=> v3 is 7



********** no reduction after move 2 **********

