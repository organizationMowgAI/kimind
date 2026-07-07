ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,danlin).
partie(16,'../parties_joueur/danlin/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,1,[c(0,yellow,6,16.6,oui,moins),c(1,green,6,3.39,non,plus),c(2,red,6,3.25,non,moins),c(3,blue,7,4.25,non,moins)]),
     coup(2,1,1,[c(0,yellow,5,10.54,oui,oui),c(1,green,5,4.95,non,plus),c(2,blue,5,4.23,non,oui),c(3,red,5,18.65,oui,oui)]),
     coup(3,1,1,[c(1,blue,8,4.51,oui,plus),c(2,green,5,11.81,oui,oui)]),
     coup(4,1,1,[c(1,blue,10,9.23,oui,oui)])
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

blue \= c3                              : answer of the system 
c3 in [blue,green,red,yellow]           : known domain 
     => c3 in [green,red,yellow]

c0 \= c3                                : intial constraint 
c0 is yellow                            : seen 
[dans(c3,[green,red,yellow])]=> c3 in [green,red]

c0 is yellow                            : seen 
[dans(c3,[green,red])]=> c0 meme_rang c3

c0 meme_rang c3 <=> v0 = v3             : intial constraint 
[meme_rang(c0,c3)]=> v0 = v3

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

v2 < 6                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5]

[dans(v2,[1,2,3,4,5])]=> v2 max 5

v3 < 7                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5,6]

[dans(v3,[1,2,3,4,5,6])]=> v3 max 6

[max(v1,10)]
[max(v2,5)]
[max(v3,6)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<25)]=> v0 in [4,5]

v0 in [4,5]                             : seen 
     => v0 max 5

v1 max 10                               : seen 
v2 max 5                                : seen 
[max(v0,5)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<25)]=> v3 in [5,6]

[v0=v3]
[dans(v0,[4,5])]
[dans(v3,[5,6])]=> v0 is 5
v3 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

v0 < 6                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5]

v1 in [7,8,9,10]                        : seen 
[dans(v0,[1,2,3,4,5])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : seen 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
red meme_rang yellow                    : intial constraint 
[avant(c0,c1)]
[dans(c1,[blue,red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v3 in [5,6]                             : seen 
     => v0 is 5
v3 is 5

[dans(v0,[5]),dans(v3,[5])]=> v3 max 5

v0 max 5                                : seen 
v2 max 5                                : seen 
[max(v3,5)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 \= red                               : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[blue,green,yellow])]=> c2 in [blue,green]

c1 \= c2                                : intial constraint 
c1 is blue                              : seen 
[dans(c2,[blue,green])]=> c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 max 5                                : seen 
v1 max 10                               : seen 
v3 max 5                                : seen 
     => if v2 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<25)]=> v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c2 \= c3                                : intial constraint 
c2 is green                             : seen 
c3 in [green,red]                       : seen 
     => c3 is red


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 = v3                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v3 in [5,6]                             : seen 
     => v0 is 5
v3 is 5



********** no reduction after move 2 **********

********** no reduction after move 3 **********

********** no reduction after move 4 **********

