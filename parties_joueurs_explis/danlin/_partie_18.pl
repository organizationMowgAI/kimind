ident(18,'16green<red<yellow=blue0yellow51blue52red43green2').
joueur(18,danlin).
partie(18,'../parties_joueur/danlin/_partie_18').
somme(18,16).
ordre_couleurs(18,[green,<,red,<,yellow,=,blue]).
solution(18,[c(0,yellow,5),c(1,blue,5),c(2,red,4),c(3,green,2)]).
nb_solutions(18,48).
cartes_jouees(18,
   [
     coup(1,48,1,[c(0,green,2,2.74,non,plus),c(1,blue,5,17.76,oui,oui),c(2,red,4,2.32,oui,oui),c(3,yellow,5,2.58,non,moins)]),
     coup(2,1,1,[c(0,yellow,5,6.29,oui,oui),c(3,green,2,2.78,oui,oui)])
   ]
            ).
resultat(18,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [red,yellow]

c0 \= c2                                : intial constraint 
c2 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c0 is yellow                            : seen 
c1 is blue                              : seen 
blue meme_rang yellow                   : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v1 is 5                                 : answer of the system 
     => v1 min 5

v2 is 4                                 : answer of the system 
     => v2 min 4

v3 < 5                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4]

[dans(v3,[1,2,3,4])]=> v3 min 1

[min(v1,5)]
[min(v2,4)]
[min(v3,1)]=> if v0 > 6 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0>6,v0+(v1+(v2+v3))<16)]=> v0 in [3,4,5,6]

v1 is 5                                 : seen 
[v0=v1]
[dans(v0,[3,4,5,6])]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 5 : 

v1 is 5                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is red : 

c2 is red                               : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 4 : 

v2 is 4                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is green : 

c3 \= yellow                            : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,green,red]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,green,red])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
c2 is red                               : seen 
[dans(c3,[green,red])]=> c3 is green


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v0 is 5                                 : seen 
     => v0 max 5

v1 is 5                                 : seen 
     => v1 max 5

v2 is 4                                 : seen 
     => v2 max 4

[max(v0,5)]
[max(v1,5)]
[max(v2,4)]=> if v3 < 2 then v0 + v1 + v2 + v3 < 16

16 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<16)]=> v3 is 2



********** no reduction after move 2 **********

