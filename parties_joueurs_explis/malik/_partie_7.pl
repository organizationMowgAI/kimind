ident(7,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(7,malik).
partie(7,'../parties_joueur/malik/_partie_7').
somme(7,36).
ordre_couleurs(7,[blue,<,yellow,=,green,=,red]).
solution(7,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(7,24).
cartes_jouees(7,
   [
     coup(1,24,3,[c(0,red,10,162.92,non,oui),c(1,green,10,3.25,non,moins),c(2,yellow,10,3.11,non,oui),c(3,blue,6,2.77,non,plus)]),
     coup(2,3,1,[c(0,green,10,6.2,non,oui),c(1,blue,6,29.63,oui,oui),c(2,red,10,25.89,non,oui),c(3,yellow,10,2.14,non,oui)]),
     coup(3,1,1,[c(0,yellow,10,10.78,oui,oui),c(2,green,10,1.29,oui,oui),c(3,red,10,39.35,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

v0 is 10                                : answer of the system 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
blue avant green                        : intial constraint 
blue avant red                          : intial constraint 
[dans(c0,[blue,green,yellow])]
[dans(c2,[blue,green,red])]
[meme_rang(c0,c2)]=> c0 in [green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

v1 < 10                                 : answer of the system 
v1 in [6,7,8,9,10]                      : known domain 
     => v1 in [6,7,8,9]

v0 is 10                                : seen 
[dans(v1,[6,7,8,9])]=> v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
c0 in [green,yellow]                    : seen 
green meme_rang yellow                  : intial constraint 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c0 \= c1                                : intial constraint 
c0 in [green,yellow]                    : seen 
green meme_rang red                     : intial constraint 
red meme_rang yellow                    : intial constraint 
[avant(c1,c0)]
[dans(c1,[blue,red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v0 is 10                                : seen 
     => v0 min 10

v2 is 10                                : seen 
     => v2 min 10

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 in [green,yellow]                    : seen 
[dans(c3,[green,red,yellow])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 is 10                                : seen 
[v0=v3]=> v3 is 10

[dans(v3,[10])]=> v3 min 10

[min(v0,10)]
[min(v2,10)]
[min(v3,10)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 36

36 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>6,v0+(v1+(v2+v3))<36)]=> v1 is 6


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c0 \= c2                                : seen 
blue avant green                        : seen 
blue avant yellow                       : intial constraint 
c0 in [green,yellow]                    : seen 
c2 in [blue,green,red]                  : seen 
c0 meme_rang c2                         : connu_simplification_equivalence 
     => c2 in [green,red]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

c3 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= yellow                            : answer of the system 
c3 in [green,red,yellow]                : known domain 
     => c3 in [green,red]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
c2 meme_rang c3                         : intial constraint 
[dans(c3,[green,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

