ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,ouwais).
partie(18,'../parties_joueur/ouwais/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,8,[c(0,green,2,5.69,non,plus),c(1,red,4,15.45,non,plus),c(2,yellow,5,22.46,non,moins),c(3,blue,5,3.31,non,moins)]),
     coup(2,8,1,[c(0,yellow,6,73.13,oui,moins),c(1,blue,6,4.84,oui,moins),c(2,red,3,3.1,oui,plus),c(3,green,2,5.42,oui,oui)]),
     coup(3,1,1,[c(0,yellow,5,14.91,oui,oui),c(1,blue,5,0.98,oui,oui),c(2,red,4,8.36,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [3,4,5,6,7,8,9] : 

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 min 5

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 min 1

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

[min(v1,5)]
[min(v2,1)]
[min(v3,1)]=> if v0 > 9 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>9,v0+(v1+(v2+v3))<16)]=> v0 in [3,4,5,6,7,8,9]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,yellow] : 

v1 in [5,6,7,8,9,10]                    : seen 
v2 in [1,2,3,4]                         : seen 
     => v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
green avant blue                        : intial constraint 
c1 in [blue,green,yellow]               : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[blue,green,red])]=> c2 in [green,red]

c1 \= c2                                : intial constraint 
green avant red                         : intial constraint 
[avant(c2,c1)]
[dans(c1,[blue,green,yellow])]
[dans(c2,[green,red])]=> c1 in [blue,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [5,6,7,8,9,10] : 

v1 in [5,6,7,8,9,10]                    : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red] : 

c2 in [green,red]                       : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4] : 

v2 in [1,2,3,4]                         : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

v1 in [5,6,7,8,9,10]                    : seen 
v3 in [1,2,3,4]                         : seen 
     => v3 < v1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[v3<v1]=> c3 avant c1

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c1 in [blue,yellow]                     : seen 
blue meme_rang yellow                   : seen 
[avant(c3,c1)]
[dans(c3,[green,red,yellow])]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [1,2,3,4] : 

v3 in [1,2,3,4]                         : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v1 < 6                                  : answer of the system 
     => v1 max 5

v2 > 3                                  : answer of the system 
     => v2 max 4

v3 is 2                                 : answer of the system 
     => v3 max 2

[max(v1,5)]
[max(v2,4)]
[max(v3,2)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<16)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 3 **********

