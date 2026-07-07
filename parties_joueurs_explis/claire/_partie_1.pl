ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,claire).
partie(1,'../parties_joueur/claire/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,1,[c(0,blue,9,3.97,non,plus),c(1,red,10,2.91,non,moins),c(2,yellow,7,136.37,oui,oui),c(3,green,6,3.96,oui,oui)]),
     coup(2,1,1,[c(0,red,10,3.45,oui,oui),c(1,blue,9,11.56,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,red]

c0 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c0,[green,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v0 is 10                                : seen 
     => v0 max 10

v2 is 7                                 : answer of the system 
     => v2 max 7

v3 is 6                                 : answer of the system 
     => v3 max 6

[max(v0,10)]
[max(v2,7)]
[max(v3,6)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<9,v0+(v1+(v2+v3))<32)]=> v1 is 9


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 is 6                                 : seen 



********** no reduction after move 2 **********

