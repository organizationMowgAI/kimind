ident(7,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(7,david).
partie(7,'../parties_joueur/david/_partie_7').
somme(7,36).
ordre_couleurs(7,[blue,<,yellow,=,green,=,red]).
solution(7,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(7,24).
cartes_jouees(7,
   [
     coup(1,24,1,[c(0,yellow,10,70.77,oui,oui),c(1,green,10,7.26,non,moins),c(2,red,10,4.84,non,oui),c(3,blue,6,4.55,non,plus)]),
     coup(2,1,1,[c(1,blue,6,54.3,oui,oui),c(2,green,10,4.35,oui,oui),c(3,red,10,4.85,oui,oui)])
   ]
            ).
resultat(7,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : seen 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

v0 is 10                                : seen 
v2 is 10                                : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
blue avant yellow                       : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green])]
[meme_rang(c0,c2)]=> c2 is green

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
[dans(c2,[green])]
[dans(c3,[green,red])]=> c3 is red

c1 \= c3                                : intial constraint 
[dans(c1,[blue,red])]
[dans(c3,[red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v0 is 10                                : seen 
     => v0 min 10

v2 is 10                                : seen 
     => v2 min 10

c0 is yellow                            : seen 
c3 in [green,red]                       : seen 
     => c0 meme_rang c3

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

