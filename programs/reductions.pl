/* ========================================================================== */
/*				           SUPPRIME LES REDUCTIONS INUTILES                   */
/* ========================================================================== */

:- module(
          suppression_reductions,
          [
           supprime_reductions_inutiles/2
          ]
		 ).
		 
% ----------
supprime_reductions_inutiles(Reductions, Reductions_out) :-
	supprime_reductions_inutiles2(Reductions, [], Reductions_out).
		 
% ---------
supprime_reductions_inutiles2([], _Reductions_traitees, []) :-
	!.

	% Reduction deja traitee, arret.
supprime_reductions_inutiles2([Reduction|Reductions], Reductions_traitees,
           					  [Reduction|Reductions) :-
	member(Reduction, Reductions_traitees),
	!.
	
	% Reduction pas traitee
supprime_reductions_inutiles2([Reduction|Reductions], Reductions_traitees,
							   Reductions_out) :-
	supprime_reductions(Reductions, Reduction, Reductions1),
	append(Reductions1, [Reduction], Reductions2),
	supprime_reductions_inutiles(Reductions2, [Reduction|Reductions_traitees], 
								 Reductions_out).
								 
% ----------
	% supprime de Reductions les reductions plus faibles que Reduction1
supprime_reductions([], _Reduction1, []) :-
	!.
			
supprime_reduction([Reduction|Reductions], Reduction1, Reductions_out) :-
	reduction_plus_faible(Reduction1, Reduction),
	!,
	supprime_reduction(Reductions, Reduction1, Reductions_out).
	
supprime_reduction([Reduction|Reductions], Reduction1, 
				   [Reduction|Reductions_out]) :-
	supprime_reduction(Reductions, Reduction1, Reductions_out).
	
% ----------
	% une reduction parfaitement egale est consideree comme plus faible
	% => on la supprime
reduction_plus_faible(r(Var, Type, _D0, D1), r(Var, Type, _DA, DB)) :-
	subset(DB, D1).
	
/* ================================ FIN LISTING ============================= */
