ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,claire).
partie(3,'../parties_joueur/claire/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,1,[c(0,red,4,2.53,non,moins),c(1,green,7,3.21,oui,plus),c(2,blue,5,2.71,oui,moins),c(3,yellow,4,74.98,non,moins)]),
     coup(2,1,1,[c(0,yellow,3,38.34,oui,oui),c(1,green,10,4.34,oui,oui),c(2,blue,4,5.8,oui,oui),c(3,red,3,2.64,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[blue,green,yellow])]=> c0 in [blue,yellow]

c0 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

7 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [8,9,10]

[dans(v1,[8,9,10])]=> v1 max 10

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4]

[dans(v2,[1,2,3,4])]=> v2 max 4

v3 < 4                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3]

[dans(v3,[1,2,3])]=> v3 max 3

[max(v1,10)]
[max(v2,4)]
[max(v3,3)]=> if v0 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<3,v0+(v1+(v2+v3))<20)]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 3                                 : seen 
     => v0 max 3

v2 max 4                                : seen 
v3 max 3                                : seen 
[max(v0,3)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<20)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v3 max 3                                : seen 
     => if v2 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<20)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v0 max 3                                : seen 
v1 max 10                               : seen 
v2 max 4                                : seen 
     => if v3 < 3 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<3,v0+(v1+(v2+v3))<20)]=> v3 is 3



********** no reduction after move 2 **********

