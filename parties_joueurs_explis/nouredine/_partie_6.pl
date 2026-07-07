ident(6,'21yellow<red<green=blue0yellow21red32green83blue8').
joueur(6,nouredine).
partie(6,'../parties_joueur/nouredine/_partie_6').
somme(6,21).
ordre_couleurs(6,[yellow,<,red,<,green,=,blue]).
solution(6,[c(0,yellow,2),c(1,red,3),c(2,green,8),c(3,blue,8)]).
nb_solutions(6,168).
cartes_jouees(6,
   [
     coup(1,168,1,[c(0,yellow,2,55.58,oui,oui),c(1,red,5,5.63,oui,moins),c(2,green,7,4.14,oui,plus),c(3,blue,7,3.48,oui,plus)]),
     coup(2,1,1,[c(1,red,3,52.9,oui,oui),c(2,green,8,1.94,oui,oui),c(3,blue,8,3.58,oui,oui)])
   ]
            ).
resultat(6,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v0 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is red : 

c1 is red                               : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 3 : 

yellow avant red                        : intial constraint 
c0 is yellow                            : seen 
c1 is red                               : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v0 is 2                                 : seen 
     => v0 min 2

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 min 8

7 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [8,9,10]

[dans(v3,[8,9,10])]=> v3 min 8

[min(v0,2)]
[min(v2,8)]
[min(v3,8)]=> if v1 > 3 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>3,v0+(v1+(v2+v3))<21)]=> v1 in [1,2,3]

v0 is 2                                 : seen 
[v0<v1]
[dans(v1,[1,2,3])]=> v1 is 3


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v1 is 3                                 : seen 
     => v1 min 3

v0 min 2                                : connu_min 
v3 min 8                                : connu_min 
[min(v1,3)]=> if v2 > 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>8,v0+(v1+(v2+v3))<21)]=> v2 is 8


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 8 : 

v0 min 2                                : connu_min 
v1 min 3                                : connu_min 
v2 min 8                                : connu_min 
     => if v3 > 8 then v0 + v1 + v2 + v3 < 21

21 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>8,v0+(v1+(v2+v3))<21)]=> v3 is 8



********** no reduction after move 2 **********

