/* ========================================================================== */
/*                            GESTION D'UN MODULE                             */
/* ========================================================================== */

:- module(gestion_module,
		  [
			reset_module/1,
			reset_records_module/1
		  ]
         ).

:- use_module(library(apply)).

% ----------
reset_module(Module) :-
    forall(
        	current_predicate(Module:Nom/Arite),
        	catch(abolish(Module:Nom/Arite), _, true)
    	  ),
    reset_records_module(Module).

% ----------
reset_records_module(Module) :-
	Pred=..[Module,_X],
    forall(
        	recorded(Pred, _, Ref),
       	 	erase(Ref)
    	  ).

/* =============================== FIN LISTING ============================== */
                 
