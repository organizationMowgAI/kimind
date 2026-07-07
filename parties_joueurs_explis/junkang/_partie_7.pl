ident(7,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(7,junkang).
partie(7,'../parties_joueur/junkang/_partie_7').
somme(7,36).
ordre_couleurs(7,[blue,<,yellow,=,green,=,red]).
solution(7,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(7,24).
cartes_jouees(7,
   [
     coup(1,24,1,[c(0,blue,6,11.02,non,plus),c(1,green,10,2.1,non,moins),c(2,yellow,10,2.09,non,oui),c(3,red,10,1.87,oui,oui)]),
     coup(2,1,1,[c(0,yellow,10,2.47,oui,oui),c(1,blue,6,10.45,oui,oui),c(2,green,10,5.38,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c2 \= c3                                : seen 
c3 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

v2 is 10                                : answer of the system 
v3 is 10                                : answer of the system 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
blue avant red                          : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,green])]
[meme_rang(c2,c3)]=> c2 is green

c0 \= c2                                : intial constraint 
[dans(c0,[green,yellow])]
[dans(c2,[green])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 in [green,yellow]                    : seen 
c3 is red                               : seen 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

6 < v0                                  : answer of the system 
v0 in [6,7,8,9,10]                      : known domain 
     => v0 in [7,8,9,10]

v3 is 10                                : seen 
[v0=v3]
[dans(v0,[7,8,9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,yellow])]=> c1 is blue


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

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

