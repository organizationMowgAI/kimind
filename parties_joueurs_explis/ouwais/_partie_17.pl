ident(17,'33red<yellow<green=blue0green101blue102red53yellow8').
joueur(17,ouwais).
partie(17,'../parties_joueur/ouwais/_partie_17').
somme(17,33).
ordre_couleurs(17,[red,<,yellow,<,green,=,blue]).
solution(17,[c(0,green,10),c(1,blue,10),c(2,red,5),c(3,yellow,8)]).
nb_solutions(17,96).
cartes_jouees(17,
   [
     coup(1,96,1,[c(0,yellow,8,3.95,non,plus),c(1,blue,9,27.72,oui,plus),c(2,red,6,5.64,oui,moins),c(3,green,9,4.15,non,moins)]),
     coup(2,1,1,[c(0,green,10,34.75,oui,oui),c(1,blue,10,1.1,oui,oui),c(2,red,5,13.2,oui,oui),c(3,yellow,8,3.94,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v1 > 9                                  : answer of the system 
     => v1 max 10

v2 < 6                                  : answer of the system 
v2 in [3,4,5,6,7,8,9,10]                : known domain 
     => v2 in [3,4,5]

[dans(v2,[3,4,5])]=> v2 max 5

v3 < 9                                  : answer of the system 
v3 in [3,4,5,6,7,8,9,10]                : known domain 
     => v3 in [3,4,5,6,7,8]

[dans(v3,[3,4,5,6,7,8])]=> v3 max 8

[max(v1,10)]
[max(v2,5)]
[max(v3,8)]=> if v0 < 10 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<10,v0+(v1+(v2+v3))<33)]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 is 10                                : seen 
     => v0 max 10

v1 max 10                               : seen 
v3 max 8                                : seen 
[max(v0,10)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<33)]=> v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[red,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v0 max 10                               : seen 
v1 max 10                               : seen 
v2 max 5                                : seen 
     => if v3 < 8 then v0 + v1 + v2 + v3 < 33

33 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<8,v0+(v1+(v2+v3))<33)]=> v3 is 8



********** no reduction after move 2 **********

