ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,claire).
partie(15,'../parties_joueur/claire/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,1,[c(0,blue,6,11.24,non,plus),c(1,red,10,51.17,non,oui),c(2,green,9,4.97,oui,moins),c(3,yellow,10,2.12,oui,moins)]),
     coup(2,1,1,[c(0,red,10,40.23,oui,oui),c(1,blue,10,7.32,oui,oui),c(2,green,8,5.89,oui,oui),c(3,yellow,7,5.4,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[red,yellow])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c1,[blue,yellow])]=> c1 is blue

c0 is red                               : seen 
blue meme_rang red                      : intial constraint 
[dans(c1,[blue])]=> c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v1 is 10                                : answer of the system 
     => v1 max 10

v2 < 9                                  : answer of the system 
v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 in [5,6,7,8]

[dans(v2,[5,6,7,8])]=> v2 max 8

v3 < 10                                 : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7,8,9]

[dans(v3,[5,6,7,8,9])]=> v3 max 9

[max(v1,10)]
[max(v2,8)]
[max(v3,9)]=> if v0 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<8,v0+(v1+(v2+v3))<35)]=> v0 in [8,9,10]

v1 is 10                                : seen 
[v0=v1]
[dans(v0,[8,9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

yellow avant green                      : intial constraint 
c2 is green                             : seen 
c3 is yellow                            : seen 
     => c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

v0 in [8,9,10]                          : seen 
     => v0 max 10

v1 max 10                               : seen 
v3 max 9                                : seen 
[max(v0,10)]=> if v2 < 6 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<6,v0+(v1+(v2+v3))<35)]=> v2 in [6,7,8]

v0 max 10                               : seen 
v1 max 10                               : seen 
v2 max 8                                : seen 
     => if v3 < 7 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<7,v0+(v1+(v2+v3))<35)]=> v3 in [7,8,9]

[v3<v2]
[dans(v2,[6,7,8])]
[dans(v3,[7,8,9])]=> v2 is 8
v3 is 7


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 < v2                                 : connu_simplification_equivalence 
v2 in [6,7,8]                           : seen 
v3 in [7,8,9]                           : seen 
     => v2 is 8
v3 is 7



********** no reduction after move 2 **********

