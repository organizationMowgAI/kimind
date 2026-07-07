ident(10,'10green<blue<red<yellow0red31yellow42blue23green1').
joueur(10,claire).
partie(10,'../parties_joueur/claire/_partie_10').
somme(10,10).
ordre_couleurs(10,[green,<,blue,<,red,<,yellow]).
solution(10,[c(0,red,3),c(1,yellow,4),c(2,blue,2),c(3,green,1)]).
nb_solutions(10,24).
cartes_jouees(10,
   [
     coup(1,24,1,[c(0,red,3,126.45,oui,oui),c(1,blue,2,2.89,non,plus),c(2,yellow,4,5.4,non,moins),c(3,green,1,4.25,oui,oui)]),
     coup(2,1,1,[c(1,yellow,4,20.99,oui,oui),c(2,blue,2,3.45,oui,oui)])
   ]
            ).
resultat(10,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,yellow]

c1 \= c3                                : intial constraint 
c3 is green                             : answer of the system 
[dans(c1,[green,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 4 : 

v0 is 3                                 : seen 
     => v0 min 3

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c2 \= c3                                : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue,green])]=> c2 is blue

green avant blue                        : intial constraint 
c3 is green                             : seen 
[dans(c2,[blue])]=> c3 avant c2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[avant(c3,c2)]=> v3 < v2

red avant yellow                        : intial constraint 
c0 is red                               : seen 
c1 is yellow                            : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v2 < 4                                  : answer of the system 
v2 in [1,2,3,4,5,6,7]                   : known domain 
     => v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 min 1

v3 is 1                                 : answer of the system 
     => v3 min 1

v0 min 3                                : connu_min 
[min(v2,1)]
[min(v3,1)]=> if v1 > 5 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>5,v0+(v1+(v2+v3))<10)]=> v1 in [3,4,5]

v0 is 3                                 : seen 
[v0<v1]
[dans(v1,[3,4,5])]=> v1 in [4,5]

[dans(v1,[4,5])]=> v1 min 4

v0 min 3                                : connu_min 
v3 min 1                                : connu_min 
[min(v1,4)]=> if v2 > 2 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>2,v0+(v1+(v2+v3))<10)]=> v2 in [1,2]

v3 is 1                                 : seen 
[v3<v2]
[dans(v2,[1,2])]=> v2 is 2

[dans(v2,[2])]=> v2 min 2

v3 min 1                                : connu_min 
[min(v0,3)]
[min(v2,2)]=> if v1 > 4 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1>4,v0+(v1+(v2+v3))<10)]=> v1 is 4


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 is green                             : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v3 is 1                                 : seen 



********** no reduction after move 2 **********

