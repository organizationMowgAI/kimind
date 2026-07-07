ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,ouwais).
partie(23,'../parties_joueur/ouwais/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,1,[c(0,green,2,100.41,non,plus),c(1,red,2,5.16,non,oui),c(2,yellow,2,2.98,oui,oui),c(3,blue,6,7.16,non,moins)]),
     coup(2,1,1,[c(0,blue,5,6.77,oui,oui),c(1,green,2,7.17,oui,oui),c(3,red,2,1.85,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,red]

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c1 \= c2                                : seen 
c2 is yellow                            : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [blue,green]

v1 is 2                                 : answer of the system 
v2 is 2                                 : answer of the system 
     => v1 = v2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[v1=v2]=> c1 meme_rang c2

c1 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
c2 is yellow                            : seen 
[dans(c1,[blue,green])]
[meme_rang(c1,c2)]=> c1 is green

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c1 \= c3                                : intial constraint 
[dans(c1,[green])]
[dans(c3,[green,red])]=> c3 is red

c0 \= c3                                : intial constraint 
[dans(c0,[blue,red])]
[dans(c3,[red])]=> c0 is blue


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v1 is 2                                 : seen 
     => v1 max 2

v2 is 2                                 : seen 
     => v2 max 2

c2 is yellow                            : seen 
c3 in [green,red]                       : seen 
     => c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

v2 is 2                                 : seen 
[v2=v3]=> v3 is 2

[dans(v3,[2])]=> v3 max 2

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

