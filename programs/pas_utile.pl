
recupere_infos_parties(_Dir, [], []) :-
    !.

recupere_infos_parties(Dir, [Fichier|Fichiers],
                       [Infos_partie|Infos_parties]) :-
	recupere_infos_partie(Dir, Fichier, Infos_partie),
    recupere_infos_parties(Dir, Fichiers, Infos_parties).
  
% ----------
recupere_infos_partie(Dir, Fichier, 
					 infos_partie(Id_partie, Somme, Ordre, Solution)) :-
	string_concat(Dir, Fichier, Chemin),
    consult(Chemin),
    somme(Id_partie, Somme), 
    ordre_couleurs(Id_partie, Ordre),
    solution(Id_partie, Solution).



% ---------
        print("PID python:", os.getpid(), flush=True)
                    # creation du socket
        self._server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self._server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

                    # liaison du socket a une adresse et un port
        self._server_socket.bind((self._host, self._port))
    
                    # met le socket en etat d'ecoute
        self._server_socket.listen(1)

                    # accepter la connexion
        print("LISTEN sur", self._server_socket.getsockname(), flush=True)
        print('(python) attente de la demande de connexion')
        self._connexion, self._adresse = self._server_socket.accept()
        print(f"(python) connexion acceptée depuis {self._adresse}", flush=True)
        print()

% ----------
    % on partitionne les sommes en fonction de la place de leur distribution
    % D dans Parties_distributions
partition_sommes(Effectifs_sommes, Parties_distributions, Parties_sommes) :-
    length(Parties_distributions, K),
    listes_vides(K, Parties_sommes1),
    partition_sommes2(Effectifs_sommes, Parties_distributions, 
                      Parties_sommes1, Parties_sommes).
    
% ----------
partition_sommes2([], _Parties_distributions, Parties_sommes, Parties_sommes) :-
    !.

partition_sommes2([e(S, D)|Sommes], Parties_distributions, 
                  Parties_sommes, Parties_sommes_out) :-
    insere_dans_partie(Parties_distributions, Parties_sommes, e(S, D), 
                       Parties_sommes1),
    partition_sommes2(Sommes, Parties_distributions, 
                      Parties_sommes1, Parties_sommes_out).

% ----------
    % insere e(S,D) dans la partie en fonction du nombre de distributions D
insere_dans_partie([Partie_dis|_Parties_dis], [Partie_sum|Parties_sum], 
                   e(S, D), [Partie_sum1|Parties_sum]) :-
    member(e(D, _), Partie_dis),
    !,
    append(Partie_sum, [e(S,D)], Partie_sum1).

insere_dans_partie([_Partie_dis|Parties_dis], [Partie_sum|Parties_sum], Elt,
                   [Partie_sum|Parties_sommes]) :-
  insere_dans_partie(Parties_dis, Parties_sum, Elt, Parties_sommes).

 
# ======================= FONCTIONS 1 ARGUMENT ============================

    def demande(self, message):
        print("demande : " + message)
        self._client.envoie(message)
        reponse = self._client.lit()
        print('reponse :')
        print(reponse)
        print()
        return reponse

    def demande_int(self, message):
        return int(self.demande(message))

    def demande_string(self, message):
        return self.demande(message)

    def demande_float(self, message):
        return float(self.demande(message))

    def demande_bool(self, message):
            return bool(self.demande(message))

    # ========================== FONCTIONS 2 arguments ========================

    def demande2(self, message, argument):
        self._client.envoie(message)
        self._client.envoie(argument)
        return self._client.lit()

    def demande2_int(self, message, argument):
        print(message)
        return int(self.demande2(message,argument))

    def demande_string(self, message, argument):
        return self.demande2(message,argument)

    def demande_float(self, message, argument):
        return float(self.demande2(message, argument))

    def demande_bool(self, message, argument):
            return bool(self.demande2(message, argument))



% -----------
supprime_equivalence_valeur(Comp_coul <=> Comp_val, 
							Domaines_singletons, 
                            Comp_coul1 <=> Comp_val1,
							[]) :-
    gtrace,
	separateur_contrainte,
	write_domaines_singletons(Domaines_singletons),
	writeln_contrainte(Comp_coul <=> Comp_val),
	implique,
	writeln_contrainte(Comp_coul1 <=> Comp_val1),
	et_comme,
	write_contrainte(Comp_val1),
	writeln(' est fause'),
	implique,
	writeln('on supprime ces equivalences'),
	separateur_contrainte,
	saut_contrainte.
	
% -----------
supprime_equivalence_couleur(Comp_coul <=> Comp_val, 
							 Domaines_singletons, 
                             Comp_coul1 <=> Comp_val1,
							 []) :-
	gtrace,
	separateur_contrainte,
	write_domaines_singletons(Domaines_singletons),
	writeln_contrainte(Comp_coul <=> Comp_val),
	implique,
	writeln_contrainte(Comp_coul1 <=> Comp_val1),
	et_comme,
	write_contrainte(Comp_coul1),
	writeln(' est fause'),
	implique,
	writeln('on supprime ces equivalences'),
	separateur_contrainte,
	saut_contrainte.

% ----------
supprime_equivalence(Comp_couleurs <=> Comp_valeurs, 
    	                 Comp_faux, Comp_ajout,
					 [
						e(
						   N, 
						   suppression_equivalence,
                           [Comp_vrai, Comp_couleurs <=> Comp_valeurs], 
                           [Comp_ajout]
                         )
                     ]
					) :-

    comparaisons:negation_comp(Comp_faux, Comp_vrai),
	separateur_contrainte,
	write_contrainte(Comp_faux),
    writeln(' est faux'),
    write_contrainte(Comp_vrai),
    writeln(' est vrai'),
	et,
	writeln_contrainte(Comp_couleurs <=> Comp_valeurs),
	implique,
	writeln_contrainte(Comp_ajout),
    separateur_contrainte,
	saut_contrainte,
    gtrace,
    cree_deductions_equivalence(Comp_vrai, Comp_couleurs <=> Comp_valeurs,
                                Deduction_comp, Deduction_equivalence),
    	compteur:lit_compteur(expli, N).

% ----------
cree_deductions_equivalence(Comparaison, Equivalence,
                            e(N1, comparaison, _, [Comparaison]),
                            e(N2, equivalence, _, [Equivalence])):-                         
    compteur:lit_compteur(expli, N1),
    compteur:lit_compteur(expli, N2).


% ----------
explicite_deductions(Deductions) :-
    nl,
    writeln('on peut en deduire : '),
	nl,
    affichage_deductions:display_explications(Deductions).

% ----------
explicite_deductions_reponse(Deductions) :-
    nl,
	writeln('d''apres les réponses du système nous savons que :'),
	explicite_deductions_position(Deductions).

% ----------
	% affecte un message clair a chaque Deduction
	% de chaque position
explicite_deductions_position([]) :-
	!.

explicite_deductions_position([ex(Pos, Deductions_pos)|Deductions]) :-
	explicite_deductions_pos(Pos, Deductions_pos),
	explicite_deductions_position(Deductions).

% ---------
explicite_deductions_pos(Position, Deductions) :-
	nl,
	write('en position '),
	write(Position),
    writeln(' :'),
    nl,
	affichage_deductions:display_explications(Deductions).

% ----------
assert_contraintes([]) :-
    !.

assert_contraintes([Contrainte|Contraintes]) :-
    assert(e(-1, contrainte_initiale, [], [Contrainte])), 
    assert(connu(Contrainte, contrainte_initiale, -1, [])), 
    assert_contraintes(Contraintes).
    
% ----------
construit_contraintes(Vars_couleur, Vars_valeur, Contraintes) :-
    construit_couleurs_distinctes(Vars_couleur, Couleurs_distinctes),
    construit_equivalences(Vars_couleur, Vars_valeur, Equivalences),
    gtrace,
    construit_contrainte_somme(Vars_valeur, Contrainte_somme),
    append(Couleurs_distinctes, Equivalences, Contraintes).

% ----------

construit_contrainte_somme([], []) :-
    !.

construit_contrainte_somme(Vars_valeurs, Contrainte_somme) :-
    construit_somme(Vars_valeurs, Somme),
    writeln(Somme).

% ----------
construit_somme([V], V) :-
    !.

construit_somme([V|Vs], V + Somme) :-
    construit_somme(Vs, Somme).
    
% ----------
construit_equivalences(Couleurs, Valeurs, Equivalences) :-
    construit_couples(Couleurs, Valeurs, Couples),
    construit_equivalences_couples(Couples, Equivalences).

% -----------
construit_equivalences_couples([], []) :-
    !.

construit_equivalences_couples([_Couple], []) :-
    !.

construit_equivalences_couples([Couple|Couples], Equivalences) :-
    construit_equivalences_couple(Couples, Couple, Equivalences1),
    construit_equivalences_couples(Couples, Equivalences2),
    append(Equivalences1, Equivalences2, Equivalences).

% ----------
construit_equivalences_couple([], _Couple, []) :-
    !.

construit_equivalences_couple([Couple1|Couples1], Couple, Equivalences) :-
    construit_equi_couple(Couple, Couple1, Equivalences1),
    construit_equivalences_couple(Couples1, Couple, Equivalences2),
    append(Equivalences1, Equivalences2, Equivalences).

% ----------
construit_equi_couple(cou(Couleur1, Valeur1), cou(Couleur, Valeur),
                      [
                        (Couleur meme_rang Couleur1) <=> (Valeur = Valeur1),
                        (Couleur avant Couleur1) <=> (Valeur < Valeur1),
                        (Couleur1 avant Couleur) <=> (Valeur1 < Valeur1)
                      ]
                      ).       

% ---------
    % associe les variables de couleur et valeur par couple de meme position
construit_couples([], _Valeurs, []) :-
    !.

construit_couples([Couleur|Couleurs], Valeurs, 
                  [cou(Couleur, Valeur)|Couples]) :-
    carte:get_position_carte(Couleur, Position),
    carte:cree_variable_valeur(Position, Valeur),
    select(Valeur, Valeurs, Valeurs1),
    !,
    construit_couples(Couleurs, Valeurs1, Couples).

construit_couples([_Couleur|Couleurs], Valeurs, Couples) :-
    construit_couples(Couleurs, Valeurs, Couples).

% ----------
    % les couleurs doivent etre distinctes deux a deux
construit_couleurs_distinctes([], []) :-
    !.

construit_couleurs_distinctes([Couleur|Couleurs], Couleurs_out) :-
    construit_couleur_distinctes(Couleurs, Couleur, Couleurs1),
    construit_couleurs_distinctes(Couleurs, Couleurs2),
    append(Couleurs1, Couleurs2, Couleurs_out).

% ----------
    % les Couleurs doivent toutes etres distinctes de Couleur
construit_couleur_distinctes([], _Couleur, []) :-
    !.

construit_couleur_distinctes([Couleur1|Couleurs], Couleur, 
                             [Couleur \= Couleur1|Distinctes]) :-
    construit_couleur_distinctes(Couleurs, Couleur, Distinctes).
    
% ----------
    % recupere les variables de couleur des domaines non vides
variables_couleur([], []) :-
    !.

variables_couleur([c(_Pos, [], _Dom_valeur)|Domaines], Vars) :-
    !,
    variables_couleur(Domaines, Vars).  

variables_couleur([c(Pos, _Dom_coul, _Dom_val)|Domaines], [Var|Vars]) :-
    cree_variable_couleur(Pos, Var),
    variables_couleur(Domaines, Vars).  

% ----------
    % recupere les variables de valeur des domaines non vides
variables_valeur([], []) :-
    !.

variables_valeur([c(_Pos, _Dom_couleur, [])|Domaines], Vars) :-
    !,
    variables_valeur(Domaines, Vars).  

variables_valeur([c(Pos, _Dom_coul, _Dom_val)|Domaines], [Var|Vars]) :-
    cree_variable_valeur(Pos, Var),
    variables_valeur(Domaines, Vars).  


/*
% ----------
assert_connus([]) :-
    !.

assert_connus([c(Num_carte, Domaine_couleur, Domaine_valeur)|Domaines]) :-
    atom_concat(c, Num_carte, Var_couleur),
    atom_concat(v, Num_carte, Var_valeur),
    assert(connu(Var_couleur dans Domaine_couleur, -1, domaine_initial, [])),
    assert(connu(Var_valeur dans Domaine_valeur, -1, domaine_initial, [])),
    assert_connus(Domaines).
*/


% cas particulier d'une reduction due a une reponse du systeme

affiche_une_explication2(
	expl(
		   e(_N,
		   reduction,
		   [dans(Var, Domaine_initial),Var=Valeur],
		   [dans(Var, _Domaine_reduit)]
		   ),
		   [ 
				expl(
					e(-1,domaine_initial,[],[dans(Var,Domaine_initial)]),
					 []
				    ),
			   expl(e(-1,reponse,[],[Var=Valeur]),[])
       	  ]
		),
		 K_in, K_out) :-
	!,
	format('\t(~w)~n', [K_in]),
    display_deduction(e(-1,reponse,[],[Var=Valeur])),
    K_out is K_in + 1.


/* =========================== ORDONNE RAISONNEMENT ========================= */

	% un raisonnement est un ensemble de deductions
	% Var_reduite est la variable dans le domaine a été réduit
ordonne_raisonnement(Explication, Var_cible, Explication_out) :-
	associer_raisonnements_variables(Explication, Explication1),
	groupe_raisonnements(Explication1, Groupes),
	ordonne_chaque_groupe(Groupes, Groupes1),
	groupes_var_reduite(Groupes1, Var_cible, Groupes_cibles, 
						Groupes_restant),
	groupes_nombre_variables(Groupes_cibles, Groupes_cibles1),
	groupes_nombre_variables(Groupes_restant, Groupes_restant1),
	gtrace,
	ordonne_dependances(Groupes_cibles1, Groupes_restant1, 
					    Var_cible, Groupes2),
	degroupe(Groupes2, Explication_out).

% ----------
	% ordonne les groupes par dependances 
	% un groupe impliquant c1 et c2 doit etre precedes
	% du groupe c1 et du groupe c2, etc.
ordonne_dependances([], [], _Var_cible, []) :-
	!.

ordonne_dependances([n_var(N, Groupes_N)|Groupes_cibles], 
					 Groupes, Var_cible, Groupes_out) :-
	writeln(Groupes_N),
	writeln(Groupes_cibles),
	writeln(Groupes),
	gtrace.

% ----------
	% trie les groupes en mettant en premier les groupes avec une seule variable
	% deux, puis 3, etc.
groupes_nombre_variables([], []) :-
	!.

groupes_nombre_variables(Groupes, Groupes_out) :-
	groupes_N_variables(Groupes, 1, Groupes_out).

% ----------
	% regroupe les groupes par nombre de variables qu'ils impliquent 
groupes_N_variables([], _N, []) :-
	!.

groupes_N_variables(Groupes, N, [n_var(N, Groupes_N)|Groupes_N1]) :-
	findall(groupe(Groupe, Vars), 
			(member(groupe(Groupe, Vars), Groupes), length(Vars, N)), 
            Groupes_N),
	subtract(Groupes, Groupes_N, Groupes_restant),
	N1 is N+1,
	groupes_N_variables(Groupes_restant, N1, Groupes_N1).
	

% ----------
degroupe([], []) :-
	!.

degroupe([n_var(_N, Groupes)|N_groupes], Explication) :-
	degroupe_groupes(Groupes, Explication1),
	degroupe(N_groupes, Explication2),
	append(Explication1, Explication2, Explication).

% ----------
degroupe_groupes([], []) :-
	!.

degroupe_groupes([groupe(Groupe, _Vars)|Groupes], Explication) :-
	degroupe_groupes(Groupes, Explication1),
	append(Groupe, Explication1, Explication). 

% ----------
	% selectionne les groupes contenant Var_reduite
groupes_var_reduite([], _Var_reduite, [], []) :-
	!.

groupes_var_reduite([groupe(Groupe, Vars)|Groupes], Var_reduite,
					[groupe(Groupe, Vars)|Groupes_reduit], Groupes_restant) :-
	member(Var_reduite, Vars),
	!,
	groupes_var_reduite(Groupes, Var_reduite, Groupes_reduit, Groupes_restant).

groupes_var_reduite([groupe(Groupes, Vars)|Groupes], Var_reduite,
					 Groupes_reduit, [groupe(Groupes,Vars)|Groupes_restant]) :-
	groupes_var_reduite(Groupes, Var_reduite, Groupe_reduits, Groupes_restant).

% ----------
	% regroupe les raisonnements partageant les memes variables
groupe_raisonnements([], []) :-
	!.

groupe_raisonnements([varia(Deduction, Vars)|Deductions],
					  [groupe([Deduction|Deductions1], Vars)|Groupes]) :-	
	recherche_raisonnements_vars(Deductions, Vars, Deductions1, 
                                 Reste_deductions),
	groupe_raisonnements(Reste_deductions, Groupes).

% ----------	
	% selectionne les raisonnements qui implique exactement 
	% les variables de Vars
recherche_raisonnements_vars([], _Vars, [], []) :-
	!.

recherche_raisonnements_vars([varia(Explication, Vars)|Explications], Vars, 
							 [Explication|Explications1], Reste) :-
	!,
	recherche_raisonnements_vars(Explications, Vars, Explications1, Reste).

recherche_raisonnements_vars([Explication|Explications], Vars, 
							 Explications1, [Explication|Reste]) :-
	recherche_raisonnements_vars(Explications, Vars, Explications1, Reste).
 
% ----------
	% ordonne chaque groupe de variables
ordonne_chaque_groupe([], []) :-
	!.

ordonne_chaque_groupe([groupe(Explication, Vars)|Groupes], 
				      [groupe(Explication1, Vars)|Groupes1]) :-
	ordonne_groupe(Explication, Explication1),
	ordonne_chaque_groupe(Groupes, Groupes1).

% ----------
ordonne_groupe(Explication, 
               [e(-1, domaine_initial, [], Consequents)|Explication1] 
                     ):-
    select(e(-1, domaine_initial, [], Consequents), Explication, Explication1),
    !.

ordonne_groupe(Explication, Explication).
	
% ----------
	% on groupe les raisonnements selon les variables impliquees
associer_raisonnements_variables([], []) :-
	!.

associer_raisonnements_variables([Explication|Explications], 
							   [Explication1|Explications1]) :-
	variables_raisonnement(Explication, Explication1),
	associer_raisonnements_variables(Explications, Explications1).

% ----------
variables_raisonnement(e(N, Type, Ante, Conse), 
					   varia(e(N, Type, Ante, Conse), Vars)) :-
	variables_dans(Ante, Vars1),
	variables_dans(Conse, Vars2),
	append(Vars1, Vars2, Vars3),
	sort(Vars3, Vars).

% ----------
variables_dans([], []) :-
	!.

variables_dans([Exp|Exps], Vars) :-
	check_arguments:variables_impliquees(Exp, Vars1),
	variables_dans(Exps, Vars2),
	append(Vars1, Vars2, Vars).

