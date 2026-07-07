/* ========================================================================== */
/*				           SUPPRIME LES REDUCTIONS INUTILES                   */
/*                           ET LES EXPLICATIONS ASSOCIEES                    */              
/* ========================================================================== */

:- module(
          suppression_reductions,
          [
           supprime_reductions_inutiles/4
          ]
		 ).

:- use_module(gere_deductions).
		 
% ----------
supprime_reductions_inutiles(Reductions, Explications, 
							 Reductions_out, Explications_out) :-
	supprime_reductions_inutiles2(Reductions, Explications, [], 
								  Reductions_out, Explications_out).
		 
% ---------
supprime_reductions_inutiles2([], Explications, _Reductions_traitees, 
							  [], Explications) :-
	!.

	% Reduction deja traitee, arret.
supprime_reductions_inutiles2([Reduction|Reductions], Explications,
							   Reductions_traitees,
           					  [Reduction|Reductions], Explications) :-
	member(Reduction, Reductions_traitees),
	!.
	
	% Reduction pas traitee
supprime_reductions_inutiles2([Reduction|Reductions], Explications,
							   Reductions_traitees,
							   Reductions_out, Explications_out) :-
	supprime_reductions(Reductions, Reduction, Explications, 
						Reductions1, Explications1),
	append(Reductions1, [Reduction], Reductions2),
	supprime_reductions_inutiles2(Reductions2, Explications1,
								  [Reduction|Reductions_traitees],
								  Reductions_out, Explications_out).
								 
% ----------
	% supprime de Reductions les reductions plus faibles que Reduction1
supprime_reductions([], _Reduction1, Explications, [], Explications) :-
	!.
			
supprime_reductions([Reduction|Reductions], Reduction1, Explications,
					 Reductions_out, Explications_out) :-
	reduction_plus_faible(Reduction, Reduction1),
	gere_deductions:
        supprime_deduction(Explications, Reduction, Explications1),
	!,
	supprime_reductions(Reductions, Reduction1, Explications1,
						Reductions_out, Explications_out).
	
supprime_reductions([Reduction|Reductions], Reduction1, Explications,
				    [Reduction|Reductions_out], Explications_out) :-
	supprime_reductions(Reductions, Reduction1, Explications,
						Reductions_out, Explications_out).
	
% ----------
	% (une reduction parfaitement egale est consideree comme plus faible
	%  => on la supprime)
reduction_plus_faible(reduction(Var, Type, _D0, D1), 
                      reduction(Var, Type, _DA, DB)) :-
	subset(DB, D1).

/* ================================ FIN LISTING ============================= */
