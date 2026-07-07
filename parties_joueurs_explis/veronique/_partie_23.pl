ident(23,'38green=blue<yellow=red0yellow101red102green93blue9').
joueur(23,veronique).
partie(23,'../parties_joueur/veronique/_partie_23').
somme(23,38).
ordre_couleurs(23,[green,=,blue,<,yellow,=,red]).
solution(23,[c(0,yellow,10),c(1,red,10),c(2,green,9),c(3,blue,9)]).
nb_solutions(23,24).
cartes_jouees(23,
   [
     coup(1,24,1,[c(0,blue,9,14.46,non,plus),c(1,yellow,10,4.39,non,oui),c(2,green,9,5.13,oui,oui),c(3,red,10,3.15,non,moins)]),
     coup(2,1,1,[c(0,yellow,10,18.37,oui,oui),c(1,red,10,2.02,oui,oui),c(3,blue,9,20.23,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

v0 > 9                                  : answer of the system 
v1 is 10                                : answer of the system 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
blue avant red                          : intial constraint 
[dans(c0,[red,yellow])]
[dans(c1,[blue,red])]
[meme_rang(c0,c1)]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c0 \= c1                                : seen 
blue avant yellow                       : intial constraint 
c0 is yellow                            : seen 
c1 in [blue,red]                        : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
     => c1 is red


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[blue,green,yellow])]=> c3 in [blue,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,yellow])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is 9 : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 10                                : seen 
     => v1 max 10

v2 is 9                                 : seen 
     => v2 max 9

[max(v0,10)]
[max(v1,10)]
[max(v2,9)]=> if v3 < 9 then v0 + v1 + v2 + v3 < 38

38 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<9,v0+(v1+(v2+v3))<38)]=> v3 is 9



********** no reduction after move 2 **********

