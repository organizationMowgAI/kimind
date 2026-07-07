ident(3,'20yellow=red<blue<green0yellow31green102blue43red3').
joueur(3,jean_pierre).
partie(3,'../parties_joueur/jean_pierre/_partie_3').
somme(3,20).
ordre_couleurs(3,[yellow,=,red,<,blue,<,green]).
solution(3,[c(0,yellow,3),c(1,green,10),c(2,blue,4),c(3,red,3)]).
nb_solutions(3,168).
cartes_jouees(3,
   [
     coup(1,168,2,[c(0,yellow,3,6.64,oui,oui),c(1,red,3,2.37,non,plus),c(2,blue,6,46.07,oui,moins),c(3,green,8,4.57,non,moins)]),
     coup(2,2,1,[c(1,green,9,3.59,oui,plus),c(2,blue,5,41.1,oui,moins),c(3,red,3,31.89,oui,oui)]),
     coup(3,1,1,[c(1,green,10,14.64,oui,oui),c(2,blue,4,1.95,oui,oui)])
   ]
            ).
resultat(3,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 3 : 

v0 is 3                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is blue                              : answer of the system 
[dans(c1,[blue,green])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is in [9,10] : 

v0 is 3                                 : seen 
     => v0 max 3

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 max 5

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [blue,red]

c2 \= c3                                : intial constraint 
c2 is blue                              : seen 
[dans(c3,[blue,red])]=> c3 is red

c0 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[dans(c3,[red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 is 3                                 : seen 
[v0=v3]=> v3 is 3

[dans(v3,[3])]=> v3 max 3

[max(v0,3)]
[max(v2,5)]
[max(v3,3)]=> if v1 < 9 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<9,v0+(v1+(v2+v3))<20)]=> v1 in [9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [4,5] : 

v1 in [9,10]                            : seen 
     => v1 max 10

v0 max 3                                : seen 
v3 max 3                                : seen 
[max(v1,10)]=> if v2 < 4 then v0 + v1 + v2 + v3 < 20

20 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<4,v0+(v1+(v2+v3))<20)]=> v2 in [4,5]


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 3 : 

v3 is 3                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : known domain 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 < 5                                  : answer of the system 



********** no reduction after move 3 **********

