ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,colin).
partie(12,'../parties_joueur/colin/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,1,[c(0,green,7,2.33,non,moins),c(1,blue,4,20.37,non,plus),c(2,yellow,4,2.33,oui,moins),c(3,red,5,9.56,oui,moins)]),
     coup(2,1,1,[c(0,blue,3,27.82,oui,oui),c(1,green,10,3.94,oui,oui),c(2,yellow,3,2.64,oui,oui),c(3,red,4,2.38,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[blue,red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c0 is blue                              : seen 
c2 is yellow                            : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

4 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [5,6,7,8,9,10]

[dans(v1,[5,6,7,8,9,10])]=> v1 max 10

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 max 3

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 max 4

[max(v1,10)]
[max(v2,3)]
[max(v3,4)]=> if v0 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<3,v0+(v1+(v2+v3))<20)]=> v0 in [3,4,5,6]

v2 in [1,2,3]                           : seen 
[v0=v2]
[dans(v0,[3,4,5,6])]=> v0 is 3
v2 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[green,red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [3,4,5,6]                         : seen 
v2 in [1,2,3]                           : seen 
     => v0 is 3
v2 is 3

[dans(v0,[3]),dans(v2,[3])]=> v0 max 3

v2 max 3                                : seen 
v3 max 4                                : seen 
[max(v0,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<20)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [3,4,5,6]                         : seen 
v2 in [1,2,3]                           : seen 
     => v0 is 3
v2 is 3


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v2 max 3                                : seen 
     => if v3 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<20)]=> v3 is 4



********** no reduction after move 2 **********

