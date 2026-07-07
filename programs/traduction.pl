/* ========================================================================== */
/*                     GERE LES TRADUCTIONS DES TERMES FRANCAIS               */
/* ========================================================================== */

:- module(
			traduction,
		    [
				write_traduction/1,
				writeln_traduction/1,
				traduit/2
            ]
            ).

% ----------
write_traduction(Terme) :-
	traduit(Terme, Terme1),
	write(Terme1).

% ----------
writeln_traduction(Terme) :-
	write_traduction(Terme),
	nl.

% ----------
traduit(dans(Variable, [Valeur]), is(Variable, Valeur)) :-
	!.

traduit(dans(Variable, Domaine), in(Variable, Domaine)) :-
	!.
	
traduit(couleur, colour) :-
	!.

traduit(valeur, value) :-
	!.

traduit(T, T).
	
/* ============================== FIN LISTING =============================== */
