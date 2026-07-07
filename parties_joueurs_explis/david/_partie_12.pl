ident(12,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(12,david).
partie(12,'../parties_joueur/david/_partie_12').
somme(12,20).
ordre_couleurs(12,[blue,=,yellow,<,red,<,green]).
solution(12,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(12,168).
cartes_jouees(12,
   [
     coup(1,168,4,[c(0,blue,4,74.77,oui,moins),c(1,green,4,5.05,oui,plus),c(2,red,5,5.6,non,moins),c(3,yellow,7,13.16,non,moins)]),
     coup(2,4,1,[c(0,blue,3,157.32,oui,oui),c(1,green,9,5.76,oui,plus),c(2,yellow,3,5.79,oui,oui),c(3,red,5,4.37,oui,moins)]),
     coup(3,1,1,[c(1,green,10,14.08,oui,oui),c(3,red,4,2.77,oui,oui)])
   ]
            ).
resultat(12,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3] : 

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v0 in [1,2,3]                           : seen 
     => v0 max 3

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[green,yellow])]=> c2 is yellow

c0 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[yellow])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

v0 in [1,2,3]                           : seen 
[v0=v2]
[dans(v2,[1,2,3,4])]=> v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 max 3

v2 in [1,2,3,4]                         : seen 
     => v2 max 4

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 max 6

v0 max 3                                : seen 
[max(v2,4)]
[max(v3,6)]=> if v1 < 7 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<7,v0+(v1+(v2+v3))<20)]=> v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

v0 max 3                                : seen 
v2 max 4                                : seen 
[max(v1,10)]=> if v3 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<3,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6]

[dans(v3,[3,4,5,6])]=> v3 max 6

[max(v0,3)]
[max(v2,3)]
[max(v3,6)]=> if v1 < 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<8,v0+(v1+(v2+v3))<20)]=> v1 in [8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3] : 

v2 in [1,2,3]                           : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[green,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5,6] : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v2 max 3                                : seen 
     => if v3 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<20)]=> v3 in [4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : known domain 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v2 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 < 5                                  : answer of the system 



********** no reduction after move 3 **********

