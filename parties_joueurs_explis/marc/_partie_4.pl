ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,marc).
partie(4,'../parties_joueur/marc/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,4,[c(0,red,4,68.62,non,plus),c(1,yellow,7,2.64,non,plus),c(2,green,9,2.68,non,plus),c(3,blue,10,3.15,non,moins)]),
     coup(2,4,1,[c(0,yellow,7,4.17,oui,oui),c(1,green,9,2.85,oui,moins),c(2,blue,10,2.16,oui,oui),c(3,red,4,17.59,oui,plus)]),
     coup(3,1,1,[c(1,green,8,1.68,oui,oui),c(3,red,5,15.95,oui,oui)])
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

the value (v0) of the card in position 0 is in [5,6,7,8,9,10] : 

4 < v0                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [5,6,7,8,9,10]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

7 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [8,9,10]

v0 in [5,6,7,8,9,10]                    : seen 
     => v0 min 5

v1 in [8,9,10]                          : seen 
     => v1 min 8

v2 > 9                                  : answer of the system 
     => v2 min 10

[min(v0,5)]
[min(v1,8)]
[min(v2,10)]=> if v3 > 7 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3>7,v0+(v1+(v2+v3))<30)]=> v3 in [1,2,3,4,5,6,7]

[dans(v1,[8,9,10])]
[dans(v3,[1,2,3,4,5,6,7])]=> v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
red avant green                         : intial constraint 
red avant yellow                        : intial constraint 
[avant(c3,c1)]
[dans(c1,[blue,green,red])]
[dans(c3,[green,red,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

v3 < 10                                 : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6,7,8,9]

v2 is 10                                : seen 
[dans(v3,[1,2,3,4,5,6,7,8,9])]=> v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
red avant green                         : seen 
red avant yellow                        : seen 
c3 in [green,red,yellow]                : seen 
[avant(c3,c2)]
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red,yellow] : 

c3 in [green,red,yellow]                : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4,5,6,7] : 

v3 in [1,2,3,4,5,6,7]                   : connu_somme_trop_grande 



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

v1 < 9                                  : answer of the system 


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

v0 is 7                                 : seen 
     => v0 min 7

v1 is 8                                 : seen 
     => v1 min 8

[min(v0,7)]
[min(v1,8)]=> if v3 > 5 then v0 + v1 + v3 < 20

20 = v0 + v1 + v3                       : intial constraint 
[si_alors(v3>5,v0+(v1+v3)<20)]=> v3 is 5



********** no reduction after move 3 **********

