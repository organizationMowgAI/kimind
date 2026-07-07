/* =========================================================================== */
/*                   GERE LA CONSULTATION ET LA SAUVEGARDE D'UN MODULE         */
/* =========================================================================== */

:- module(
		  file_module,
		  [
			load_module/1,
			load_module/2,

			save_module/1
		  ]
          ).

% ----------
	% charge le fichier Module (module prolog)
load_module(File) :-
	consult(File).

% ----------
	% charge le fichier Module (module prolog) depuis le dossier Dir
load_module(Module, Dir) :-
    atom_concat(Module, '.pl', File),
    directory_file_path(Dir, File, Path),
    consult(Path).

%----------
save_module(Module) :-
    atom_concat(Module, '.pl', File),
    exports_or_empty(Module, Exports),
    setup_call_cleanup(
        open(File, write, Out, [encoding(utf8)]),
        ( format(Out, ':- module(~q, ~q).~n~n', [Module, Exports]),
          forall(defined_predicate(Module, Name, Arity),
                 dump_predicate(Out, Module, Name, Arity))
        ),
        close(Out)
    ).

% ----------
        % cree la partie export dans :- module(nom, [])
exports_or_empty(Module, Exports) :-
    (
		module_property(Module, exports(Exports)) 
		-> true 
		; Exports = []
	).

% ----------
        % ecrit chaque predicat
defined_predicate(Module, Name, Arity) :-
    current_predicate(Module:Name/Arity),
    \+ hidden_name(Name),
    functor(Head, Name, Arity),
    predicate_property(Module:Head, defined),
    \+ predicate_property(Module:Head, imported_from(_)),
    \+ predicate_property(Module:Head, built_in),
    \+ predicate_property(Module:Head, foreign).

% ----------
hidden_name(Name) :-
    sub_atom(Name, 0, 1, _, '$').   % évite les prédicats internes

% ----------
    % cree les dynamics
dump_predicate(Out, Module, Name, Arity) :-
    functor(Head, Name, Arity),
    ( predicate_property(Module:Head, dynamic) ->
        format(Out, ':- dynamic ~q/~d.~n', [Name, Arity])
    ; true
    ),
    forall(clause(Module:Head, Body),
           portray_clause(Out, (Head :- Body))),
    nl(Out).

/* ================================= FIN LISTING ============================= */
