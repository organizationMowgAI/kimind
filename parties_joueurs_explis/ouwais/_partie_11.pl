ident(11,'37green<red=blue=yellow0red101blue102green73yellow10').
joueur(11,ouwais).
partie(11,'../parties_joueur/ouwais/_partie_11').
somme(11,37).
ordre_couleurs(11,[green,<,red,=,blue,=,yellow]).
solution(11,[c(0,red,10),c(1,blue,10),c(2,green,7),c(3,yellow,10)]).
nb_solutions(11,24).
cartes_jouees(11,
   [
     coup(1,24,1,[c(0,red,10,1.51,oui,oui),c(1,green,7,68.59,non,plus),c(2,yellow,10,3.26,non,moins),c(3,blue,10,1.9,non,oui)]),
     coup(2,1,1,[c(1,yellow,10,3.35,non,oui),c(2,green,7,12.7,oui,oui),c(3,blue,10,1.04,non,oui)]),
     coup(3,1,1,[c(1,blue,10,2.88,oui,oui),c(3,yellow,10,8.58,oui,oui)])
   ]
            ).
resultat(11,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,yellow]

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : seen 
c0 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

v0 is 10                                : seen 
v3 is 10                                : answer of the system 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
green avant red                         : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,yellow])]
[meme_rang(c0,c3)]=> c3 is yellow

c1 \= c3                                : intial constraint 
[dans(c1,[blue,yellow])]
[dans(c3,[yellow])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

c0 is red                               : seen 
c1 in [blue,yellow]                     : seen 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 is 10                                : seen 
[v0=v1]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c0 \= c2                                : intial constraint 
c0 is red                               : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


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

********** no reduction after move 3 **********

