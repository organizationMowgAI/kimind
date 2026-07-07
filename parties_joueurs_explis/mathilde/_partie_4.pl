ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,mathilde).
partie(4,'../parties_joueur/mathilde/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,1,[c(0,red,3,5.09,non,plus),c(1,yellow,8,4.11,non,oui),c(2,green,9,3.6,non,plus),c(3,blue,10,16.25,non,moins)]),
     coup(2,1,1,[c(0,yellow,7,44.94,oui,oui),c(1,green,8,50.13,oui,oui),c(2,blue,10,14.12,oui,oui),c(3,red,4,42.34,oui,plus)]),
     coup(3,1,1,[c(3,red,5,7.88,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [4,5,6,7,8,9,10] : 

3 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [4,5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red] : 

v1 is 8                                 : answer of the system 
v2 > 9                                  : answer of the system 
     => v1 < v2

c1 avant c2 <=> v1 < v2                 : intial constraint 
[v1<v2]=> c1 avant c2

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
red avant blue                          : intial constraint 
yellow avant blue                       : intial constraint 
[avant(c1,c2)]
[dans(c1,[blue,green,red])]
[dans(c2,[blue,red,yellow])]=> c1 in [green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c1 \= c2                                : seen 
c1 avant c2                             : connu_simplification_equivalence 
red avant green                         : intial constraint 
c1 in [green,red]                       : seen 
c2 in [blue,red,yellow]                 : seen 
     => c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6,7,8] : 

v0 in [4,5,6,7,8,9,10]                  : seen 
     => v0 max 10

v1 is 8                                 : seen 
     => v1 max 8

v2 is 10                                : seen 
     => v2 max 10

[max(v0,10)]
[max(v1,8)]
[max(v2,10)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<2,v0+(v1+(v2+v3))<30)]=> v3 in [2,3,4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

12 = v0 + v3                            : intial constraint 
     => v3 is 5



********** no reduction after move 3 **********

