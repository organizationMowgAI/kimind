ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,malik).
partie(23,'../parties_joueur/malik/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,9,[c(0,red,1,2.39,non,plus),c(1,blue,8,93.19,non,moins),c(2,green,1,2.28,non,plus),c(3,yellow,1,2.7,non,plus)]),
     coup(2,9,1,[c(0,yellow,2,5.47,non,plus),c(1,green,2,75.63,oui,oui),c(2,blue,5,29.86,non,moins),c(3,red,2,2.17,oui,oui)]),
     coup(3,1,1,[c(0,blue,2,2.1,oui,plus),c(2,yellow,2,11.68,oui,oui)]),
     coup(4,1,1,[c(0,blue,5,17.88,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,yellow] : 

c0 \= red                               : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6] : 

v1 < 8                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [1,2,3,4,5,6,7]

[dans(v1,[1,2,3,4,5,6,7])]=> v1 min 1

1 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v2 in [2,3,4,5,6,7,8]

[dans(v2,[2,3,4,5,6,7,8])]=> v2 min 2

1 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v3 in [2,3,4,5,6,7,8]

[dans(v3,[2,3,4,5,6,7,8])]=> v3 min 2

[min(v1,1)]
[min(v2,2)]
[min(v3,2)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,red,yellow] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [1,2,3,4,5] : 

v0 in [2,3,4,5,6]                       : connu_somme_trop_grande 
     => v0 min 2

v2 min 2                                : connu_min 
v3 min 2                                : connu_min 
[min(v0,2)]=> if v1 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>5,v0+(v1+(v2+v3))<11)]=> v1 in [1,2,3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,red,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5,6] : 

v0 min 2                                : connu_min 
v1 min 1                                : connu_min 
v3 min 2                                : connu_min 
     => if v2 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<11)]=> v2 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v0 min 2                                : connu_min 
v1 min 1                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>6,v0+(v1+(v2+v3))<11)]=> v3 in [2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,yellow]               : known domain 
     => c0 in [blue,green]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[blue,green])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v1 is 2                                 : answer of the system 
     => v1 max 2

blue \= c2                              : answer of the system 
c2 in [blue,red,yellow]                 : known domain 
     => c2 in [red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c2,[red,yellow])]=> c2 is yellow

c1 is green                             : seen 
green meme_rang yellow                  : intial constraint 
[dans(c2,[yellow])]=> c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 is 2                                 : seen 
[v1=v2]=> v2 is 2

[dans(v2,[2])]=> v2 max 2

v3 is 2                                 : answer of the system 
     => v3 max 2

[max(v1,2)]
[max(v2,2)]
[max(v3,2)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<11)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 3 **********

********** no reduction after move 4 **********

