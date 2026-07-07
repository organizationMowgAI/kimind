/* =========================== GERE UNE EXPLICATION ========================= */

:- module(explication,
		  [
			doublon/2,
			get_deduction_explication/2,
			get_antecedents_explication/2,
            get_but_explication/2,
            get_type_explication/2,
			get_explications_explication/2,
			set_type_explication/3
		  ]
		  ).

:- use_module(deduction).

% ----------
doublon(Explication, Explication1) :- 
	get_but_explication(Explication, But),
	get_but_explication(Explication1, But).

% ----------
set_type_explication(_Type,  [], []) :-
	!.

set_type_explication(
					  Type, expl(Deduction, Explications), 
					        expl(Deduction1, Explications)
                     ) :-
	set_type_deduction(Type, Deduction, Deduction1).


% ----------
get_explications_explication(expl(_Deduction, Explications), Explications).

% ----------
get_deduction_explication(expl(Deduction, _Explications), Deduction).

% ----------
get_type_explication(expl(Deduction, _Explications), Type):-
    deduction:get_type_deduction(Deduction, Type).

% ----------
get_but_explication(expl(Deduction, _Explications), But) :-
    deduction:get_but_deduction(Deduction, But).

% ----------
get_antecedents_explication(expl(_Deduction, Explications), Explications).

/* =============================== FIN LISTING =============================== */
