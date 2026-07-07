ident(1,'32green<yellow<blue<red0red101blue92yellow73green6').
joueur(1,malik).
partie(1,'../parties_joueur/malik/_partie_1').
somme(1,32).
ordre_couleurs(1,[green,<,yellow,<,blue,<,red]).
solution(1,[c(0,red,10),c(1,blue,9),c(2,yellow,7),c(3,green,6)]).
nb_solutions(1,48).
cartes_jouees(1,
   [
     coup(1,48,1,[c(0,red,10,261.3,oui,oui),c(1,blue,9,6.62,oui,oui),c(2,yellow,8,4.18,oui,moins),c(3,green,5,4.2,oui,plus)]),
     coup(2,1,1,[c(2,yellow,7,18.53,oui,oui),c(3,green,6,1.85,oui,oui)])
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

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

green avant yellow                      : intial constraint 
c2 is yellow                            : seen 
c3 is green                             : answer of the system 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v0 is 10                                : seen 
     => v0 max 10

v1 is 9                                 : seen 
     => v1 max 9

green avant blue                        : intial constraint 
c1 is blue                              : seen 
c3 is green                             : seen 
     => c3 avant c1

c3 avant c1 <=> v3 < v1                 : intial constraint 
[avant(c3,c1)]=> v3 < v1

green avant red                         : intial constraint 
c0 is red                               : seen 
c3 is green                             : seen 
     => c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

5 < v3                                  : answer of the system 
v3 in [2,3,4,5,6,7,8,9,10]              : known domain 
     => v3 in [6,7,8,9,10]

v0 is 10                                : seen 
[v3<v0]
[dans(v3,[6,7,8,9,10])]=> v3 in [6,7,8,9]

v1 is 9                                 : seen 
[v3<v1]
[dans(v3,[6,7,8,9])]=> v3 in [6,7,8]

[dans(v3,[6,7,8])]=> v3 max 8

[max(v0,10)]
[max(v1,9)]
[max(v3,8)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 32

32 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2<5,v0+(v1+(v2+v3))<32)]=> v2 in [5,6,7]

v3 in [6,7,8]                           : seen 
[v3<v2]
[dans(v2,[5,6,7])]=> v2 is 7
v3 is 6


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 6 : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [5,6,7]                           : seen 
v3 in [6,7,8]                           : seen 
     => v2 is 7
v3 is 6



********** no reduction after move 2 **********

