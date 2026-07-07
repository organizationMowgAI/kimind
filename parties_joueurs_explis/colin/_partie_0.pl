ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,colin).
partie(0,'../parties_joueur/colin/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,1,[c(0,red,9,22.99,oui,oui),c(1,yellow,7,4.02,non,plus),c(2,green,10,4.76,oui,oui),c(3,blue,9,2.28,non,moins)]),
     coup(2,1,1,[c(1,blue,9,13.67,oui,oui),c(3,yellow,7,3.28,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 is red                               : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

v0 is 9                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c0 \= c1                                : intial constraint 
c0 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is green                             : answer of the system 
[dans(c1,[blue,green])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 is 9                                 : seen 
[v0=v1]=> v1 is 9


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is red                               : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,yellow]

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
[dans(c3,[green,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v0 is 9                                 : seen 
     => v0 max 9

v1 is 9                                 : seen 
     => v1 max 9

v2 is 10                                : seen 
     => v2 max 10

[max(v0,9)]
[max(v1,9)]
[max(v2,10)]=> if v3 < 7 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<7,v0+(v1+(v2+v3))<35)]=> v3 is 7



********** no reduction after move 2 **********

