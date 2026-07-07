ident(17,'25yellow=green=red<blue0yellow51blue102green53red5').
joueur(17,veronique).
partie(17,'../parties_joueur/veronique/_partie_17').
somme(17,25).
ordre_couleurs(17,[yellow,=,green,=,red,<,blue]).
solution(17,[c(0,yellow,5),c(1,blue,10),c(2,green,5),c(3,red,5)]).
nb_solutions(17,48).
cartes_jouees(17,
   [
     coup(1,48,1,[c(0,yellow,6,58.67,oui,moins),c(1,green,6,4.43,non,plus),c(2,blue,7,4.0,non,moins),c(3,red,6,2.88,oui,moins)]),
     coup(2,1,1,[c(0,yellow,5,15.18,oui,oui),c(1,blue,10,3.76,oui,oui),c(2,green,5,19.72,oui,oui),c(3,red,5,2.61,oui,oui)])
   ]
            ).
resultat(17,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 5 : 

blue \= c2                              : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [green,red,yellow]

c0 \= c2                                : intial constraint 
c0 is yellow                            : seen 
[dans(c2,[green,red,yellow])]=> c2 in [green,red]

c2 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c2,[green,red])]=> c2 is green

c0 is yellow                            : seen 
green meme_rang yellow                  : intial constraint 
[dans(c2,[green])]=> c0 meme_rang c2

c0 meme_rang c2 <=> v0 = v2             : intial constraint 
[meme_rang(c0,c2)]=> v0 = v2

6 < v1                                  : answer of the system 
v1 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v1 in [7,8,9,10]

[dans(v1,[7,8,9,10])]=> v1 max 10

v2 < 7                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [1,2,3,4,5,6]

[dans(v2,[1,2,3,4,5,6])]=> v2 max 6

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5]

[dans(v3,[1,2,3,4,5])]=> v3 max 5

[max(v1,10)]
[max(v2,6)]
[max(v3,5)]=> if v0 < 4 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<4,v0+(v1+(v2+v3))<25)]=> v0 in [4,5]

v0 in [4,5]                             : seen 
     => v0 max 5

v1 max 10                               : seen 
v3 max 5                                : seen 
[max(v0,5)]=> if v2 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<5,v0+(v1+(v2+v3))<25)]=> v2 in [5,6]

[v0=v2]
[dans(v0,[4,5])]
[dans(v2,[5,6])]=> v0 is 5
v2 is 5


------------------------------------------------------------

the colour (c1) of the card in position 1 is blue : 

c1 \= green                             : answer of the system 
c1 in [blue,green,red,yellow]           : known domain 
     => c1 in [blue,red,yellow]

c0 \= c1                                : intial constraint 
c0 is yellow                            : seen 
[dans(c1,[blue,red,yellow])]=> c1 in [blue,red]

c1 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c1,[blue,red])]=> c1 is blue


------------------------------------------------------------

the value (v1) of the card in position 1 is 10 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [5,6]                             : seen 
     => v0 is 5
v2 is 5

[dans(v0,[5]),dans(v2,[5])]=> v2 max 5

v0 max 5                                : seen 
v3 max 5                                : seen 
[max(v2,5)]=> if v1 < 10 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v1<10,v0+(v1+(v2+v3))<25)]=> v1 is 10


------------------------------------------------------------

the colour (c2) of the card in position 2 is green : 

c2 is green                             : seen 


------------------------------------------------------------

the value (v2) of the card in position 2 is 5 : 

v0 = v2                                 : connu_simplification_equivalence 
v0 in [4,5]                             : seen 
v2 in [5,6]                             : seen 
     => v0 is 5
v2 is 5


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 max 5                                : seen 
v1 max 10                               : seen 
v2 max 5                                : seen 
     => if v3 < 5 then v0 + v1 + v2 + v3 < 25

25 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<25)]=> v3 is 5



********** no reduction after move 2 **********

