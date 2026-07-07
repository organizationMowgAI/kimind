ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,jean_pierre).
partie(23,'../parties_joueur/jean_pierre/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,9,[c(0,green,1,20.73,non,plus),c(1,red,1,3.18,non,plus),c(2,blue,8,5.67,non,moins),c(3,yellow,1,5.0,non,plus)]),
     coup(2,9,1,[c(0,red,2,56.15,non,plus),c(1,blue,5,3.29,non,moins),c(2,yellow,2,3.81,oui,oui),c(3,green,2,2.69,non,oui)]),
     coup(3,1,1,[c(0,blue,5,6.7,oui,oui),c(1,green,2,2.41,oui,oui),c(3,red,2,17.52,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5,6] : 

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [2,3,4,5,6,7,8]

[dans(v1,[2,3,4,5,6,7,8])]=> v1 min 2

v2 < 8                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v2 in [1,2,3,4,5,6,7]

[dans(v2,[1,2,3,4,5,6,7])]=> v2 min 1

1 < v3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v3 in [2,3,4,5,6,7,8]

[dans(v3,[2,3,4,5,6,7,8])]=> v3 min 2

[min(v1,2)]
[min(v2,1)]
[min(v3,2)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,yellow] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5,6] : 

v0 in [2,3,4,5,6]                       : connu_somme_trop_grande 
     => v0 min 2

v2 min 1                                : connu_min 
v3 min 2                                : connu_min 
[min(v0,2)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>6,v0+(v1+(v2+v3))<11)]=> v1 in [2,3,4,5,6]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [green,red,yellow] : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [1,2,3,4,5] : 

v0 min 2                                : connu_min 
v1 min 2                                : connu_min 
v3 min 2                                : connu_min 
     => if v2 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>5,v0+(v1+(v2+v3))<11)]=> v2 in [1,2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,green,red] : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5,6] : 

v0 min 2                                : connu_min 
v1 min 2                                : connu_min 
v2 min 1                                : connu_min 
     => if v3 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>6,v0+(v1+(v2+v3))<11)]=> v3 in [2,3,4,5,6]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= red                               : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [blue,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,yellow])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

blue \= c1                              : answer of the system 
c1 in [blue,green,yellow]               : known domain 
     => c1 in [green,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[green,yellow])]=> c1 is green

c2 is yellow                            : seen 
green meme_rang yellow                  : intial constraint 
[dans(c1,[green])]=> c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

v1 < 5                                  : answer of the system 
v1 in [2,3,4,5,6]                       : known domain 
     => v1 in [2,3,4]

v2 is 2                                 : answer of the system 
[v1=v2]
[dans(v1,[2,3,4])]=> v1 is 2

[dans(v1,[2])]=> v1 max 2

v2 is 2                                 : seen 
     => v2 max 2

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

c3 \= green                             : answer of the system 
c3 in [blue,green,red]                  : known domain 
     => c3 in [blue,red]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 3 **********

