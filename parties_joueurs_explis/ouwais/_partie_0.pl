ident(0,'35yellow<red=blue<green0red91blue92green103yellow7').
joueur(0,ouwais).
partie(0,'../parties_joueur/ouwais/_partie_0').
somme(0,35).
ordre_couleurs(0,[yellow,<,red,=,blue,<,green]).
solution(0,[c(0,red,9),c(1,blue,9),c(2,green,10),c(3,yellow,7)]).
nb_solutions(0,24).
cartes_jouees(0,
   [
     coup(1,24,3,[c(0,blue,3,158.94,non,plus),c(1,yellow,1,13.28,non,plus),c(2,red,2,7.93,non,plus),c(3,green,7,2.85,non,oui)]),
     coup(2,3,1,[c(0,yellow,4,34.56,non,plus),c(1,red,6,13.2,non,plus),c(2,blue,8,12.33,non,plus),c(3,green,7,1.67,non,oui)]),
     coup(3,1,1,[c(0,yellow,6,44.05,non,plus),c(1,red,9,6.5,non,oui),c(2,blue,9,3.25,non,plus),c(3,green,7,0.96,non,oui)]),
     coup(4,1,1,[c(0,green,6,7.75,non,plus),c(1,blue,9,34.03,oui,oui),c(2,red,6,2.29,non,plus),c(3,yellow,7,1.23,oui,oui)]),
     coup(5,1,1,[c(0,red,9,25.01,oui,oui),c(2,green,10,14.09,oui,oui)])
   ]
            ).
resultat(0,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is in [green,red] : 

v1 in [5,6,7,8,9,10]                    : known domain 
     => v1 max 10

v2 in [5,6,7,8,9,10]                    : known domain 
     => v2 max 10

v3 is 7                                 : answer of the system 
     => v3 max 7

[max(v1,10)]
[max(v2,10)]
[max(v3,7)]=> if v0 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<8,v0+(v1+(v2+v3))<35)]=> v0 in [8,9,10]

v3 is 7                                 : seen 
[dans(v0,[8,9,10])]=> v3 < v0

c3 avant c0 <=> v3 < v0                 : intial constraint 
[v3<v0]=> c3 avant c0

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c3 \= green                             : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
yellow avant blue                       : intial constraint 
yellow avant red                        : intial constraint 
[avant(c3,c0)]
[dans(c0,[green,red,yellow])]
[dans(c3,[blue,red,yellow])]=> c0 in [green,red]


------------------------------------------------------------

the value (v0) of the card in position 0 is in [8,9,10] : 

v0 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c1) of the card in position 1 is in [blue,green,red] : 

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]


------------------------------------------------------------

the value (v1) of the card in position 1 is in [8,9,10] : 

v0 in [8,9,10]                          : seen 
     => v0 max 10

v2 max 10                               : seen 
v3 max 7                                : seen 
[max(v0,10)]=> if v1 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<8,v0+(v1+(v2+v3))<35)]=> v1 in [8,9,10]


------------------------------------------------------------

the colour (c2) of the card in position 2 is in [blue,green] : 

v0 max 10                               : seen 
v1 max 10                               : seen 
v3 max 7                                : seen 
     => if v2 < 8 then v0 + v1 + v2 + v3 < 35

35 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<8,v0+(v1+(v2+v3))<35)]=> v2 in [8,9,10]

v3 is 7                                 : seen 
[dans(v2,[8,9,10])]=> v3 < v2

c3 avant c2 <=> v3 < v2                 : intial constraint 
[v3<v2]=> c3 avant c2

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c2 \= c3                                : intial constraint 
yellow avant blue                       : seen 
yellow avant red                        : seen 
c3 in [blue,red,yellow]                 : seen 
[avant(c3,c2)]
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]


------------------------------------------------------------

the value (v2) of the card in position 2 is in [8,9,10] : 

v2 in [8,9,10]                          : seen 


------------------------------------------------------------

the colour (c3) of the card in position 3 is in [blue,red,yellow] : 

c3 in [blue,red,yellow]                 : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : seen 



************* explanations of the reductions after move 2 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is red : 

c0 \= c2                                : intial constraint 
c0 in [green,red]                       : known domain 
c2 \= blue                              : answer of the system 
     => c0 is red


------------------------------------------------------------

the value (v0) of the card in position 0 is 9 : 

c1 \= red                               : answer of the system 
c1 in [blue,green,red]                  : known domain 
     => c1 in [blue,green]

c1 \= c2                                : intial constraint 
c2 is green                             : seen 
[dans(c1,[blue,green])]=> c1 is blue

c0 is red                               : seen 
blue meme_rang red                      : intial constraint 
[dans(c1,[blue])]=> c0 meme_rang c1

c0 meme_rang c1 <=> v0 = v1             : intial constraint 
[meme_rang(c0,c1)]=> v0 = v1

red avant green                         : intial constraint 
c0 is red                               : seen 
c2 is green                             : seen 
     => c0 avant c2

c0 avant c2 <=> v0 < v2                 : intial constraint 
[avant(c0,c2)]=> v0 < v2

8 < v2                                  : answer of the system 
v2 in [8,9,10]                          : known domain 
     => v2 in [9,10]

v0 in [8,9,10]                          : known domain 
[v0<v2]
[dans(v2,[9,10])]=> v0 in [8,9]

v1 in [8,9,10]                          : known domain 
[v0=v1]
[dans(v0,[8,9])]=> v1 in [8,9]

[dans(v1,[8,9])]=> v1 max 9

v2 in [9,10]                            : seen 
     => v2 max 10

[max(v1,9)]
[max(v2,10)]=> if v0 < 9 then v0 + v1 + v2 < 28

28 = v0 + v1 + v2                       : intial constraint 
[si_alors(v0<9,v0+(v1+v2)<28)]=> v0 is 9


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 is blue                              : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 9 : 

v0 is 9                                 : seen 
     => v0 max 9

v2 max 10                               : seen 
[max(v0,9)]=> if v1 < 9 then v0 + v1 + v2 < 28

28 = v0 + v1 + v2                       : seen 
[si_alors(v1<9,v0+(v1+v2)<28)]=> v1 is 9


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v0 max 9                                : seen 
v1 max 9                                : seen 
     => if v2 < 10 then v0 + v1 + v2 < 28

28 = v0 + v1 + v2                       : seen 
[si_alors(v2<10,v0+(v1+v2)<28)]=> v2 is 10


------------------------------------------------------------

the colour (c3) of the card in position 3 is yellow : 

c1 \= c3                                : seen 
c3 avant c1                             : seen 
c1 is blue                              : seen 
c3 in [blue,red,yellow]                 : known domain 
blue meme_rang red                      : seen 
     => c3 in [blue,yellow]

c1 \= c3                                : intial constraint 
c3 avant c1                             : intial constraint 
c1 is blue                              : seen 
[dans(c3,[blue,yellow])]=> c3 is yellow


------------------------------------------------------------

the value (v3) of the card in position 3 is 7 : 

v3 is 7                                 : known domain 



********** no reduction after move 3 **********

********** no reduction after move 4 **********

********** no reduction after move 5 **********

