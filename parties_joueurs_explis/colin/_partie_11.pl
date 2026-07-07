ident(11,'37green<red=blue=yellow0red101blue102green73yellow10').
joueur(11,colin).
partie(11,'../parties_joueur/colin/_partie_11').
somme(11,37).
ordre_couleurs(11,[green,<,red,=,blue,=,yellow]).
solution(11,[c(0,red,10),c(1,blue,10),c(2,green,7),c(3,yellow,10)]).
nb_solutions(11,24).
cartes_jouees(11,
   [
     coup(1,24,3,[c(0,blue,10,14.4,non,oui),c(1,yellow,10,7.55,non,oui),c(2,red,10,1.99,non,moins),c(3,green,7,5.47,non,plus)]),
     coup(2,3,1,[c(0,yellow,10,8.69,non,oui),c(1,blue,10,1.92,oui,oui),c(2,green,7,2.23,oui,oui),c(3,red,10,2.02,non,oui)]),
     coup(3,1,1,[c(0,red,10,7.56,oui,oui),c(3,yellow,10,1.34,oui,oui)])
   ]
            ).
resultat(11,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [red,yellow] : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

v0 is 10                                : answer of the system 
v1 is 10                                : answer of the system 
     => v0 = v1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[v0=v1]=> c0 meme_rang c1

c0 \= c1                                : intial constraint 
green avant blue                        : intial constraint 
green avant red                         : intial constraint 
[dans(c0,[green,red,yellow])]
[dans(c1,[blue,green,red])]
[meme_rang(c0,c1)]=> c0 in [red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c0 \= c1                                : seen 
green avant red                         : seen 
green avant yellow                      : intial constraint 
c0 in [red,yellow]                      : seen 
c1 in [blue,green,red]                  : seen 
c0 meme_rang c1                         : connu_simplification_equivalence 
     => c1 in [blue,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

v2 < 10                                 : answer of the system 
v2 in [7,8,9,10]                        : known domain 
     => v2 in [7,8,9]

v0 is 10                                : seen 
[dans(v2,[7,8,9])]=> v2 < v0

c2 avant c0 <=> v2 < v0                 : intial constraint 
[v2<v0]=> c2 avant c0

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : seen 
c2 avant c0                             : connu_simplification_equivalence 
c0 in [red,yellow]                      : seen 
blue meme_rang red                      : intial constraint 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

c0 \= c2                                : intial constraint 
c0 in [red,yellow]                      : seen 
red meme_rang yellow                    : intial constraint 
[avant(c2,c0)]
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v0 is 10                                : seen 
     => v0 min 10

v1 is 10                                : seen 
     => v1 min 10

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 in [red,yellow]                      : seen 
[dans(c3,[blue,red,yellow])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 is 10                                : seen 
[v0=v3]=> v3 is 10

[dans(v3,[10])]=> v3 min 10

[min(v0,10)]
[min(v1,10)]
[min(v3,10)]=> if v2 > 7 then v0 + v1 + v2 + v3 < 37

37 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>7,v0+(v1+(v2+v3))<37)]=> v2 is 7


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red,yellow] : 

c3 in [blue,red,yellow]                 : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= red                               : answer of the system 
c3 in [blue,red,yellow]                 : known domain 
     => c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
c1 meme_rang c3                         : intial constraint 
[dans(c3,[blue,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

