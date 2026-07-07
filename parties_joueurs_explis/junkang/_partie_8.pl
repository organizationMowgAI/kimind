ident(8,'24blue<green<yellow<red0red91green52yellow73blue3').
joueur(8,junkang).
partie(8,'../parties_joueur/junkang/_partie_8').
somme(8,24).
ordre_couleurs(8,[blue,<,green,<,yellow,<,red]).
solution(8,[c(0,red,9),c(1,green,5),c(2,yellow,7),c(3,blue,3)]).
nb_solutions(8,384).
cartes_jouees(8,
   [
     coup(1,384,2,[c(0,red,9,27.6,oui,oui),c(1,yellow,8,2.84,non,moins),c(2,green,4,11.58,non,plus),c(3,blue,3,2.35,oui,oui)]),
     coup(2,2,1,[c(1,green,5,4.03,oui,oui),c(2,yellow,7,34.84,oui,oui)])
   ]
            ).
resultat(8,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

c1 \= c3                                : intial constraint 
c3 is blue                              : answer of the system 
[dans(c1,[blue,green])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [4,5,6,7] : 

v0 is 9                                 : seen 
     => v0 max 9

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

c2 \= c3                                : intial constraint 
c3 is blue                              : seen 
[dans(c2,[blue,yellow])]=> c2 is yellow

yellow avant red                        : intial constraint 
c0 is red                               : seen 
[dans(c2,[yellow])]=> c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

4 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [5,6,7,8,9,10]

v0 is 9                                 : seen 
[v2<v0]
[dans(v2,[5,6,7,8,9,10])]=> v2 in [5,6,7,8]

[dans(v2,[5,6,7,8])]=> v2 max 8

v3 is 3                                 : answer of the system 
     => v3 max 3

[max(v0,9)]
[max(v2,8)]
[max(v3,3)]=> if v1 < 4 then v0 + v1 + v2 + v3 < 24

24 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<4,v0+(v1+(v2+v3))<24)]=> v1 in [4,5,6,7]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [5,6,7,8] : 

v2 in [5,6,7,8]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 is 7                                 : answer of the system 


