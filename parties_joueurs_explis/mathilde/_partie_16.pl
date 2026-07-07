ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,mathilde).
partie(16,'../parties_joueur/mathilde/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,1,[c(0,yellow,5,3.76,oui,oui),c(1,green,5,2.89,non,plus),c(2,red,5,4.04,non,oui),c(3,blue,10,16.05,non,moins)]),
     coup(2,1,1,[c(1,blue,10,3.03,oui,oui),c(2,green,5,8.69,oui,oui),c(3,red,5,3.5,oui,oui)])
   ]
            ).
resultat(16,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : seen 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

v0 is 5                                 : seen 
v2 is 5                                 : answer of the system 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green])]
[meme_rang(c0,c2)]=> c2 is green

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c2 \= c3                                : intial constraint 
[dans(c2,[green])]
[dans(c3,[green,red])]=> c3 is red

c1 \= c3                                : intial constraint 
[dans(c1,[blue,red])]
[dans(c3,[red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 is 5                                 : seen 
     => v0 max 5

v2 is 5                                 : seen 
     => v2 max 5

c0 is yellow                            : seen 
c3 in [green,red]                       : seen 
     => c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

v0 is 5                                 : seen 
[v0=v3]=> v3 is 5

[dans(v3,[5])]=> v3 max 5

[max(v0,5)]
[max(v2,5)]
[max(v3,5)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 is 5                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v3 is 5                                 : seen 



********** no reduction after move 2 **********

