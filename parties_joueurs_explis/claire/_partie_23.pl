ident(23,'11green=yellow=red<blue0blue51green22yellow23red2').
joueur(23,claire).
partie(23,'../parties_joueur/claire/_partie_23').
somme(23,11).
ordre_couleurs(23,[green,=,yellow,=,red,<,blue]).
solution(23,[c(0,blue,5),c(1,green,2),c(2,yellow,2),c(3,red,2)]).
nb_solutions(23,48).
cartes_jouees(23,
   [
     coup(1,48,1,[c(0,blue,5,18.35,oui,oui),c(1,red,5,4.95,non,moins),c(2,yellow,5,7.55,oui,moins),c(3,green,3,21.45,non,moins)]),
     coup(2,1,1,[c(1,green,2,10.77,oui,oui),c(2,yellow,2,2.97,oui,oui),c(3,red,2,4.59,oui,oui)])
   ]
            ).
resultat(23,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is blue : 

c0 is blue                              : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

v0 is 5                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,yellow]

c0 \= c1                                : intial constraint 
c0 is blue                              : seen 
[dans(c1,[blue,green,yellow])]=> c1 in [green,yellow]

c1 \= c2                                : intial constraint 
c2 is yellow                            : answer of the system 
[dans(c1,[green,yellow])]=> c1 is green


------------------------------------------------------------

the value (v1) of the card in position 1 is 2 : 

v0 is 5                                 : seen 
     => v0 max 5

c1 is green                             : seen 
c2 is yellow                            : seen 
green meme_rang yellow                  : intial constraint 
     => c1 meme_rang c2

c1 meme_rang c2 <=> v1 = v2             : intial constraint 
[meme_rang(c1,c2)]=> v1 = v2

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c0 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c2 \= c3                                : intial constraint 
c2 is yellow                            : seen 
[dans(c3,[red,yellow])]=> c3 is red

c1 is green                             : seen 
green meme_rang red                     : intial constraint 
[dans(c3,[red])]=> c1 meme_rang c3

c1 meme_rang c3 <=> v1 = v3             : intial constraint 
[meme_rang(c1,c3)]=> v1 = v3

v1 < 5                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v1 in [1,2,3,4]

v3 < 3                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v3 in [1,2]

[v1=v3]
[dans(v1,[1,2,3,4])]
[dans(v3,[1,2])]=> v1 in [1,2]

v2 < 5                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8]                 : known domain 
     => v2 in [1,2,3,4]

[v1=v2]
[dans(v1,[1,2])]
[dans(v2,[1,2,3,4])]=> v2 in [1,2]

[dans(v2,[1,2])]=> v2 max 2

v3 in [1,2]                             : seen 
     => v3 max 2

[max(v0,5)]
[max(v2,2)]
[max(v3,2)]=> if v1 < 2 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v1<2,v0+(v1+(v2+v3))<11)]=> v1 is 2


------------------------------------------------------------

the colour (c2) of the card in position 2 is yellow : 

c2 is yellow                            : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 2 : 

v1 is 2                                 : seen 
     => v1 max 2

v0 max 5                                : seen 
v3 max 2                                : seen 
[max(v1,2)]=> if v2 < 2 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<2,v0+(v1+(v2+v3))<11)]=> v2 is 2


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 2 : 

v0 max 5                                : seen 
v1 max 2                                : seen 
v2 max 2                                : seen 
     => if v3 < 2 then v0 + v1 + v2 + v3 < 11

11 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<2,v0+(v1+(v2+v3))<11)]=> v3 is 2



********** no reduction after move 2 **********

