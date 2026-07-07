ident(7,'36blue<yellow=green=red0yellow101blue62green103red10').
joueur(7,henry).
partie(7,'../parties_joueur/henry/_partie_7').
somme(7,36).
ordre_couleurs(7,[blue,<,yellow,=,green,=,red]).
solution(7,[c(0,yellow,10),c(1,blue,6),c(2,green,10),c(3,red,10)]).
nb_solutions(7,24).
cartes_jouees(7,
   [
     coup(1,24,1,[c(0,blue,4,99.44,non,plus),c(1,yellow,8,6.75,non,moins),c(2,green,8,5.29,oui,plus),c(3,red,8,6.83,oui,plus)]),
     coup(2,1,1,[c(0,yellow,10,11.36,oui,oui),c(1,blue,6,9.89,oui,oui),c(2,green,10,2.71,oui,oui),c(3,red,10,59.8,oui,oui)])
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

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is in [9,10] : 

v1 < 8                                  : answer of the system 
v1 in [6,7,8,9,10]                      : known domain 
     => v1 in [6,7]

[dans(v1,[6,7])]=> v1 max 7

8 < v2                                  : answer of the system 
v2 in [6,7,8,9,10]                      : known domain 
     => v2 in [9,10]

[dans(v2,[9,10])]=> v2 max 10

8 < v3                                  : answer of the system 
v3 in [6,7,8,9,10]                      : known domain 
     => v3 in [9,10]

[dans(v3,[9,10])]=> v3 max 10

[max(v1,7)]
[max(v2,10)]
[max(v3,10)]=> if v0 < 9 then v0 + v1 + v2 + v3 < 36

36 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<9,v0+(v1+(v2+v3))<36)]=> v0 in [9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is in [6,7] : 

v1 in [6,7]                             : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v2 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [9,10] : 

v3 in [9,10]                            : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 6 : 

v1 is 6                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : answer of the system 


