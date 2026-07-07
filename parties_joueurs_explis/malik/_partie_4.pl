ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,malik).
partie(4,'../parties_joueur/malik/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,1,[c(0,blue,9,415.2,non,moins),c(1,green,8,3.88,oui,oui),c(2,yellow,7,5.74,non,plus),c(3,red,6,4.53,oui,moins)]),
     coup(2,1,1,[c(0,yellow,7,9.67,oui,oui),c(2,blue,10,9.09,oui,oui),c(3,red,5,94.76,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

blue \= c0                              : answer of the system 
c0 in [blue,green,red,yellow]           : known domain 
     => c0 in [green,red,yellow]

c0 \= c1                                : intial constraint 
c1 is green                             : answer of the system 
[dans(c0,[green,red,yellow])]=> c0 in [red,yellow]

c0 \= c3                                : intial constraint 
c3 is red                               : answer of the system 
[dans(c0,[red,yellow])]=> c0 is yellow


------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

yellow avant green                      : intial constraint 
c0 is yellow                            : seen 
c1 is green                             : seen 
     => c0 avant c1

c0 avant c1 <=> v0 < v1                 : intial constraint 
[avant(c0,c1)]=> v0 < v1

v1 is 8                                 : answer of the system 
     => v1 max 8

7 < v2                                  : answer of the system 
v2 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v2 in [8,9,10]

[dans(v2,[8,9,10])]=> v2 max 10

v3 < 6                                  : answer of the system 
v3 in [1,2,3,4,5,6,7,8,9,10]            : known domain 
     => v3 in [1,2,3,4,5]

[dans(v3,[1,2,3,4,5])]=> v3 max 5

[max(v1,8)]
[max(v2,10)]
[max(v3,5)]=> if v0 < 7 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v0<7,v0+(v1+(v2+v3))<30)]=> v0 in [7,8]

v1 is 8                                 : seen 
[v0<v1]
[dans(v0,[7,8])]=> v0 is 7


------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : seen 


------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : seen 


------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 \= yellow                            : answer of the system 
c2 in [blue,green,red,yellow]           : known domain 
     => c2 in [blue,green,red]

c1 \= c2                                : intial constraint 
c1 is green                             : seen 
[dans(c2,[blue,green,red])]=> c2 in [blue,red]

c2 \= c3                                : intial constraint 
c3 is red                               : seen 
[dans(c2,[blue,red])]=> c2 is blue


------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v0 is 7                                 : seen 
     => v0 max 7

v1 max 8                                : seen 
v3 max 5                                : seen 
[max(v0,7)]=> if v2 < 10 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v2<10,v0+(v1+(v2+v3))<30)]=> v2 is 10


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : seen 


------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 max 7                                : seen 
v1 max 8                                : seen 
v2 max 10                               : seen 
     => if v3 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : seen 
[si_alors(v3<5,v0+(v1+(v2+v3))<30)]=> v3 is 5



********** no reduction after move 2 **********

