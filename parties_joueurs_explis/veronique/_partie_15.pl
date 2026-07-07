ident(15,'24yellow<red<blue<green0yellow31red52green93blue7').
joueur(15,veronique).
partie(15,'../parties_joueur/veronique/_partie_15').
somme(15,24).
ordre_couleurs(15,[yellow,<,red,<,blue,<,green]).
solution(15,[c(0,yellow,3),c(1,red,5),c(2,green,9),c(3,blue,7)]).
nb_solutions(15,384).
cartes_jouees(15,
   [
     coup(1,384,3,[c(0,yellow,3,43.84,oui,oui),c(1,red,6,3.15,oui,moins),c(2,blue,7,3.62,non,plus),c(3,green,8,3.56,non,moins)]),
     coup(2,3,1,[c(1,red,5,49.97,oui,oui),c(2,green,9,22.75,oui,oui),c(3,blue,7,3.5,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5] : 

v0 is 3                                 : seen 
     => v0 max 3

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 max 10

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 max 7

[max(v0,3)]
[max(v2,10)]
[max(v3,7)]=> if v1 < 4 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<4,v0+(v1+(v2+v3))<24)]=> v1 in [4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
c1 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is in [9,10] : 

v1 in [4,5]                             : seen 
     => v1 max 5

v0 max 3                                : seen 
v3 max 7                                : seen 
[max(v1,5)]=> if v2 < 9 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<9,v0+(v1+(v2+v3))<24)]=> v2 in [9,10]


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c1 \= c3                                : intial constraint 
c1 is red                               : seen 
[dans(c3,[blue,red])]=> c3 is blue


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7] : 

v0 max 3                                : seen 
v1 max 5                                : seen 
v2 max 10                               : seen 
     => if v3 < 6 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<6,v0+(v1+(v2+v3))<24)]=> v3 in [6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 9 : 

v2 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


