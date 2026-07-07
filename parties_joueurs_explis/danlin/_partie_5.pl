ident(5,'10blue<green=red<yellow0green21yellow52red23blue1').
joueur(5,danlin).
partie(5,'../parties_joueur/danlin/_partie_5').
somme(5,10).
ordre_couleurs(5,[blue,<,green,=,red,<,yellow]).
solution(5,[c(0,green,2),c(1,yellow,5),c(2,red,2),c(3,blue,1)]).
nb_solutions(5,24).
cartes_jouees(5,
   [
     coup(1,24,1,[c(0,blue,4,17.06,non,moins),c(1,green,5,2.18,non,oui),c(2,red,5,1.64,oui,moins),c(3,yellow,6,2.87,non,moins)]),
     coup(2,1,1,[c(0,green,2,4.44,oui,oui),c(1,yellow,5,7.97,oui,oui),c(2,red,2,49.75,oui,oui),c(3,blue,1,19.03,oui,oui)])
   ]
            ).
resultat(5,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

v0 < 4                                  : answer of the system 
v0 in [1,2,3,4,5,6,7]                   : known domain 
     => v0 in [1,2,3]

v1 is 5                                 : answer of the system 
[dans(v0,[1,2,3])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [green,yellow]

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c1 \= c2                                : intial constraint 
c2 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

c0 \= c1                                : intial constraint 
blue avant yellow                       : intial constraint 
[avant(c0,c1)]
[dans(c0,[green,yellow])]
[dans(c1,[blue,yellow])]=> c0 is green


------------------------------------------------------------

the value (v0) of the card in position 0 is 2 : 

v1 is 5                                 : seen 
     => v1 min 5

c0 is green                             : seen 
c2 is red                               : seen 
green meme_rang red                     : intial constraint 
     => c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[blue,green,red])]=> c3 in [blue,green]

c0 \= c3                                : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue,green])]=> c3 is blue

blue avant green                        : intial constraint 
c0 is green                             : seen 
[dans(c3,[blue])]=> c3 avant c0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[avant(c3,c0)]=> v3 < v0

v0 in [1,2,3]                           : seen 
     => v0 min 1

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7]                   : known domain 
     => v3 in [1,2,3,4,5]

[dans(v3,[1,2,3,4,5])]=> v3 min 1

v0 min 1                                : connu_min 
v1 min 5                                : connu_min 
[min(v3,1)]=> if v2 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>3,v0+(v1+(v2+v3))<10)]=> v2 in [1,2,3]

[dans(v2,[1,2,3])]=> v2 min 1

v1 min 5                                : connu_min 
[min(v0,1)]
[min(v2,1)]=> if v3 > 3 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>3,v0+(v1+(v2+v3))<10)]=> v3 in [1,2,3]

v0 in [1,2,3]                           : seen 
[v3<v0]
[dans(v3,[1,2,3])]=> v0 in [2,3]
v3 in [1,2]

v2 in [1,2,3]                           : connu_somme_trop_grande 
[v0=v2]
[dans(v0,[2,3]),dans(v3,[1,2])]=> v2 in [2,3]

[dans(v2,[2,3])]=> v2 min 2

v3 min 1                                : connu_min 
[min(v1,5)]
[min(v2,2)]=> if v0 > 2 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>2,v0+(v1+(v2+v3))<10)]=> v0 is 2


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

c0 \= c1                                : seen 
blue avant green                        : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 is green                             : seen 
c1 in [blue,yellow]                     : seen 
     => c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v0 is 2                                 : connu_somme_trop_grande 
     => v0 min 2

v1 min 5                                : connu_min 
v3 min 1                                : connu_min 
[min(v0,2)]=> if v2 > 2 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2>2,v0+(v1+(v2+v3))<10)]=> v2 is 2


------------------------------------------------------------

the colour (c3) of the card in position 3 is blue : 

c3 is blue                              : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 1 : 

v0 min 2                                : connu_min 
v1 min 5                                : connu_min 
v2 min 2                                : connu_min 
     => if v3 > 1 then v0 + v1 + v2 + v3 < 10

10 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3>1,v0+(v1+(v2+v3))<10)]=> v3 is 1



********** no reduction after move 2 **********

