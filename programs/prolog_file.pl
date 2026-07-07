/* ========================================================================== */
/*          LIT/ECRIT/MODIFIE UN FICHIER PROLOG CONTENANT COMMENTAIRES        */
/* ========================================================================== */

:- module(prolog_file,
          [
			get_stream/3,

			read_lines/2,
			read_file/2,

			write_lines/2,
			write_lines_stream/2,
			write_file/2,

			modify_file/3,

			display_elements/1,
			get_comments/2,
			get_term/2
          ]
        ).

:- use_module(string).

/* ============================== OUVERTURE ================================= */

		% fichier deja ouvert dans le bon mode
get_stream(File_path, Mode, Stream) :-	
	current_stream(File_path, Mode, Stream),
	!.

		% si fichier ouvert dans le mauvais mode on ferme le stream  
		% dans tous les cas ouvre un nouveau Stream
get_stream(File_path, Mode, Stream) :-
	(
		current_stream(File_path, _Mode1, Stream1)
			-> 	close(Stream1)
			;   true
	),
	open(File_path, Mode, Stream).							
	
% ----------
open_file(File_path, Mode, Stream) :-
	get_stream(File_path, Mode, Stream).	% get_stream ouvre le fichier
											% si aucun fichier ouvert
 
/* ================================ LECTURE ================================= */

% ----------
read_lines(File, Lines) :-
	open_file(File, read, Stream),
	read_lines_stream(Stream, Lines),
	close(Stream).

% ----------
read_lines_stream(Stream, Lines) :-
    read_line_to_string(Stream, Line),
	(
		Line == end_of_file
			-> Lines = []	
        	; read_lines_stream(Stream, Suite),
			  Lines = [Line|Suite]
    ).

% ----------
read_file(File, Elements) :-
	open_file(File, read, Stream),
	read_elements_stream(Stream, Elements),
	close(Stream).

% ----------
read_elements_stream(Stream, Elements) :-
    read_term(Stream, Term, [comments(Comments)]),
    (   
		Term == end_of_file
    		->  Elements = []
    		;   
				Elements = [element(Comments, Term)|Suite],
        		read_elements_stream(Stream, Suite)
    ).

/* ============================== ECRITURE ================================== */

% ----------
write_lines(File, Lines) :-
	open_file(File, write, Stream),
	write_lines_stream(Stream, Lines),
	close(Stream).

% ----------
write_lines_stream(_, []) :-
	!.

write_lines_stream(Stream, [Line|Suite]) :-
	string:separe_lignes(Line, Ligne),
    (
		is_list(Ligne) 							% plusieurs lignes dans Ligne
		-> write_lines_stream(Stream, Ligne)
		;  write_line_stream(Stream, Ligne) 	% ecrit une ligne
    ),
    write_lines_stream(Stream, Suite).

% ----------
	% ecrit une ligne dans le fichier
write_line_stream(Stream, Line) :-
	write_term(Stream, Line, []),
	(
				string:ends_with_point(Line)
				-> write(Stream, '.')
				;  true
	),
	nl(Stream).
	
% ----------
write_file(File, Elements) :-
	open_file(File, write, Stream),
	write_elements_stream(Stream, Elements),
	close(Stream).

% ----------
write_elements_stream(_, []) :-
	!.

write_elements_stream(Stream, [element(Comments, Term)|Suite]) :-
    write_comments(Stream, Comments),
    write_term(Stream, Term, [quoted(true)]),
    write(Stream, '.'),
    nl(Stream),
    nl(Stream),
    write_elements_stream(Stream, Suite).

% ----------
write_comments(_, []) :-
	!.

write_comments(S, [_Pos-Comment|Suite]) :-
    format(S, '~s~n', [Comment]),
    write_comments(S, Suite).

/* =========================== MODIFICATION ================================= */

% ----------
	% modifie le fichier
modify_file(Directory, File, Modifications) :-
	read_file(Directory, File, Elements),
	modify_elements(Modifications, Elements, Modified_elements),
	write_file(Directory, File, Modified_elements).

% ----------
	% modifie Elements en fonction des Modifications
	% plus d'elements
modify_elements(_Modifications, [], []) :-
	!.

	% plus de mofications
modify_elements([], Elements, Elements) :-
	!.

	% ajout d'un element (place en dernier)
modify_elements([a(Element)|Modifications], Elements, Elements_out) :-
	!,
	modify_elements(Modifications, Elements, Elements1),
	append(Elements1, [element([], Element)], Elements_out).

	% retrait d'un element
modify_elements([r(Element)|Modifications], Elements, Elements1) :-
	!,
	select(element(_Comment, Element), Elements, ElementsA),
	modify_elements(Modifications, ElementsA, Elements1).

	% modification d'un element (place en dernier)
modify_elements([m(Element, New_element)|Modifications], Elements, 
				 Elements_out) :-
	!,
	select(element(Comment, Element), Elements, ElementsA),
	modify_elements(Modifications, ElementsA, Elements1),
		append(Elements1, [element(Comment, New_element)], Elements_out).

/* =============================== DIVERS =================================== */
  
% ----------
get_comments(element(Comments, _Term), Comments_out) :-
	delete_positions(Comments, Comments_out).

% ----------
get_term(element(_, Term), Term). 

% ----------
delete_positions([], []) :-
	!.

delete_positions([_Position-Comment|Comments], [Comment|Comments_out]) :-
	delete_positions(Comments, Comments_out).

% ----------
display_elements([]) :-
	!.

display_elements([Element|Elements]) :-
	display_element(Element),
	display_elements(Elements).

% ----------
display_element(element([], Term)) :-
	!,
	writeln(Term).

display_element(element(Comments, Term)) :-
	display_liste_elements(Comments),
	writeln(Term).

% ----------
display_liste_elements([]) :-
	!.

display_liste_elements([_Position-Comment|Comments]) :-
	writeln(Comment),
	display_liste_elements(Comments).

/* ============================= FIN LISTING ================================ */
