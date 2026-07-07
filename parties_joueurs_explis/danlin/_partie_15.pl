ident(15,'35yellow<green<red=blue0red101blue102green83yellow7').
joueur(15,danlin).
partie(15,'../parties_joueur/danlin/_partie_15').
somme(15,35).
ordre_couleurs(15,[yellow,<,green,<,red,=,blue]).
solution(15,[c(0,red,10),c(1,blue,10),c(2,green,8),c(3,yellow,7)]).
nb_solutions(15,48).
cartes_jouees(15,
   [
     coup(1,48,2,[c(0,yellow,7,3.71,non,plus),c(1,blue,10,35.99,oui,oui),c(2,red,10,2.18,non,moins),c(3,green,8,1.71,non,moins)]),
     coup(2,2,1,[c(0,red,10,5.42,oui,oui),c(2,green,8,2.5,oui,oui),c(3,yellow,7,11.23,oui,oui)])
   ]
            ).
resultat(15,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]

c0 \= c1                                : intial constraint 
c1 is blue                              : answer of the system 
[dans(c0,[blue,green,red])]=> c0 in [green,red]

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [green,yellow]

7 < v0                                  : answer of the system 
v0 in [5,6,7,8,9,10]                    : known domain 
     => v0 in [8,9,10]

v3 < 8                                  : answer of the system 
v3 in [5,6,7,8,9,10]                    : known domain 
     => v3 in [5,6,7]

[dans(v0,[8,9,10])]
[dans(v3,[5,6,7])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c1 \= c3                                : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,red,yellow])]=> c3 in [red,yellow]

c0 \= c3                                : intial constraint 
green avant red                         : intial constraint 
c0 in [green,red]                       : seen 
[avant(c3,c0)]
[dans(c3,[red,yellow])]=> c3 is yellow

c2 \= c3                                : intial constraint 
[dans(c2,[green,yellow])]
[dans(c3,[yellow])]=> c2 is green

c0 \= c2                                : intial constraint 
[dans(c0,[green,red])]
[dans(c2,[green])]=> c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

c0 is red                               : seen 
c1 is blue                              : seen 
blue meme_rang red                      : intial constraint 
     => c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

v0 in [9,10]                            : seen 
v1 is 10                                : seen 
[v0=v1]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v1 is 10                                : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9] : 

v0 max 10                               : seen 
v1 max 10                               : seen 
v3 max 7                                : seen 
     => if v2 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<8,v0+(v1+(v2+v3))<35)]=> v2 in [8,9]


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is in [6,7] : 

v3 in [6,7]                             : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : known domain 


------------------------------------------------------------

the value (v2) of the card in position 2 is 8 : 

v2 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c3 is yellow                            : known domain 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : answer of the system 


