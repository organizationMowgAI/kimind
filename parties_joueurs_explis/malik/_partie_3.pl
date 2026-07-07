ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,malik).
partie(3,'../parties_joueur/malik/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,9,[c(0,green,9,256.43,non,moins),c(1,blue,7,30.09,non,plus),c(2,red,2,4.18,non,plus),c(3,yellow,2,3.61,non,plus)]),
     coup(2,9,2,[c(0,blue,6,5.66,non,moins),c(1,green,8,200.28,oui,plus),c(2,yellow,3,4.36,non,plus),c(3,red,3,7.71,oui,oui)]),
     coup(3,2,1,[c(0,yellow,3,3.07,oui,oui),c(1,green,9,136.44,oui,plus),c(2,blue,5,13.15,oui,moins)]),
     coup(4,1,1,[c(1,green,10,16.4,oui,oui),c(2,blue,4,1.6,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [1,2,3,4,5,6] : 

7 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [8,9,10]

[dans(v1,[8,9,10])]=> v1 min 8

2 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [3,4,5,6,7,8,9,10]

[dans(v2,[3,4,5,6,7,8,9,10])]=> v2 min 3

2 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [3,4,5,6,7,8,9,10]

[dans(v3,[3,4,5,6,7,8,9,10])]=> v3 min 3

[min(v1,8)]
[min(v2,3)]
[min(v3,3)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
v1 in [8,9,10]                          : seen 
     => v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
yellow avant blue                       : intial constraint 
c0 in [blue,red,yellow]                 : seen 
red meme_rang yellow                    : intial constraint 
[dans(c1,[green,red,yellow])]=> c1 in [green,red]

c0 \= c1                                : intial constraint 
red avant blue                          : intial constraint 
c0 in [blue,red,yellow]                 : seen 
red meme_rang yellow                    : seen 
[avant(c0,c1)]
[dans(c1,[green,red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v1 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [3,4,5,6,7,8] : 

v0 in [1,2,3,4,5,6]                     : connu_somme_trop_grande 
     => v0 min 1

v1 min 8                                : connu_min 
v3 min 3                                : connu_min 
[min(v0,1)]=> if v2 > 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>8,v0+(v1+(v2+v3))<20)]=> v2 in [3,4,5,6,7,8]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is green                             : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [3,4,5,6,7,8] : 

v0 min 1                                : connu_min 
v1 min 8                                : connu_min 
v2 min 3                                : connu_min 
     => if v3 > 8 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>8,v0+(v1+(v2+v3))<20)]=> v3 in [3,4,5,6,7,8]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

c0 is yellow                            : seen 
c3 is red                               : seen 
red meme_rang yellow                    : intial constraint 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

8 < v1                                  : answer of the system 
v1 in [8,9,10]                          : known domain 
     => v1 in [9,10]

[dans(v1,[9,10])]=> v1 min 9

3 < v2                                  : answer of the system 
v2 in [3,4,5,6,7,8]                     : known domain 
     => v2 in [4,5,6,7,8]

[dans(v2,[4,5,6,7,8])]=> v2 min 4

v3 is 3                                 : answer of the system 
     => v3 min 3

[min(v1,9)]
[min(v2,4)]
[min(v3,3)]=> if v0 > 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>4,v0+(v1+(v2+v3))<20)]=> v0 in [1,2,3,4]

v3 is 3                                 : seen 
[v0=v3]
[dans(v0,[1,2,3,4])]=> v0 is 3


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v1 in [9,10]                            : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v0 is 3                                 : seen 
     => v0 min 3

v1 min 9                                : connu_min 
v3 min 3                                : connu_min 
[min(v0,3)]=> if v2 > 5 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>5,v0+(v1+(v2+v3))<20)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 3 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < 5                                  : answer of the system 



********** no reduction after move 4 **********

