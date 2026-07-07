ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,david).
partie(23,'../parties_joueur/david/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,2,[c(0,yellow,1,3.72,non,plus),c(1,blue,8,72.16,non,moins),c(2,green,1,9.41,non,plus),c(3,red,1,3.87,oui,plus)]),
     coup(2,2,1,[c(0,blue,3,81.78,oui,plus),c(1,green,2,7.07,oui,oui),c(2,yellow,2,5.18,oui,oui),c(3,red,2,1.86,oui,oui)]),
     coup(3,1,1,[c(0,blue,5,23.44,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [blue,green]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [2,3,4,5] : 

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,yellow]

c3 is red                               : seen 
[dans(c1,[green,yellow])]=> c1 meme_rang c3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[meme_rang(c1,c3)]=> v1 = v3

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

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0>6,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5,6]

[dans(v0,[2,3,4,5,6])]=> v0 min 2

v2 min 2                                : connu_min 
v3 min 2                                : connu_min 
[min(v0,2)]=> if v1 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1>5,v0+(v1+(v2+v3))<11)]=> v1 in [1,2,3,4,5]

v0 min 2                                : connu_min 
v1 min 1                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 6 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>6,v0+(v1+(v2+v3))<11)]=> v3 in [2,3,4,5,6]

[v1=v3]
[dans(v1,[1,2,3,4,5])]
[dans(v3,[2,3,4,5,6])]=> v1 in [2,3,4,5]
v3 in [2,3,4,5]

[dans(v1,[2,3,4,5]),dans(v3,[2,3,4,5])]=> v1 min 2

v2 min 2                                : connu_min 
v3 min 2                                : connu_min 
[min(v1,2)]=> if v0 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>5,v0+(v1+(v2+v3))<11)]=> v0 in [2,3,4,5]


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [green,yellow] : 

c1 in [green,yellow]                    : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is in [2,3,4,5] : 

v1 = v3                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : connu_somme_trop_grande 
v3 in [2,3,4,5,6]                       : connu_somme_trop_grande 
     => v1 in [2,3,4,5]
v3 in [2,3,4,5]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,yellow] : 

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [2,3,4,5] : 

v0 min 2                                : connu_min 
v1 min 2                                : connu_min 
v3 min 2                                : connu_min 
     => if v2 > 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>5,v0+(v1+(v2+v3))<11)]=> v2 in [2,3,4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [2,3,4,5] : 

v1 = v3                                 : connu_simplification_equivalence 
v1 in [1,2,3,4,5]                       : connu_somme_trop_grande 
v3 in [2,3,4,5,6]                       : connu_somme_trop_grande 
     => v1 in [2,3,4,5]
v3 in [2,3,4,5]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v1 is 2                                 : answer of the system 
     => v1 max 2

v2 is 2                                 : answer of the system 
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

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 3 **********

