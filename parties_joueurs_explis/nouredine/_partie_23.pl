ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,nouredine).
partie(23,'../parties_joueur/nouredine/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,2,[c(0,green,1,72.69,non,plus),c(1,red,1,4.06,non,plus),c(2,yellow,1,18.98,oui,plus),c(3,blue,8,9.43,non,moins)]),
     coup(2,2,1,[c(0,blue,5,83.28,oui,oui),c(1,red,2,4.44,non,oui),c(2,yellow,2,9.13,oui,oui),c(3,green,2,3.98,non,oui)]),
     coup(3,1,1,[c(1,green,2,19.22,oui,oui),c(3,red,2,4.06,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

1 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [2,3,4,5,6,7,8]

[dans(v1,[2,3,4,5,6,7,8])]=> v1 min 2

1 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v2 in [2,3,4,5,6,7,8]

[dans(v2,[2,3,4,5,6,7,8])]=> v2 min 2

v3 < 8                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v3 in [1,2,3,4,5,6,7]

[dans(v3,[1,2,3,4,5,6,7])]=> v3 min 1

[min(v1,2)]
[min(v2,2)]
[min(v3,1)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>6,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5,6]

[dans(v0,[2,3,4,5,6])]=> v0 min 2

v2 min 2                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,2)]=> if v1 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>6,v0+(v1+(v2+v3))<11)]=> v1 in [2,3,4,5,6]

[dans(v1,[2,3,4,5,6])]=> v1 min 2

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c2 is yellow                            : seen 
[dans(c3,[green,red])]=> c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

v0 min 2                                : connu_min 
v1 min 2                                : connu_min 
v3 min 1                                : connu_min 
     => if v2 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>6,v0+(v1+(v2+v3))<11)]=> v2 in [2,3,4,5,6]

v0 min 2                                : connu_min 
v1 min 2                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>5,v0+(v1+(v2+v3))<11)]=> v3 in [1,2,3,4,5]

[v2=v3]
[dans(v2,[2,3,4,5,6])]
[dans(v3,[1,2,3,4,5])]=> v2 in [2,3,4,5]
v3 in [2,3,4,5]

[dans(v2,[2,3,4,5]),dans(v3,[2,3,4,5])]=> v3 min 2

v2 min 2                                : connu_min 
[min(v1,2)]
[min(v3,2)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>5,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green] : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5] : 

v0 min 2                                : connu_min 
v2 min 2                                : connu_min 
v3 min 2                                : connu_min 
     => if v1 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>5,v0+(v1+(v2+v3))<11)]=> v1 in [2,3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5] : 

v2 = v3                                 : connu_simplification_equivalence 
v2 in [2,3,4,5,6]                       : connu_somme_trop_grande 
v3 in [1,2,3,4,5]                       : connu_somme_trop_grande 
     => v2 in [2,3,4,5]
v3 in [2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

c3 in [green,red]                       : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5] : 

v2 = v3                                 : connu_simplification_equivalence 
v2 in [2,3,4,5,6]                       : connu_somme_trop_grande 
v3 in [1,2,3,4,5]                       : connu_somme_trop_grande 
     => v2 in [2,3,4,5]
v3 in [2,3,4,5]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
c1 in [blue,green]                      : known domain 
     => c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 \= green                             : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : answer of the system 


********** no reduction after move 3 **********

