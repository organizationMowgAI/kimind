/* ========================================================================== */
/*                        GERE LES OPTIONS DE KIMIND                          */
/* ========================================================================== */

:- module(options,     
          [
            affiche_numeros_deductions/0,
			affiche_types_deductions/0
          ]
          ).

:- use_module(kimind_run).

:- dynamic
		kimind_run:affiche_numeros_deductions/0,
		kimind_run:affiche_types_deductions/0.

% ----------
affiche_numeros_deductions :-
	kimind_run:affiche_numeros_deductions,
	!.

affiche_numeros_deductions :-
	kimind_run:assert(affiche_numeros_deductions).

% ----------
retire_affiche_numeros_deductions :-
	kimind_run:affiche_numeros_deductions,
	!,
	kimind_run:retract(affiche_numeros_deductions).

retire_affiche_numeros_deductions.

% ----------
affiche_types_deductions :-
	kimind_run:affiche_types_deductions,
	!.

affiche_types_deductions :-
	kimind_run:assert(affiche_types_deductions).

% ----------
retire_affiche_types_deductions :-
	kimind_run:affiche_types_deductions,
	!,
	kimind_run:retract(affiche_types_deductions).

retire_affiche_types_deductions.

/* ============================== FIN LISTING =============================== */







