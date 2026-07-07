/* ========================================================================== */
/*                            GESTION D'UN STRING                             */
/* ========================================================================== */

:- module(string,
          [
			atom_to_structured_string/2,
			prolog_term/1,
			ends_with_point/1,
			separe_lignes/2
          ]
        ).

/* ================== FORMATAGE D'UN TERME PROLOG EN STRING ================= */

% ----------
	% Construit String correspondant a Atom
	% en formatant eventuellement les arguments d'Atom
atom_to_structured_string(Atom, String) :-
	term_to_structured_string(Atom, 0, String1),
	string_concat(String1, ".\n", String).

% ----------
	% Construit String de façon lisible selon la taille de Term
	% Tab est le nombre de tabulations a appliquer
	% Term n'a pas d'argument
term_to_structured_string(Term, Tab, String) :-
	atomic(Term), 
	!,
	term_string(Term, String1),
	tabule(String1, Tab, String).

	% Transforme une liste en String formatte
term_to_structured_string(List, Tab, String) :-
	is_list(List),
	!,
	get_args_disposition(List, Disposition),
	(
		Disposition == one_line
		-> term_string(List, String1),
		   tabule(String1, Tab, String)
		;  
			Tab1 is Tab + 1,
			terms_to_structured_string(List, Tab1, String_args),
			tabule("[\n", Tab, Crochet_ouvrant),
			tabule("]", Tab, Crochet_fermant),
			atomic_list_concat([Crochet_ouvrant, String_args, 
				                Crochet_fermant], String)
	).

	% Transforme un Atom en un String formatte
term_to_structured_string(Atom, Tab, String) :-
	split_args(Atom, Pred, Args),
	get_args_disposition(Args, Disposition),
	(
		Disposition == one_line
		-> Atom =.. [Pred|Args],
		   term_string(Atom, String1),
		   tabule(String1, Tab, String)
		;  
			Tab1 is Tab + 1,
										% formatte les arguments
			terms_to_structured_string(Args, Tab1, String_args),
			term_string(Pred, String_pred),
			tabule(String_pred, Tab, String_pred1),
			string_concat(String_pred1, "(\n", String_pred2),
			tabule(")", Tab, Parenthese_fermante),
			atomic_list_concat([String_pred2, String_args, Parenthese_fermante],
								String)
	).

% ----------
	% On construit String en fonction de la disposition souhaitee
	% des arguments Args du predicat Pred
terms_to_structured_string([], _Tab, "") :-
	!.

terms_to_structured_string([Arg], Tab, String) :-
	!,
	term_to_structured_string(Arg, Tab, String_arg),
	string_concat(String_arg, '\n', String).

terms_to_structured_string([Arg|Args], Tab, String) :-
	term_to_structured_string(Arg, Tab, String_arg),
	string_concat(String_arg, ',\n', String_arg1),
	terms_to_structured_string(Args, Tab, String_args),
	string_concat(String_arg1, String_args, String).

/* ======================================= DIVERS =========================== */

% ----------
tabule(String, Tab, String_out) :-
	tabulations(Tab, Tabulations),
	string_concat(Tabulations, String, String_out).

% ----------
	% Tabulation est un string contenant Tab tablutions

tabulations(0, "") :-
		!.

tabulations(Tab, Tabulations) :-
	Tab1 is Tab-1,
	tabulations(Tab1, Tabulations1),
	string_concat("\t", Tabulations1, Tabulations).

% ----------
	% On separe les arguments (le predicat est en tete de liste)
split_args(Term, Pred, Args) :-
	Term =.. [Pred|Args].
	
% ----------
	% Permet de savoir si on dispose les arguments sur une ligne ou plusieurs
	% S'il n'y a qu'un seul argument, ce sera forcement sur une seule ligne
get_args_disposition(Args, one_line) :-
	get_args_length(Args, 1),
	!.

get_args_disposition(Args, one_line) :-
	get_args_length(Args, Args_length),
	length_limit(Limit),
	Args_length =< Limit,
	!.

get_args_disposition(_Args, multiple_lines).

% ----------
	% Permet de recuperer le nombre de caracteres que constituent les arguments
get_args_length(Args, Args_length) :-
	term_to_atom(Args, Atom_args),
	atom_length(Atom_args, Args_length).

% ----------
	% Limite de caracteres au-dela de laquelle on ecrit sur plusieurs lignes
length_limit(40).

% ----------
starts_with_tab(String) :-
    sub_string(String, 0, 1, _, "\t").

% -------
closing_parenthesis(")").

% ----------
   % verifie que String correspond a un terme prolog
   % (un commentaire n'est pas un terme prolog)
prolog_term(String) :-
	catch(term_string(Term, String), _Exception, fail),
	Term \= end_of_file.

% ----------
ends_with_point(String) :-
	prolog_term(String),
	!,
	\+ starts_with_tab(String).

ends_with_point(String) :-
	closing_parenthesis(String).

% ----------
	% retourne la ligne si elle ne contient pas de \n
separe_lignes(String, String) :-
	count_nl(String, 0),
	!.

	% retourne une liste de lignes 
	% (il y a au moins un nl dans String)
separe_lignes(String, Lines) :-
    split_string(String, "\n", "\r", Lines).

% ----------
	% compte les lignes dans String
count_nl(String, N) :-
    string_codes(String, Codes),
    aggregate_all(count, member(10, Codes), N).

/* ============================= FIN LISTING ================================ */
