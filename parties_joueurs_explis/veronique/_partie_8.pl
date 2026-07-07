ident(8,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(8,veronique).
partie(8,'../parties_joueur/veronique/_partie_8').
somme(8,36).
ordre_couleurs(8,[blue,<,yellow,=,green,=,red]).
solution(8,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(8,24).
cartes_jouees(8,
   [
     coup(1,24,3,[c(0,blue,6,31.3,non,plus),c(1,red,10,3.55,non,moins),c(2,yellow,10,3.03,non,oui),c(3,green,10,4.09,non,oui)]),
     coup(2,3,1,[c(0,yellow,10,26.65,oui,oui),c(1,blue,6,16.23,oui,oui),c(2,green,10,9.9,oui,oui),c(3,red,10,2.21,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

v2 is 10                                : answer of the system 
v3 is 10                                : answer of the system 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
blue avant red                          : intial constraint 
blue avant yellow                       : intial constraint 
[dans(c2,[blue,green,red])]
[dans(c3,[blue,red,yellow])]
[meme_rang(c2,c3)]=> c2 in [green,red]

c0 in [green,red,yellow]                : seen 
[dans(c2,[green,red])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

6 < v0                                  : answer of the system 
v0 in [6,7,8,9,10]                      : known domain 
     => v0 in [7,8,9,10]

v2 is 10                                : seen 
[v0=v2]
[dans(v0,[7,8,9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

v1 < 10                                 : answer of the system 
v1 in [6,7,8,9,10]                      : known domain 
     => v1 in [6,7,8,9]

v2 is 10                                : seen 
[dans(v1,[6,7,8,9])]=> v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
c2 in [green,red]                       : seen 
green meme_rang yellow                  : intial constraint 
red meme_rang yellow                    : intial constraint 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 in [green,red]                       : seen 
green meme_rang red                     : intial constraint 
[avant(c1,c2)]
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v0 is 10                                : seen 
     => v0 min 10

v2 is 10                                : seen 
     => v2 min 10

v3 is 10                                : seen 
     => v3 min 10

[min(v0,10)]
[min(v2,10)]
[min(v3,10)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 36

36 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>6,v0+(v1+(v2+v3))<36)]=> v1 is 6


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 in [green,red]                       : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [red,yellow] : 

c2 \= c3                                : seen 
blue avant green                        : intial constraint 
blue avant red                          : seen 
c2 in [green,red]                       : seen 
c3 in [blue,red,yellow]                 : seen 
c2 meme_rang c3                         : connu_simplification_equivalence 
     => c3 in [red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



