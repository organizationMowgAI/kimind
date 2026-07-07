ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,danlin).
partie(23,'../parties_joueur/danlin/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,1,[c(0,yellow,2,2.16,non,plus),c(1,blue,5,21.91,non,moins),c(2,green,2,3.09,non,oui),c(3,red,2,2.0,oui,oui)]),
     coup(2,1,1,[c(0,blue,5,7.77,oui,oui),c(1,green,2,3.35,oui,oui),c(2,yellow,2,3.73,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [blue,green]

blue \= c1                              : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [green,red,yellow]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[green,red,yellow])]=> c1 in [green,yellow]

c2 \= green                             : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,red,yellow]

c2 \= c3                                : seen 
c3 is red                               : seen 
[dans(c2,[blue,red,yellow])]=> c2 in [blue,yellow]

v2 is 2                                 : answer of the system 
v3 is 2                                 : answer of the system 
     => v2 = v3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[v2=v3]=> c2 meme_rang c3

c2 \= c3                                : intial constraint 
red avant blue                          : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,yellow])]
[meme_rang(c2,c3)]=> c2 is yellow

c1 \= c2                                : intial constraint 
[dans(c1,[green,yellow])]
[dans(c2,[yellow])]=> c1 is green

c0 \= c1                                : intial constraint 
[dans(c0,[blue,green])]
[dans(c1,[green])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

c1 in [green,yellow]                    : seen 
c3 is red                               : seen 
     => c1 meme_rang c3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[meme_rang(c1,c3)]=> v1 = v3

v1 < 5                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [1,2,3,4]

v3 is 2                                 : seen 
[v1=v3]
[dans(v1,[1,2,3,4])]=> v1 is 2

[dans(v1,[2])]=> v1 max 2

v2 is 2                                 : seen 
     => v2 max 2

v3 is 2                                 : seen 
     => v3 max 2

[max(v1,2)]
[max(v2,2)]
[max(v3,2)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<5,v0+(v1+(v2+v3))<11)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v1 is 2                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v2 is 2                                 : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v3 is 2                                 : seen 



********** no reduction after move 2 **********

