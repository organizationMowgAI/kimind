ident(11,'37green<red=blue=yellow0red101blue102green73yellow10').
joueur(11,jean_pierre).
partie(11,'../parties_joueur/jean_pierre/_partie_11').
somme(11,37).
ordre_couleurs(11,[green,<,red,=,blue,=,yellow]).
solution(11,[c(0,red,10),c(1,blue,10),c(2,green,7),c(3,yellow,10)]).
nb_solutions(11,24).
cartes_jouees(11,
   [
     coup(1,24,1,[c(0,green,7,14.37,non,plus),c(1,red,10,2.95,non,oui),c(2,blue,10,5.24,non,moins),c(3,yellow,10,2.97,oui,oui)]),
     coup(2,1,1,[c(0,red,10,2.73,oui,oui),c(1,blue,10,20.01,oui,oui),c(2,green,7,3.49,oui,oui)])
   ]
            ).
resultat(11,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c3 is yellow                            : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,red]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c3                                : seen 
c3 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

v1 is 10                                : answer of the system 
v3 is 10                                : answer of the system 
     => v1 = v3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[v1=v3]=> c1 meme_rang c3

c1 \= c3                                : intial constraint 
green avant yellow                      : intial constraint 
c3 is yellow                            : seen 
[dans(c1,[blue,green])]
[meme_rang(c1,c3)]=> c1 is blue

c0 \= c1                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c1,[blue])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 in [blue,red]                        : seen 
c3 is yellow                            : seen 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

7 < v0                                  : answer of the system 
v0 in [7,8,9,10]                        : known domain 
     => v0 in [8,9,10]

v3 is 10                                : seen 
[v0=v3]
[dans(v0,[8,9,10])]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c3 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[green,red])]=> c2 is green


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

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



********** no reduction after move 2 **********

