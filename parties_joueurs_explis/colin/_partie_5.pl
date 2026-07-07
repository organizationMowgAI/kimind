ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,colin).
partie(5,'../parties_joueur/colin/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,1,[c(0,green,2,18.44,oui,oui),c(1,red,2,3.22,non,plus),c(2,yellow,5,4.03,non,moins),c(3,blue,1,2.14,oui,oui)]),
     coup(2,1,1,[c(1,yellow,5,6.79,oui,oui),c(2,red,2,1.9,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c1,[blue,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v0 is 2                                 : seen 
     => v0 max 2

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is green                             : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,red])]=> c2 is red

c0 is green                             : seen 
green meme_rang red                     : intial constraint 
[dans(c2,[red])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 2                                 : seen 
[v0=v2]=> v2 is 2

[dans(v2,[2])]=> v2 max 2

v3 is 1                                 : answer of the system 
     => v3 max 1

[max(v0,2)]
[max(v2,2)]
[max(v3,1)]=> if v1 < 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<5,v0+(v1+(v2+v3))<10)]=> v1 is 5


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

