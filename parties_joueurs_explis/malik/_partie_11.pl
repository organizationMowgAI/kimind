ident(11,'37green<red=blue=yellow0red101blue102green73yellow10').
joueur(11,malik).
partie(11,'../parties_joueur/malik/_partie_11').
somme(11,37).
ordre_couleurs(11,[green,<,red,=,blue,=,yellow]).
solution(11,[c(0,red,10),c(1,blue,10),c(2,green,7),c(3,yellow,10)]).
nb_solutions(11,24).
cartes_jouees(11,
   [
     coup(1,24,3,[c(0,green,7,4.43,non,plus),c(1,yellow,10,28.35,non,oui),c(2,blue,10,3.91,non,moins),c(3,red,10,5.53,non,oui)]),
     coup(2,3,1,[c(0,yellow,10,43.97,non,oui),c(1,red,10,3.42,non,oui),c(2,green,7,15.92,oui,oui),c(3,blue,10,2.5,non,oui)]),
     coup(3,1,1,[c(0,red,10,17.51,oui,oui),c(1,blue,10,1.93,oui,oui),c(3,yellow,10,19.68,oui,oui)])
   ]
            ).
resultat(11,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,red,yellow] : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c3 \= red                               : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,yellow]

v1 is 10                                : answer of the system 
v3 is 10                                : answer of the system 
     => v1 = v3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[v1=v3]=> c1 meme_rang c3

c1 \= c3                                : intial constraint 
green avant blue                        : intial constraint 
green avant yellow                      : intial constraint 
[dans(c1,[blue,green,red])]
[dans(c3,[blue,green,yellow])]
[meme_rang(c1,c3)]=> c1 in [blue,red]

c0 in [blue,red,yellow]                 : seen 
[dans(c1,[blue,red])]=> c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

7 < v0                                  : answer of the system 
v0 in [7,8,9,10]                        : known domain 
     => v0 in [8,9,10]

v1 is 10                                : seen 
[v0=v1]
[dans(v0,[8,9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,red] : 

c1 in [blue,red]                        : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

v2 < 10                                 : answer of the system 
v2 in [7,8,9,10]                        : known domain 
     => v2 in [7,8,9]

v1 is 10                                : seen 
[dans(v2,[7,8,9])]=> v2 < v1

c2 avant c1 <=> v2 < v1                 : intial constraint 
[v2<v1]=> c2 avant c1

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c1 \= c2                                : seen 
c2 avant c1                             : connu_simplification_equivalence 
c1 in [blue,red]                        : seen 
blue meme_rang red                      : intial constraint 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c1 \= c2                                : intial constraint 
c1 in [blue,red]                        : seen 
blue meme_rang yellow                   : intial constraint 
red meme_rang yellow                    : intial constraint 
[avant(c2,c1)]
[dans(c2,[green,yellow])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 7 : 

v0 is 10                                : seen 
     => v0 min 10

v1 is 10                                : seen 
     => v1 min 10

v3 is 10                                : seen 
     => v3 min 10

[min(v0,10)]
[min(v1,10)]
[min(v3,10)]=> if v2 > 7 then v0 + v1 + v2 + v3 < 37

37 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v2>7,v0+(v1+(v2+v3))<37)]=> v2 is 7


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,yellow] : 

c1 \= c3                                : seen 
green avant blue                        : seen 
green avant red                         : intial constraint 
c1 in [blue,red]                        : seen 
c3 in [blue,green,yellow]               : seen 
c1 meme_rang c3                         : connu_simplification_equivalence 
     => c3 in [blue,yellow]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [blue,red,yellow]                 : known domain 
     => c0 in [blue,red]

c0 \= c1                                : intial constraint 
c1 \= red                               : answer of the system 
c0 meme_rang c1                         : intial constraint 
[dans(c0,[blue,red])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 \= blue                              : answer of the system 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



********** no reduction after move 3 **********

