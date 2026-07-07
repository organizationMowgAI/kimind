ident(1,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(1,veronique).
partie(1,'../parties_joueur/veronique/_partie_1').
somme(1,35).
ordre_couleurs(1,[yellow,<,red,=,blue,<,green]).
solution(1,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(1,24).
cartes_jouees(1,
   [
     coup(1,24,1,[c(0,green,10,80.2,non,moins),c(1,blue,9,9.4,oui,oui),c(2,red,9,5.51,non,plus),c(3,yellow,7,8.48,oui,oui)]),
     coup(2,1,1,[c(0,red,9,25.43,oui,oui),c(2,green,10,5.01,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v1 is 9                                 : answer of the system 
     => v1 max 9

v2 > 9                                  : answer of the system 
     => v2 max 10

v3 is 7                                 : answer of the system 
     => v3 max 7

[max(v1,9)]
[max(v2,10)]
[max(v3,7)]=> if v0 < 9 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<9,v0+(v1+(v2+v3))<35)]=> v0 is 9


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c2 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : seen 



********** no reduction after move 2 **********

