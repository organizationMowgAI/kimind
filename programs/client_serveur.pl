/* ========================================================================== */
/*                           GERE UN CLIENT SERVEUR                           */ 
/* ========================================================================== */

:- module(client_serveur,
		  [
			ouvre_connexion/1,
			ouvre_connexion/2,
			ferme_connexion/1,

			ecrit/2,
			ecrit_reponse/3,
            ecrit_json/2,
			ecrit_json/3,
			ecrit_reponse_json/4,

			lit/2,
			lit_fonction/2
		  ]
         ).

:- 
	use_module(library(socket)),
 	use_module(library(http/json)),
	use_module(library(process)),
    use_module(library(time)).

/* ========================= CONNEXION/DECONNEXION ========================== */
	
% ----------
ouvre_connexion(Port) :-
	connecte('127.0.0.1', Port).

% ----------
ouvre_connexion(Adresse, Port) :-
	connecte(Adresse, Port).

% ----------	
connecte(Adresse, Port) :-
	catch(
			connecte_socket(Adresse, Port), 
			Error,
			(
				format('Erreur de connexion: ~w~n', [Error]),
				sleep(2),
				connecte(Adresse, Port)
			)
          ).
			
% ----------
connecte_socket(Adresse, Port) :-
	writeln('prolog serveur : demande connexion a client python'),
	tcp_socket(Socket),
	tcp_connect(Socket, Adresse:Port),
	tcp_open_socket(Socket, In, Out),
	writeln('prolog serveur : connexion acceptee'),
	memorise_connexion(Port, In, Out).

% -----------
	% Fermer la connexion
ferme_connexion(Port) :-
    writeln('fin de la connexion'),
	stream_in_out(Port, In, Out),
    close(In), 
	close(Out),
	time:sleep(1).

% ----------
memorise_connexion(Port, In, Out) :-
	asserta(stream_in(Port,In)),
	asserta(stream_out(Port, Out)).

% ----------
erase_in_out(Port) :-
	retract(stream_in(Port, _In)),
	retract(stream_out(Port, _Out)).	

% ----------
stream_in_out(Port, In, Out) :-
	stream_in(Port, In),
	stream_out(Port, Out).

/* ==========================  LECTURE/ECRITURE ============================ */

% ----------
ecrit(Port, Message) :-
	stream_out(Port, Out),
    writeln('message envoye :'),
    writeln(Message),
	writeln(Out, Message),
    flush_output(Out).

ecrit_avec_fin(Port, Message) :-
	stream_out(Port, Out),
    ecrit(Port, Message),
    writeln(Out, '<<END>>'),
    flush_output(Out).
    
% ----------
ecrit_reponse(Port, Message, Reponse) :-
	stream_in_out(Port, In, Out),
	ecrit_message(Port, Out, Message),
	lit_message(Port, In, Out, Reponse).

% ----------
ecrit_json(Port, Terme) :-
	stream_out(Port, Out),
    Terme =..[Function|Args],
    convertit_liste_to_json(Args, Json_args),
	format(Out, '{"function":"~w","args":~w}', [Function, Json_args]),
	nl(Out),
    flush_output(Out),
	write('prolog: requete '),
	write(' envoyee : '),
    format("~w~n", [{"function": Function, "args": Json_args}]).

% ----------
ecrit_json(Port, Function, Args) :-
	stream_out(Port, Out),
	convertit_liste_to_json(Args, Json_args),
    json_write_dict(Out, {function: Function, args: Json_args}),
	nl(Out),
    flush_output(Out),
	write('prolog: requete '),
	write(' envoyee : '),
    format("~w~n", [{function: Function, args: Args}]).

% ----------
ecrit_reponse_json(Port, Function, Args, Reponse) :-
	ecrit_json(Port, Function, Args),
	lit_json(Port, Reponse).

% ---------
convertit_liste_to_json([], []) :-
    !.

convertit_liste_to_json([Arg|Args], [Json_arg|Json_args]) :-
    convertit_to_json(Arg, Json_arg),
    convertit_liste_to_json(Args, Json_args).

% -----------
convertit_to_json(L, Json_liste) :-
    is_list(L),
    !,
    convertit_liste_to_json(L, Json_liste).

convertit_to_json(Terme, Json_string) :-
    compound(Terme),
    !,
    Terme =..[Fonction|Args],
    convertit_liste_to_json(Args, Json_args),
	format(string(Json_string), 
		   '{"function":"~w","args":~w}', [Fonction, Json_args]),
	writeln(Json_string).
   
convertit_to_json(Number, Number) :-
	number(Number),
	!.

convertit_to_json(Atom, Atom_string) :-
	atom(Atom),
	!,
	format(string(Atom_string), "\"~w\"", [Atom]).

convertit_to_json(Arg, Arg).

% ----------
lit(Port, Message) :-
	stream_in(Port, In),
	writeln('prolog : lecture requete...'),
	repeat,  
    attend_message(In, Message),
	writeln('prolog requete lue'),
	writeln(Message),
	format("prolog: message lu : ~w~n", [Message]).

% ----------
lit_fonction(Port, Fonction) :-
	stream_in(Port, In),
	attend_message(In, Message),
	format("prolog: message reçu : ~w~n", [Message]),
	atom_json_dict(Message, Dictionnaire, []),
	(
		Dictionnaire.get(error)
			->
				writeln('prolog: !!! erreur dans terme recu!!!')
			;
                Foncteur = Dictionnaire.get(fonction),
				atom_string(Foncteur1, Foncteur),
				Arguments = Dictionnaire.get(args),
				writeln(Arguments),
				Fonction =..[Foncteur1|Arguments]
	).

% ----------
attend_message(In, Message) :-
	repeat,
	read_line_to_string(In, Message),
	(
		member(Message, [""])
		-> fail
		;  true
	),
	!.
	
/* =============================== PROCESSUS ================================ */

% ----------
free_port(Port) :-
    find_pid(Port, Pid),
	!,
    kill_process(Pid).

free_port(_Port).

% --------
find_pid(Port, Pid) :-
    format(atom(Command), 'lsof -i :~w -t', [Port]),
	catch(
			setup_call_cleanup(
							    process_create(path(sh), 
		                        			   ['-c', Command], 
		                                       [stdout(pipe(Out))]),
							    read_stream_to_codes(Out, Codes1),
							    close(Out)
				               ),
			 Error,
			 (
				format('Erreur de connexion: ~w~n', [Error]),
				!,
				fail
			 )	  
		),
		
	(
		append(Codes, [10], Codes1) 
		-> true ; 
		Codes = Codes1
    ),
    atom_codes(Atom, Codes),
    atom_number(Atom, Pid).

% ----------
kill_process(Pid) :-
    format(atom(Command), 'kill -9 ~w', [Pid]),
    shell(Command).

% ----------
remove_newline(CodesIn, CodesOut) :-
    append(CodesOut, '\n', CodesIn), 
	!.

remove_newline(CodesIn, CodesIn).

/* ============================= FIN LISTING ================================ */     
