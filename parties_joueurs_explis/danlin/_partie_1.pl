ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,danlin).
partie(1,'../parties_joueur/danlin/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,2,[c(0,red,10,71.73,oui,oui),c(1,blue,9,4.86,oui,oui),c(2,green,5,3.58,non,plus),c(3,yellow,8,3.62,non,moins)]),
     coup(2,2,1,[c(2,green,8,19.6,non,moins),c(3,yellow,5,2.37,non,plus)]),
     coup(3,1,1,[c(2,yellow,8,19.77,oui,moins),c(3,green,5,4.83,oui,plus)]),
     coup(4,1,1,[c(2,yellow,7,6.09,oui,oui),c(3,green,6,1.65,oui,oui)])
   ]
            ).
resultat(1,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,yellow])]=> c2 is yellow


------------------------------------------------------------

the value (v2) of the card in position 2 is in [6,7,8] : 

yellow avant blue                       : intial constraint 
c1 is blue                              : seen 
c2 is yellow                            : seen 
     => c2 avant c1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[avant(c2,c1)]=> v2 < v1

yellow avant red                        : intial constraint 
c0 is red                               : seen 
c2 is yellow                            : seen 
     => c2 avant c0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[avant(c2,c0)]=> v2 < v0

5 < v2                                  : answer of the system 
v2 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v2 in [6,7,8,9,10]

v0 is 10                                : seen 
[v2<v0]
[dans(v2,[6,7,8,9,10])]=> v2 in [6,7,8,9]

v1 is 9                                 : seen 
[v2<v1]
[dans(v2,[6,7,8,9])]=> v2 in [6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is in [5,6,7] : 

v0 is 10                                : seen 
     => v0 max 10

v1 is 9                                 : seen 
     => v1 max 9

v2 in [6,7,8]                           : seen 
     => v2 max 8

[max(v0,10)]
[max(v1,9)]
[max(v2,8)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<32)]=> v3 in [5,6,7]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v2 < 8                                  : answer of the system 
v2 in [6,7,8]                           : known domain 
     => v2 in [6,7]

5 < v3                                  : answer of the system 
v3 in [5,6,7]                           : known domain 
     => v3 in [6,7]

v3 < v2                                 : intial constraint 
[dans(v2,[6,7])]
[dans(v3,[6,7])]=> v2 is 7
v3 is 6


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 < v2                                 : seen 
v2 in [6,7]                             : seen 
v3 in [6,7]                             : seen 
     => v2 is 7
v3 is 6



********** no reduction after move 3 **********

********** no reduction after move 4 **********

