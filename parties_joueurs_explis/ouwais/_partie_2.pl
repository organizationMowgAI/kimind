ident(2,'39yellow<green=blue=red0green101yellow92blue103red10').
joueur(2,ouwais).
partie(2,'../parties_joueur/ouwais/_partie_2').
somme(2,39).
ordre_couleurs(2,[yellow,<,green,=,blue,=,red]).
solution(2,[c(0,green,10),c(1,yellow,9),c(2,blue,10),c(3,red,10)]).
nb_solutions(2,24).
cartes_jouees(2,
   [
     coup(1,24,3,[c(0,yellow,1,17.66,non,plus),c(1,green,10,3.94,non,moins),c(2,red,10,1.86,non,oui),c(3,blue,10,1.61,non,oui)]),
     coup(2,3,1,[c(0,green,10,2.02,oui,oui),c(1,yellow,9,10.74,oui,oui),c(2,blue,10,15.85,oui,oui),c(3,red,10,11.17,oui,oui)])
   ]
            ).
resultat(2,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [blue,green,red] : 

c0 \= yellow                            : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v1 < 10                                 : answer of the system 
     => v1 max 9

v2 is 10                                : answer of the system 
     => v2 max 10

v3 is 10                                : answer of the system 
     => v3 max 10

[max(v1,9)]
[max(v2,10)]
[max(v3,10)]=> if v0 < 10 then v0 + v1 + v2 + v3 < 39

39 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<10,v0+(v1+(v2+v3))<39)]=> v0 is 10


------------------------------------------------------------

the colour (c1) of the card in position 1 is yellow : 

v0 is 10                                : seen 
v1 is 9                                 : seen 
     => v1 < v0

c1 avant c0 <=> v1 < v0                 : intial constraint 
[v1<v0]=> c1 avant c0

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : seen 
c1 avant c0                             : connu_simplification_equivalence 
c0 in [blue,green,red]                  : seen 
blue meme_rang green                    : intial constraint 
blue meme_rang red                      : intial constraint 
[dans(c1,[blue,red,yellow])]=> c1 in [red,yellow]

c0 \= c1                                : intial constraint 
c0 in [blue,green,red]                  : seen 
blue meme_rang red                      : seen 
green meme_rang red                     : intial constraint 
[avant(c1,c0)]
[dans(c1,[red,yellow])]=> c1 is yellow


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v1 is 9                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

v0 is 10                                : seen 
v2 is 10                                : seen 
     => v0 = v2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[v0=v2]=> c0 meme_rang c2

c0 \= c2                                : intial constraint 
yellow avant blue                       : intial constraint 
yellow avant green                      : intial constraint 
yellow avant red                        : intial constraint 
c0 in [blue,green,red]                  : seen 
[dans(c2,[blue,green,yellow])]
[meme_rang(c0,c2)]=> c2 in [blue,green]


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [green,red] : 

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

v0 is 10                                : seen 
v3 is 10                                : seen 
     => v0 = v3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[v0=v3]=> c0 meme_rang c3

c0 \= c3                                : intial constraint 
yellow avant blue                       : seen 
yellow avant green                      : seen 
yellow avant red                        : seen 
c0 in [blue,green,red]                  : seen 
[dans(c3,[green,red,yellow])]
[meme_rang(c0,c3)]=> c3 in [green,red]


------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is green : 

c0 is green                             : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 10 : 

v0 is 10                                : known domain 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 is 10                                : known domain 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 10 : 

v3 is 10                                : known domain 



