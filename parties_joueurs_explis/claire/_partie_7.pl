ident(7,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(7,claire).
partie(7,'../parties_joueur/claire/_partie_7').
somme(7,36).
ordre_couleurs(7,[blue,<,yellow,=,green,=,red]).
solution(7,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(7,24).
cartes_jouees(7,
   [
     coup(1,24,1,[c(0,green,10,35.59,non,oui),c(1,yellow,10,2.02,non,moins),c(2,blue,6,3.3,non,plus),c(3,red,10,2.85,oui,oui)]),
     coup(2,1,1,[c(0,yellow,10,7.23,oui,oui),c(1,blue,6,6.69,oui,oui),c(2,green,10,13.68,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c3                                : seen 
c3 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]

v0 is 10                                : answer of the system 
v3 is 10                                : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
blue avant red                          : intial constraint 
c3 is red                               : seen 
[dans(c0,[blue,yellow])]
[meme_rang(c0,c3)]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[green,yellow])]=> c2 is green

c1 \= c2                                : intial constraint 
[dans(c1,[blue,green])]
[dans(c2,[green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v0 is 10                                : seen 
     => v0 min 10

c2 in [green,yellow]                    : seen 
c3 is red                               : seen 
     => c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

6 < v2                                  : answer of the system 
v2 in [6,7,8,9,10]                      : known domain 
     => v2 in [7,8,9,10]

v3 is 10                                : seen 
[v2=v3]
[dans(v2,[7,8,9,10])]=> v2 is 10

[dans(v2,[10])]=> v2 min 10

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

