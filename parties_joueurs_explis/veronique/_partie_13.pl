ident(13,'20blue=yellow<red<green0blue31green102yellow33red4').
joueur(13,veronique).
partie(13,'../parties_joueur/veronique/_partie_13').
somme(13,20).
ordre_couleurs(13,[blue,=,yellow,<,red,<,green]).
solution(13,[c(0,blue,3),c(1,green,10),c(2,yellow,3),c(3,red,4)]).
nb_solutions(13,168).
cartes_jouees(13,
   [
     coup(1,168,2,[c(0,blue,3,3.87,oui,oui),c(1,yellow,3,5.38,non,plus),c(2,green,8,6.91,non,moins),c(3,red,6,3.21,oui,moins)]),
     coup(2,2,1,[c(1,green,9,4.58,oui,plus),c(2,yellow,3,43.61,oui,oui),c(3,red,5,65.88,oui,moins)]),
     coup(3,1,1,[c(1,green,10,17.7,oui,oui),c(3,red,4,5.43,oui,oui)])
   ]
            ).
resultat(13,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,red])]=> c1 in [green,red]

c1 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c1,[green,red])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v0 is 3                                 : seen 
     => v0 max 3

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c0 is blue                              : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[red,yellow])]=> c2 is yellow

c0 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
[dans(c2,[yellow])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

v0 is 3                                 : seen 
[v0=v2]=> v2 is 3

[dans(v2,[3])]=> v2 max 3

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5]

[dans(v3,[1,2,3,4,5])]=> v3 max 5

[max(v0,3)]
[max(v2,3)]
[max(v3,5)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<9,v0+(v1+(v2+v3))<20)]=> v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 3 : 

v2 is 3                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [4,5] : 

v1 in [9,10]                            : seen 
     => v1 max 10

v0 max 3                                : seen 
v2 max 3                                : seen 
[max(v1,10)]=> if v3 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<20)]=> v3 in [4,5]



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 4 : 

v3 < 5                                  : answer of the system 



********** no reduction after move 3 **********

