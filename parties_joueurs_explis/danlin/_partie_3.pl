ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,danlin).
partie(3,'../parties_joueur/danlin/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,2,[c(0,blue,7,22.68,non,moins),c(1,green,9,2.94,oui,plus),c(2,red,2,3.44,non,plus),c(3,yellow,2,2.34,non,plus)]),
     coup(2,2,1,[c(0,red,3,15.45,non,oui),c(1,green,10,39.22,oui,oui),c(2,yellow,3,9.15,non,plus),c(3,blue,4,4.58,non,moins)]),
     coup(3,1,1,[c(0,yellow,3,5.83,oui,oui),c(2,blue,4,5.0,oui,oui),c(3,red,3,3.03,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4] : 

v1 > 9                                  : answer of the system 
     => v1 min 10

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [3,4,5,6,7,8,9,10]

[dans(v2,[3,4,5,6,7,8,9,10])]=> v2 min 3

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 min 3

[min(v1,10)]
[min(v2,3)]
[min(v3,3)]=> if v0 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>4,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6] : 

v0 in [1,2,3,4]                         : connu_somme_trop_grande 
     => v0 min 1

v1 min 10                               : connu_min 
v3 min 3                                : connu_min 
[min(v0,1)]=> if v2 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5,6] : 

v0 min 1                                : connu_min 
v1 min 10                               : connu_min 
v2 min 3                                : connu_min 
     => if v3 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>6,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= red                               : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v0 is 3                                 : seen 
     => v0 min 3

v3 < 4                                  : answer of the system 
     => v3 min 3

[min(v0,3)]
[min(v3,3)]=> if v2 > 4 then v0 + v2 + v3 < 10

10 = v0 + v2 + v3                       : intial constraint 
[si_alors(v2>4,v0+(v2+v3)<10)]=> v2 is 4


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



********** no reduction after move 3 **********

