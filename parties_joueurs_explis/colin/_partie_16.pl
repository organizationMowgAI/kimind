ident(16,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(16,colin).
partie(16,'../parties_joueur/colin/_partie_16').
somme(16,25).
ordre_couleurs(16,[yellow,=,green,=,red,<,blue]).
solution(16,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(16,48).
cartes_jouees(16,
   [
     coup(1,48,1,[c(0,green,6,17.58,non,moins),c(1,yellow,6,2.48,non,plus),c(2,blue,7,4.66,non,moins),c(3,red,6,3.86,oui,moins)]),
     coup(2,1,1,[c(0,yellow,5,8.29,oui,oui),c(1,blue,10,27.87,oui,oui),c(2,green,5,3.49,oui,oui),c(3,red,5,5.26,oui,oui)])
   ]
            ).
resultat(16,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

v0 < 6                                  : answer of the system 
v0 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v0 in [1,2,3,4,5]

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v0,[1,2,3,4,5])]
[dans(v1,[7,8,9,10])]=> v0 < v1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[v0<v1]=> c0 avant c1

c0 \= green                             : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [blue,red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[blue,red,yellow])]=> c0 in [blue,yellow]

c1 \= yellow                            : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,green,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,green,red])]=> c1 in [blue,green]

c0 \= c1                                : intial constraint 
green avant blue                        : intial constraint 
[avant(c0,c1)]
[dans(c0,[blue,yellow])]
[dans(c1,[blue,green])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,yellow]

c3 is red                               : seen 
[dans(c2,[green,yellow])]=> c2 meme_rang c3

c2 meme_rang c3 <=> v2 = v3             : intial constraint 
[meme_rang(c2,c3)]=> v2 = v3

v0 max 5                                : seen 
v1 max 10                               : seen 
v3 max 5                                : seen 
     => if v2 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<25)]=> v2 in [5,6]

v0 max 5                                : seen 
v1 max 10                               : seen 
v2 max 6                                : seen 
     => if v3 < 4 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<4,v0+(v1+(v2+v3))<25)]=> v3 in [4,5]

[v2=v3]
[dans(v2,[5,6])]
[dans(v3,[4,5])]=> v2 is 5
v3 is 5

[dans(v2,[5]),dans(v3,[5])]=> v2 max 5

v1 max 10                               : seen 
v3 max 5                                : seen 
[max(v2,5)]=> if v0 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v0<5,v0+(v1+(v2+v3))<25)]=> v0 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c0 \= c1                                : seen 
c0 avant c1                             : connu_simplification_equivalence 
c0 is yellow                            : seen 
c1 in [blue,green]                      : seen 
green meme_rang yellow                  : intial constraint 
     => c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 max 5                                : seen 
v2 max 5                                : seen 
v3 max 5                                : seen 
     => if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
c2 in [green,yellow]                    : seen 
     => c2 is green


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v2 = v3                                 : connu_simplification_equivalence 
v2 in [5,6]                             : seen 
v3 in [4,5]                             : seen 
     => v2 is 5
v3 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v2 = v3                                 : connu_simplification_equivalence 
v2 in [5,6]                             : seen 
v3 in [4,5]                             : seen 
     => v2 is 5
v3 is 5



********** no reduction after move 2 **********

