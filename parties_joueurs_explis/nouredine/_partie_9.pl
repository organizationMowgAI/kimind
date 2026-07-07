ident(9,'30yellow<blue<green<red0green81blue72yellow53red10').
joueur(9,nouredine).
partie(9,'../parties_joueur/nouredine/_partie_9').
somme(9,30).
ordre_couleurs(9,[yellow,<,blue,<,green,<,red]).
solution(9,[c(0,green,8),c(1,blue,7),c(2,yellow,5),c(3,red,10)]).
nb_solutions(9,120).
cartes_jouees(9,
   [
     coup(1,120,2,[c(0,yellow,4,49.48,non,plus),c(1,blue,7,8.7,oui,oui),c(2,green,9,17.24,non,moins),c(3,red,10,10.65,oui,oui)]),
     coup(2,2,1,[c(0,green,9,14.17,oui,moins),c(2,yellow,4,7.09,oui,plus)]),
     coup(3,1,1,[c(0,green,8,60.92,oui,oui),c(2,yellow,5,6.55,oui,oui)])
   ]
            ).
resultat(9,gagne).

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

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[green,red])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9] : 

green avant red                         : intial constraint 
c0 is green                             : seen 
c3 is red                               : seen 
     => c0 avant c3

c0 avant c3 <=> v0 < v3                 : intial constraint 
[avant(c0,c3)]=> v0 < v3

blue avant green                        : intial constraint 
c0 is green                             : seen 
c1 is blue                              : seen 
     => c1 avant c0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[avant(c1,c0)]=> v1 < v0

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]

v1 is 7                                 : answer of the system 
[v1<v0]
[dans(v0,[5,6,7,8,9,10])]=> v0 in [8,9,10]

v3 is 10                                : answer of the system 
[v0<v3]
[dans(v0,[8,9,10])]=> v0 in [8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 7 : 

v1 is 7                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v0 in [8,9]                             : seen 
     => v0 max 9

v1 is 7                                 : seen 
     => v1 max 7

v3 is 10                                : seen 
     => v3 max 10

[max(v0,9)]
[max(v1,7)]
[max(v3,10)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<4,v0+(v1+(v2+v3))<30)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 8 : 

v0 < 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 > 4                                  : answer of the system 



********** no reduction after move 3 **********

