ident(4,'30red<yellow<green<blue0yellow71green82blue103red5').
joueur(4,danlin).
partie(4,'../parties_joueur/danlin/_partie_4').
somme(4,30).
ordre_couleurs(4,[red,<,yellow,<,green,<,blue]).
solution(4,[c(0,yellow,7),c(1,green,8),c(2,blue,10),c(3,red,5)]).
nb_solutions(4,120).
cartes_jouees(4,
   [
     coup(1,120,1,[c(0,yellow,7,2.37,oui,oui),c(1,green,8,3.97,oui,oui),c(2,blue,9,22.67,oui,plus),c(3,red,6,4.27,oui,moins)]),
     coup(2,1,1,[c(2,blue,10,20.17,oui,oui),c(3,red,5,1.53,oui,oui)])
   ]
            ).
resultat(4,gagne).

********** no reduction considering the initial constraints *************

************* explanations of the reductions after move 1 *************

------------------------------------------------------------

the colour (c0) of the card in position 0 is yellow : 

c0 is yellow                            : answer of the system 

------------------------------------------------------------

the value (v0) of the card in position 0 is 7 : 

v0 is 7                                 : answer of the system 

------------------------------------------------------------

the colour (c1) of the card in position 1 is green : 

c1 is green                             : answer of the system 

------------------------------------------------------------

the value (v1) of the card in position 1 is 8 : 

v1 is 8                                 : answer of the system 

------------------------------------------------------------

the colour (c2) of the card in position 2 is blue : 

c2 is blue                              : answer of the system 

------------------------------------------------------------

the value (v2) of the card in position 2 is 10 : 

v2 > 9                                  : answer of the system 


------------------------------------------------------------

the colour (c3) of the card in position 3 is red : 

c3 is red                               : answer of the system 

------------------------------------------------------------

the value (v3) of the card in position 3 is 5 : 

v0 is 7                                 : seen 
     => v0 max 7

v1 is 8                                 : seen 
     => v1 max 8

v2 is 10                                : seen 
     => v2 max 10

[max(v0,7)]
[max(v1,8)]
[max(v2,10)]=> if v3 < 5 then v0 + v1 + v2 + v3 < 30

30 = v0 + v1 + v2 + v3                  : intial constraint 
[si_alors(v3<5,v0+(v1+(v2+v3))<30)]=> v3 is 5



********** no reduction after move 2 **********

