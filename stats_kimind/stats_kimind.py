import os
import json
import glob
import matplotlib.pyplot as plt
import csv
import argparse

# Répertoire racine où se trouvent les répertoires contenant les fichiers JSON
chemin_repertoires_traces = 'traces'

def lire_fichiers_json(chemin):
    '''
    Cette fonction lit récursivement tous les fichiers JSON dans les sous-dossiers du chemin fourni.
    Entrée : le dossier où sont les sous-dossiers contenant les fichiers JSON (traces).
    Sortie : la liste des données contenues dans les fichiers JSON.
    '''
    # Utilise '**' pour parcourir tous les fichiers JSON dans tous les sous-dossiers du chemin spécifié
    fichiers = glob.glob(chemin + '/**/*.json', recursive=True)
    traces = []
    for fichier in fichiers:
        with open(fichier, 'r', encoding='utf-8') as f:
            contenu = json.load(f)
            traces.append(contenu)
    return traces

def lire_traces_par_joueur(chemin):
    traces_par_joueur = {}
    # Parcourir chaque sous-répertoire qui représente un joueur
    for repertoire in glob.glob(chemin + '/*/'):
        joueur = os.path.basename(os.path.dirname(repertoire))
        fichiers = glob.glob(repertoire + '*.json')
        traces = []
        for fichier in fichiers:
            with open(fichier, 'r', encoding='utf-8') as f:
                traces.append(json.load(f))
        traces_par_joueur[joueur] = traces
    return traces_par_joueur

# Mise en mémoire de la liste des traces
traces = lire_fichiers_json(chemin_repertoires_traces)

def nombre_total_parties(traces):
    '''
    Calcule le nombre total de parties jouées.
    '''
    return len(traces)

def nombre_total_coups(traces):
    '''
    Calcule le nombre total de coups effectués sur toutes les parties.
    Un coup est défini comme un ensemble d'essais où chaque carte peut être 
    jouée au maximum une fois jusqu'à ce qu'elle soit correctement devinée.
    '''
    total_coups = 0
    for partie in traces:
        # Création d'un dictionnaire pour compter les occurrences de chaque position
        count_positions = {}
        for coup in partie['cartes_jouees']:
            if coup['position'] in count_positions:
                count_positions[coup['position']] += 1
            else:
                count_positions[coup['position']] = 1
        # Le nombre de coups pour la partie est le maximum des valeurs dans count_positions
        total_coups += max(count_positions.values()) if count_positions else 0
    return total_coups

def nombre_total_secondes(traces):
    '''
    Calcule le nombre total de secondes passées à jouer sur toutes les parties.
    '''
    total_secondes = sum(sum(coup['duree'] for coup in partie['cartes_jouees']) for partie in traces)
    return total_secondes

def formater_temps(secondes):
    '''
    Convertit un nombre de secondes en un format "x h y mn z s", 
    incluant des heures si nécessaire.
    '''
    heures = secondes // 3600
    minutes = (secondes % 3600) // 60
    secondes_restantes = secondes % 60
    if heures > 0:
        return f"{int(heures)} h {int(minutes)} mn {int(secondes_restantes)} s"
    else:
        return f"{int(minutes)} mn {int(secondes_restantes)} s"

def temps_moyen_par_partie_secondes(traces):
    '''
    Calcule le temps moyen pour finir une partie en secondes.
    '''
    if not traces:
        return 0
    total_secondes = sum(sum(coup['duree'] for coup in partie['cartes_jouees']) for partie in traces)
    moyenne_secondes = total_secondes / len(traces)
    return moyenne_secondes

def nombre_coups_moyen_par_partie(traces):
    '''
    Calcule le nombre moyen de coups par partie en se basant sur la nouvelle 
    définition de coup.
    Un coup est compté par le nombre maximum d'occurrences d'un même nombre 
    dans le champ "position".
    '''
    total_coups = 0
    if not traces:
        return 0

    for partie in traces:
        # Création d'un dictionnaire pour compter les occurrences de chaque position
        count_positions = {}
        for coup in partie['cartes_jouees']:
            if coup['position'] in count_positions:
                count_positions[coup['position']] += 1
            else:
                count_positions[coup['position']] = 1
        # Le nombre de coups pour la partie est le maximum des valeurs dans count_positions
        total_coups += max(count_positions.values()) if count_positions else 0

    return total_coups / len(traces)

def nombre_max_coups_par_partie(traces):
    '''
    Trouve le nombre maximum de coups joués dans une seule partie selon 
    la nouvelle définition.
    Un coup est défini par le nombre maximum d'occurrences d'un même nombre 
    dans le champ "position" de "cartes_jouees".
    '''
    max_coups = 0
    for partie in traces:
        # Création d'un dictionnaire pour compter les occurrences de chaque position
        count_positions = {}
        for coup in partie['cartes_jouees']:
            if coup['position'] in count_positions:
                count_positions[coup['position']] += 1
            else:
                count_positions[coup['position']] = 1
        # Le nombre de coups pour la partie est le maximum des valeurs dans count_positions
        max_coups_partie = max(count_positions.values()) if count_positions else 0
        if max_coups_partie > max_coups:
            max_coups = max_coups_partie
    
    return max_coups

# Statistiques sur les 25 parties d'un joueur
def calculer_coup_par_partie(partie):
    '''
    Calcule le nombre de coups pour une partie donnée
    '''
    count_positions = {}
    for coup in partie['cartes_jouees']:
        if coup['position'] in count_positions:
            count_positions[coup['position']] += 1
        else:
            count_positions[coup['position']] = 1
    return max(count_positions.values()) if count_positions else 0

def nombre_coups_et_temps_max_min(traces_par_joueur):
    max_coups, min_coups = -float('inf'), float('inf')
    max_temps, min_temps = -float('inf'), float('inf')
    max_coups_joueur, min_coups_joueur = '', ''
    max_temps_joueur, min_temps_joueur = '', ''
    
    for joueur, parties in traces_par_joueur.items():
        total_coups = sum(calculer_coup_par_partie(partie) for partie in parties)
        total_temps = sum(sum(coup['duree'] for coup in partie['cartes_jouees']) for partie in parties)

        if total_coups > max_coups:
            max_coups, max_coups_joueur = total_coups, joueur
        if total_coups < min_coups:
            min_coups, min_coups_joueur = total_coups, joueur

        if total_temps > max_temps:
            max_temps, max_temps_joueur = total_temps, joueur
        if total_temps < min_temps:
            min_temps, min_temps_joueur = total_temps, joueur

    return (max_coups, max_coups_joueur, min_coups, min_coups_joueur,
            formater_temps(max_temps), max_temps_joueur,
            formater_temps(min_temps), min_temps_joueur)

# Statistiques sur les contraintes
def extraire_coups_complets(trace):
    '''
    Affiche la liste des coups complets de 4 cartes, un coup par ligne.
    '''
    cartes_jouees = trace['cartes_jouees']
    coups_complets = []
    coup_actuel = []

    # Cartes correctement devinées et toujours utilisées dans les coups
    cartes_fixees = []

    # Parcourir toutes les cartes jouées pour former des coups
    for carte in cartes_jouees:
        if carte['reponse']['couleur_devinee'] and carte['reponse']['valeur_devinee'] == "equals":
            # Si la carte est correctement devinée, ajoutez-la aux cartes fixées si elle n'est pas déjà incluse
            if carte not in cartes_fixees:
                cartes_fixees.append(carte)

        # Ajouter la carte au coup actuel
        if carte not in coup_actuel:
            coup_actuel.append(carte)

        # Vérifier si le coup actuel contient 4 cartes
        if len(coup_actuel) == 4:
            coups_complets.append(coup_actuel)
            # Afficher le coup complet
            # print("Coup complet:", coup_actuel)
            # Commencer un nouveau coup tout en conservant les cartes fixées
            coup_actuel = list(cartes_fixees)

    # Gérer le cas où moins de 4 cartes sont jouées à la fin
    if len(coup_actuel) > 0 and len(coup_actuel) < 4:
        # Ajouter le coup incomplet s'il contient des cartes
        coups_complets.append(coup_actuel)

    return coups_complets

'''def verifier_contraintes_coup(coup, somme_attendue, ordre_couleurs):
    ordre = []
    current = []
    translation = {
        'rouge': 'red',
        'jaune': 'yellow',
        'bleu': 'blue',
        'vert': 'green'
    }
    for item in ordre_couleurs:
        if item in ("<", "="):
            ordre.append(current)
            current = [item]
        else:
            color = item.split('(')[1].strip(')')
            translated_color = translation.get(color, color)
            current.append(translated_color)
    ordre.append(current)

    # Vérifier la somme des cartes
    somme_coup = sum(card['valeur'] for card in coup)
    if somme_coup != somme_attendue:
        print(f"Coup analysé: {[{'couleur': card['couleur'], 'valeur': card['valeur']} for card in coup]}")
        print(f"Non-conformité trouvée: Somme attendue {somme_attendue}, obtenue {somme_coup}")
        return False

    # Vérifier l'ordre des cartes
    couleur_to_valeur = {card['couleur']: card['valeur'] for card in coup}
    for segment in ordre:
        if len(segment) == 1 or segment[0] == "=":
            continue
        elif segment[0] == "<":
            sorted_segment = sorted(segment[1:], key=lambda x: couleur_to_valeur.get(x, float('inf')))
            if sorted_segment != segment[1:]:
                incorrect_order = " > ".join(sorted_segment)
                correct_order = " < ".join(segment[1:])
                print(f"Coup analysé: {[{'couleur': card['couleur'], 'valeur': card['valeur']} for card in coup]}")
                print(f"Non-conformité trouvée: Ordre incorrect: {incorrect_order} (attendu: {correct_order})")
                return False

    return True 
    '''

def verifier_contraintes_coup(coup, somme_attendue, ordre_couleurs):
    # Convertir les contraintes d'ordre en une liste manipulable
    ordre = []
    current = []
    translation = {
        'rouge': 'red',
        'jaune': 'yellow',
        'bleu': 'blue',  # assurez-vous que c'est 'blue' et non 'bleu' si nécessaire
        'vert': 'green'
    }
    for item in ordre_couleurs:
        if item in ("<", "="):
            ordre.append(current)
            current = [item]
        else:
            color = item.split('(')[1].strip(')')
            translated_color = translation.get(color, color)  # Traduire la couleur
            current.append(translated_color)
    ordre.append(current)  # Ajouter le dernier segment

    # Vérifier la somme des cartes
    somme_coup = sum(card['valeur'] for card in coup)
    if somme_coup != somme_attendue:
        return False  # La somme ne correspond pas

    # Vérifier l'ordre des cartes
    couleur_to_valeur = {card['couleur']: card['valeur'] for card in coup}
    for segment in ordre:
        if len(segment) == 1 or segment[0] == "=":
            continue
        elif segment[0] == "<":
            sorted_segment = sorted(segment[1:], key=lambda x: couleur_to_valeur[x])
            if sorted_segment != segment[1:]:
                return False  # L'ordre ne correspond pas

    return True  # Toutes les contraintes sont respectées

def compter_coups_non_conformes(trace):
    '''
    Renvoie le nombre de coups non conformes d'une trace
    '''
    coups = extraire_coups_complets(trace)
    somme_attendue = trace['jeu']['somme']
    ordre_couleurs = trace['jeu']['ordre_couleurs']
    nb_coups_non_conformes = 0

    for coup in coups:
        if not verifier_contraintes_coup(coup, somme_attendue, ordre_couleurs):
            #print('--> ',coup, somme_attendue, ordre_couleurs)
            nb_coups_non_conformes += 1

    return nb_coups_non_conformes

def total_coups_non_conformes(chemin_repertoire_joueur):
    '''
    Renvoie le nombre de coups non conformes d'un joueur
    '''
    traces = []
    fichiers = glob.glob(chemin_repertoire_joueur + '/*.json')
    for fichier in fichiers:
        with open(fichier, 'r', encoding='utf-8') as f:
            traces.append(json.load(f))
    total_non_conformes = 0
    for trace in traces:
        total_non_conformes += compter_coups_non_conformes(trace)
    return total_non_conformes

def total_coups_non_conformes_tous_joueurs(chemin_repertoires_traces):
    '''
    Renvoie le total de coups non conformes pour tous les joueurs
    '''
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    total_non_conformes = 0
    for joueur, traces in traces_par_joueur.items():
        for trace in traces:
            total_non_conformes += compter_coups_non_conformes(trace)

    return total_non_conformes

def max_coups_non_conformes_par_joueur(chemin_repertoires_traces):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    max_non_conformes = 0
    joueurs_max_non_conformes = []

    # Parcourir les traces de chaque joueur pour compter les coups non conformes
    for joueur, traces in traces_par_joueur.items():
        joueur_non_conformes = sum(compter_coups_non_conformes(trace) for trace in traces)

        # Vérifier si le nombre actuel de non-conformités est le maximum
        if joueur_non_conformes > max_non_conformes:
            max_non_conformes = joueur_non_conformes
            joueurs_max_non_conformes = [joueur]
        elif joueur_non_conformes == max_non_conformes:
            joueurs_max_non_conformes.append(joueur)

    return joueurs_max_non_conformes, max_non_conformes

def moyenne_coups_non_conformes(chemin_repertoires_traces):
    '''
    Renvoie le nombre moyen de coups non conformes par trace
    '''
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    total_non_conformes = 0
    total_traces = 0

    # Parcourir chaque joueur et chaque trace pour compter les non-conformités
    for joueur, traces in traces_par_joueur.items():
        for trace in traces:
            total_non_conformes += compter_coups_non_conformes(trace)
            total_traces += 1  # Compter chaque trace pour la moyenne

    # Calculer la moyenne des coups non conformes par trace
    if total_traces > 0:
        moyenne_non_conformes = total_non_conformes / total_traces
    else:
        moyenne_non_conformes = 0  # Eviter la division par zéro

    return moyenne_non_conformes

# Statistiques sur le premier coup et autres métriques spécifiques
def nombre_parties_trouvees_1_coup(traces):
    return sum(1 for partie in traces if calculer_coup_par_partie(partie) == 1 and partie['resultat'] == 'gagne')

def max_parties_trouvees_1_coup_par_joueur(chemin_repertoires_traces):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    max_parties = 0
    joueur_max = ''
    
    for joueur, traces in traces_par_joueur.items():
        nombre_parties = nombre_parties_trouvees_1_coup(traces)
        if nombre_parties >= max_parties:
            max_parties = nombre_parties
            joueur_max = joueur
            
    return joueur_max, max_parties

def comparer_traces_joueur(chemin_repertoires_traces, joueur_j0):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    traces_j0 = traces_par_joueur.get(joueur_j0, [])
    nb_traces_egalite = 0
    
    # Parcourir chaque trace de J0
    for index, trace_j0 in enumerate(traces_j0):
        coups_j0 = calculer_coup_par_partie(trace_j0)
        egalite_pour_tous_joueurs = True
        
        # Comparer avec chaque autre joueur
        for joueur, traces in traces_par_joueur.items():
            if joueur != joueur_j0:
                try:
                    trace_j = traces[index]  # Assumer que les traces sont alignées par index
                    coups_j = calculer_coup_par_partie(trace_j)
                    if coups_j != coups_j0:
                        egalite_pour_tous_joueurs = False
                        break
                except IndexError:
                    # Si l'index n'existe pas pour un autre joueur
                    egalite_pour_tous_joueurs = False
                    break
        
        if egalite_pour_tous_joueurs:
            nb_traces_egalite += 1
    
    return nb_traces_egalite

def fichiers_max_diversite_coups(chemin_repertoires_traces, joueur_j0):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    fichiers_j0 = glob.glob(chemin_repertoires_traces + '/' + joueur_j0 + '/*.json')
    max_diversite = 0
    indices_diversite_max = []
    
    # Analyser chaque fichier trace de J0
    for i, fichier_j0 in enumerate(fichiers_j0):
        set_coups = set()
        
        # Ajouter les coups de J0 pour cette trace
        with open(fichier_j0, 'r', encoding='utf-8') as f:
            trace_j0 = json.load(f)
        set_coups.add(calculer_coup_par_partie(trace_j0))
        
        # Ajouter les coups de chaque autre joueur pour la trace correspondante
        for joueur, traces in traces_par_joueur.items():
            if joueur != joueur_j0 and i < len(traces):
                set_coups.add(calculer_coup_par_partie(traces[i]))
        
        # Vérifier si la diversité des coups est maximale
        if len(set_coups) > max_diversite:
            max_diversite = len(set_coups)
            indices_diversite_max = [int(os.path.splitext(os.path.basename(fichier_j0))[0].split('_')[2])]
        elif len(set_coups) == max_diversite:
            indices_diversite_max.append(int(os.path.splitext(os.path.basename(fichier_j0))[0].split('_')[2]))
    
    return indices_diversite_max, max_diversite

def partie_avec_max_coups_diff(traces):
    '''
    Identifie la partie avec le plus grand nombre de coups différents.
    '''
    return max(traces, key=lambda x: len(set((coup['couleur'], coup['valeur']) for coup in x['cartes_jouees'])))

def fichiers_ecart_max_coups(chemin_repertoires_traces, joueur_j0):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    fichiers_j0 = glob.glob(chemin_repertoires_traces + '/' + joueur_j0 + '/*.json')
    max_ecart = 0
    indices_ecart_max = []
    
    # Analyser chaque fichier trace de J0
    for i, fichier_j0 in enumerate(fichiers_j0):
        coup_counts = []
        
        # Ajouter les coups de J0 pour cette trace
        with open(fichier_j0, 'r', encoding='utf-8') as f:
            trace_j0 = json.load(f)
        coup_counts.append(calculer_coup_par_partie(trace_j0))
        
        # Ajouter les coups de chaque autre joueur pour la trace correspondante
        for joueur, traces in traces_par_joueur.items():
            if joueur != joueur_j0 and i < len(traces):
                coup_counts.append(calculer_coup_par_partie(traces[i]))
        
        # Calculer l'écart pour cette trace
        if coup_counts:
            ecart = max(coup_counts) - min(coup_counts)
            if ecart > max_ecart:
                max_ecart = ecart
                indices_ecart_max = [int(os.path.splitext(os.path.basename(fichier_j0))[0].split('_')[2])]
            elif ecart == max_ecart:
                indices_ecart_max.append(int(os.path.splitext(os.path.basename(fichier_j0))[0].split('_')[2]))
    
    return indices_ecart_max, max_ecart

def temps_moyen_extremes(chemin_repertoires_traces):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    temps_par_partie = {}
    nb_joueurs = len(traces_par_joueur)

    # Collecter tous les temps pour chaque partie de tous les joueurs
    for joueur, traces in traces_par_joueur.items():
        for index, trace in enumerate(traces):
            temps_total = sum(coup['duree'] for coup in trace['cartes_jouees'])
            if index in temps_par_partie:
                temps_par_partie[index] += temps_total
            else:
                temps_par_partie[index] = temps_total
    
    # Calculer le temps moyen par partie
    temps_moyens = {index: total / nb_joueurs for index, total in temps_par_partie.items()}
    min_index = min(temps_moyens, key=temps_moyens.get)
    max_index = max(temps_moyens, key=temps_moyens.get)

    return (min_index, formater_temps(temps_moyens[min_index])), (max_index, formater_temps(temps_moyens[max_index]))

def moyenne_somme_cartes(traces):
    '''
    Calcule la moyenne des sommes des valeurs des 4 cartes à trouver dans toutes les parties.
    '''
    return sum(partie['jeu']['somme'] for partie in traces) / len(traces)

def graphique_premier_coup(traces):
    '''
    Affiche un histogramme des valeurs utilisées lors du premier coup de chaque partie.
    '''
    # Extraction des valeurs du premier coup avec vérification de l'existence de cartes
    premier_coup_vals = [partie['cartes_jouees'][0]['valeur'] for partie in traces if partie['cartes_jouees']]

    # Définir les bacs de manière à ce que chaque valeur entière soit centrée entre les bords des bacs
    bins = [i - 0.5 for i in range(1, 12)]  # Crée des bacs de 0.5 à 11.5

    plt.figure(figsize=(10, 5))
    plt.hist(premier_coup_vals, bins=bins, alpha=0.75, color='blue', rwidth=0.8, edgecolor='black')
    plt.title('Distribution des valeurs au premier coup')
    plt.xlabel('Valeur')
    plt.ylabel('Fréquence')

    # Configurer les ticks de l'axe x pour être centrés sur chaque valeur entière
    plt.xticks(range(1, 11))  # Place les ticks de 1 à 10

    plt.grid(True, which='both', linestyle='--', linewidth=0.5, axis='y')  # Grille horizontale pour améliorer la lisibilité
    plt.show()

def moyenne_coups_par_joueur(chemin_repertoires_traces):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    moyennes_coups = {}

    for joueur, traces in traces_par_joueur.items():
        total_coups = sum(calculer_coup_par_partie(trace) for trace in traces)
        moyenne_coups = total_coups / len(traces) if traces else 0
        moyennes_coups[joueur] = moyenne_coups

    # Ordonner les joueurs par leur nombre moyen de coups, du plus petit au plus grand
    joueurs_ordre_coups = sorted(moyennes_coups.items(), key=lambda x: x[1])

    return joueurs_ordre_coups

def indices_et_coups_par_joueur(chemin_repertoires_traces, joueur):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    traces_joueur = traces_par_joueur.get(joueur, [])
    resultats = []

    for i, trace in enumerate(traces_joueur):
        nombre_coups = calculer_coup_par_partie(trace)
        # Assumant le format de fichier "_partie_X.json"
        nom_fichier = os.path.basename(glob.glob(chemin_repertoires_traces + '/' + joueur + '/*.json')[i])
        indice_partie = int(nom_fichier.split('_')[2].split('.')[0])
        resultats.append((indice_partie, nombre_coups))

    return sorted(resultats, key=lambda x: x[0])  

def calculer_durees_moyennes(chemin_repertoires_traces):
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    durees_moyennes = {}
    compteur_parties = {}

    for joueur, traces in traces_par_joueur.items():
        fichiers = glob.glob(os.path.join(chemin_repertoires_traces, joueur, '*.json'))
        for fichier in fichiers:
            indice_partie = os.path.basename(fichier).split('_')[2].split('.')[0]
            with open(fichier, 'r', encoding='utf-8') as f:
                partie = json.load(f)
            duree_totale = sum(coup['duree'] for coup in partie['cartes_jouees'])
            if indice_partie not in durees_moyennes:
                durees_moyennes[indice_partie] = duree_totale
                compteur_parties[indice_partie] = 1
            else:
                durees_moyennes[indice_partie] += duree_totale
                compteur_parties[indice_partie] += 1

    for indice in durees_moyennes:
        durees_moyennes[indice] /= compteur_parties[indice]

    return durees_moyennes

def tracer_graphique_durees_moyennes(chemin_repertoires_traces):
    durees_moyennes = calculer_durees_moyennes(chemin_repertoires_traces)
    indices = sorted(durees_moyennes.keys(), key=lambda x: int(x))
    moyennes = [durees_moyennes[indice] for indice in indices]
    plt.figure(figsize=(10, 5))
    # Utiliser plt.bar pour créer un histogramme, avec un écart entre les barres
    plt.bar(indices, moyennes, color='blue', width=0.8)  # Réduire la largeur à 0.8 pour laisser un espace
    plt.title('Durée moyenne de résolution par partie')
    plt.xlabel('Partie')
    plt.ylabel('Durée moyenne (secondes)')
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.xticks([int(index) for index in indices])  # S'assurer que les étiquettes x sont correctement formatées
    # Ajouter des marges pour les étiquettes si nécessaire
    plt.margins(x=0.05)  # Ajoute un petit espace à chaque extrémité de l'axe des x
    plt.show()
    
def afficher_statistiques(traces):
    print("Statistiques des parties de Kimind:")
    print("-----------------------------------")

    print("\n-> Statistiques globales")
    print(f"Nombre total de parties jouées: {nombre_total_parties(traces)}")
    print(f"Moyenne de la somme des 4 cartes à trouver: {moyenne_somme_cartes(traces):.2f}")

    print("\n-> Statistiques sur le nombre coups")
    print(f"Nombre total de coups effectués: {nombre_total_coups(traces)}")
    print(f"Nombre moyen de coups pour finir une partie: {nombre_coups_moyen_par_partie(traces):.2f}")
    print(f"Nombre maximum de coups dans une partie: {nombre_max_coups_par_partie(traces)}")
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    stats = nombre_coups_et_temps_max_min(traces_par_joueur)
    print("Nombre total maximum de coups: {}, Joueur: {}".format(stats[0], stats[1]))
    print("Nombre total maximum de coups: {}, Joueur: {}".format(stats[2], stats[3]))

    print("\n-> Statistiques des parties finies en un coup")
    print(f"Nombre de parties trouvées en un coup: {nombre_parties_trouvees_1_coup(traces)}")
    joueur_max, max_parties = max_parties_trouvees_1_coup_par_joueur(chemin_repertoires_traces)
    print(f"Maximum de parties trouvées en un seul coup: {max_parties}, Joueur: {joueur_max}")

    print("\n-> Statistiques sur la diversité du nombre de coups")
    resultat = comparer_traces_joueur(chemin_repertoires_traces, 'J1')
    print(f"Nombre de traces où tous les joueurs ont mis le même nombre de coups: {resultat}")
    fichiers, max_div = fichiers_max_diversite_coups(chemin_repertoires_traces, 'J1')
    print(f"Parties avec la plus grande diversité de nombre de coups: {fichiers} avec {max_div} nombre(s) de coups différents")
    indices, max_ecart = fichiers_ecart_max_coups(chemin_repertoires_traces, 'J1')
    print(f"Parties avec le plus grand écart de nombre de coups: {indices} avec un écart de {max_ecart}")

    print("\n-> Analyse de la conformité des coups")
    print("Total non conformes tous joueurs:", total_coups_non_conformes_tous_joueurs(chemin_repertoires_traces))
    print("Maximum non conformes par joueur:", max_coups_non_conformes_par_joueur(chemin_repertoires_traces))
    print("Moyenne coups non conformes par trace:", moyenne_coups_non_conformes(chemin_repertoires_traces))

    print("\n-> Statistiques temporelles")
    temps_total_secondes = nombre_total_secondes(traces)
    temps_total_formatte = formater_temps(temps_total_secondes)
    print(f"Temps total joué: {temps_total_formatte}")
    temps_moyen_secondes = temps_moyen_par_partie_secondes(traces)
    temps_moyen_formatte = formater_temps(temps_moyen_secondes) 
    print(f"Temps moyen pour finir une partie: {temps_moyen_formatte}")
    print("Temps total minimum: {}, Joueur: {}".format(stats[6], stats[7]))
    print("Temps total maximum: {}, Joueur: {}".format(stats[4], stats[5]))
    resultat_min, resultat_max = temps_moyen_extremes(chemin_repertoires_traces)
    print(f"Indice de la partie avec le temps moyen le plus bas: {resultat_min[0]}, Temps: {resultat_min[1]}")
    print(f"Indice de la partie avec le temps moyen le plus élevé: {resultat_max[0]}, Temps: {resultat_max[1]}")
    print("\n")
    graphique_premier_coup(traces)
    tracer_graphique_durees_moyennes(chemin_repertoires_traces)

#afficher_statistiques(traces)

def calculer_temps_moyen_par_joueur(traces):
    '''
    Calcule le temps moyen par joueur pour finir une partie en secondes.
    '''
    print(traces)
    if not traces:
        return 0
    total_secondes = sum(sum(coup['duree'] for coup in partie['cartes_jouees']) for partie in traces)
    moyenne_secondes = total_secondes / len(traces)
    return moyenne_secondes

def enregistrer_csv(nom_fichier, en_tetes, donnees):
    with open(nom_fichier, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file, delimiter=';')
        writer.writerow(en_tetes)
        writer.writerow(donnees)

def enregistrer_statistiques(traces,
                             fichier_csv_stats='statistiques_globales.csv',
                             fichier_csv_moyennes_coups_non_conformes='moyennes_coups_non_conformes.csv',
                             fichier_csv_moyennes_coups='moyennes_coups.csv',
                             fichier_csv_moyennes_temps='moyennes_temps.csv'):

    temps_moyen_secondes = temps_moyen_par_partie_secondes(traces)
    nombre_moyen_coups_non_conformes = moyenne_coups_non_conformes(chemin_repertoires_traces)
    nombre_moyen_coups = round(nombre_coups_moyen_par_partie(traces), 2)
    moyennes_coups = dict(moyenne_coups_par_joueur(chemin_repertoires_traces))
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)

    # Compter les non-conformités par partie
    moyennes_non_conformes = {}
    for joueur, parties in traces_par_joueur.items():
        print("joueur : " + str(joueur))
        total_non_conformes_joueur = 0
        total_parties_joueur = 0
        for partie in parties:
            total_non_conformes_joueur += compter_coups_non_conformes(partie)
            total_parties_joueur += 1
        if total_parties_joueur > 0:
            moyenne_non_conformes_joueur = total_non_conformes_joueur / total_parties_joueur
        else:
            moyenne_non_conformes_joueur = 0
        moyennes_non_conformes[joueur] = moyenne_non_conformes_joueur
    cles_triees = sorted(moyennes_non_conformes.keys(), key=lambda x: int(x[1:]))
    enregistrer_csv(fichier_csv_moyennes_coups_non_conformes, cles_triees, [moyennes_non_conformes[cle] for cle in cles_triees])

    enregistrer_csv(fichier_csv_moyennes_coups, cles_triees, [moyennes_coups[cle] for cle in cles_triees])

    # Compter les temps moyens par partie
    moyennes_temps = {}
    for joueur, parties in traces_par_joueur.items():
        total_temps_joueur = 0
        total_parties_joueur = 0
        for partie in parties:
            total_temps_joueur += sum(coup['duree'] for coup in partie['cartes_jouees'])
            total_parties_joueur += 1
        if total_parties_joueur > 0:
            moyenne_temps_joueur = total_temps_joueur / total_parties_joueur
        else:
            moyenne_temps_joueur = 0
        moyennes_temps[joueur] = moyenne_temps_joueur
    enregistrer_csv(fichier_csv_moyennes_temps, cles_triees, [round(moyennes_temps[cle], 2) for cle in cles_triees])

    en_tetes = ["Temps moyen pour finir une partie", "Nombre moyen de coups", "Nombre moyen de coups non conformes"]
    donnees = [round(temps_moyen_secondes, 2), nombre_moyen_coups, nombre_moyen_coups_non_conformes]
    enregistrer_csv(fichier_csv_stats, en_tetes, donnees)

#enregistrer_statistiques(traces)

def compter_nb_coups(partie):
    total_coups = 0
    count_positions = {}
    for coup in partie['cartes_jouees']:
        if coup['position'] in count_positions:
            count_positions[coup['position']] += 1
        else:
            count_positions[coup['position']] = 1
    # Le nombre de coups pour la partie est le maximum des valeurs dans count_positions
    total_coups += max(count_positions.values()) if count_positions else 0
    return total_coups

def calculer_temps(partie):
    total_secondes = sum(coup['duree'] for coup in partie['cartes_jouees'])
    return total_secondes

def enregistrer_donnees_partie_un_joueur(joueur, partie):

    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    donnees_partie = traces_par_joueur[joueur][partie]
    nb_coups_non_conformes = compter_coups_non_conformes(donnees_partie)
    nb_coups = compter_nb_coups(donnees_partie)
    temps = round(calculer_temps(donnees_partie), 2)
    en_tetes = ["Temps", "Nombre de coups", "Nombre de coups non conformes"]
    donnees = [temps, nb_coups, nb_coups_non_conformes]
    enregistrer_csv('donnees_' + joueur + '_partie_' + str(partie) + '.csv', en_tetes, donnees)

#enregistrer_donnees_partie_un_joueur('J1', 0)

def calculer_moyenne_liste(liste):
    return round(sum(liste)/len(liste), 2)

def formatter_liste_joueurs(joueurs):
    if isinstance(joueurs, str):
        joueurs = joueurs.split(',')
    return [f"J{num}" for num in joueurs]

def ajouter_underscores(joueurs):
    return "_".join(joueurs.split(','))

def enregistrer_stats_partie(partie, joueurs):
    '''
    Enregistrer les stats globales sur une partie
    '''
    traces_par_joueur = lire_traces_par_joueur(chemin_repertoires_traces)
    temps = []
    nb_coups = []
    nb_coups_non_conformes = []
    if joueurs == '0':
        nom_fichier = 'donnees_partie_' + str(partie) + '.csv'
        joueurs = []
        for j in traces_par_joueur:
            joueurs.append(j)
    else:
        nom_fichier = 'donnees_partie_' + str(partie) + '_' + ajouter_underscores(str(joueurs)) + '.csv'
        joueurs = formatter_liste_joueurs(joueurs)
    for joueur in traces_par_joueur:
        if joueur in joueurs:
            donnees_partie = traces_par_joueur[joueur][partie]
            if donnees_partie:
                temps.append(calculer_temps(donnees_partie))
                nb_coups.append(compter_nb_coups(donnees_partie))
                nb_coups_non_conformes.append(compter_coups_non_conformes(donnees_partie))
    moyenne_temps = calculer_moyenne_liste(temps)
    moyenne_nb_coups = calculer_moyenne_liste(nb_coups)
    moyenne_nb_coups_non_conformes = calculer_moyenne_liste(nb_coups_non_conformes)
    en_tetes = ["Temps moyen", "Nombre moyen de coups", "Nombre moyen de coups non conformes"]
    donnees = [moyenne_temps, moyenne_nb_coups, moyenne_nb_coups_non_conformes]
    enregistrer_csv(nom_fichier, en_tetes, donnees)

#enregistrer_stats_partie(0)


parser = argparse.ArgumentParser(description="Enregistrer des stats sur Kimind")
subparsers = parser.add_subparsers(dest='commande', required=True)

# --- Sous-commande 1 : un_joueur_caracteristiques ---
subparsers.add_parser('un_joueur_caracteristiques', help="Enregistrer les caracteristiques des joueurs")
# --- Sous-commande 2 : un_joueur_une_partie ---
parser_un_joueur_une_partie = subparsers.add_parser('un_joueur_une_partie', help="Enregistrer les donnees d'un joueur donne sur une partie donnee")
parser_un_joueur_une_partie.add_argument('joueur', type=str, help="Identifiant du joueur")
parser_un_joueur_une_partie.add_argument('id_partie', type=int, help="Identifiant de la partie")
# --- Sous-commande 3 : un_joueur_plusieurs_parties ---
subparsers.add_parser('un_joueur_plusieurs_parties', help="Enregistrer les donnees d'un joueur sur plusieurs parties")
# --- Sous-commande 4 : plusieurs_joueurs_une_partie ---
parser_plusieurs_joueurs_une_partie = subparsers.add_parser('plusieurs_joueurs_une_partie', help="Enregistrer les donnees de plusieurs joueurs sur une partie donnee")
parser_plusieurs_joueurs_une_partie.add_argument('id_partie', type=int, help="Identifiant de la partie")
parser_plusieurs_joueurs_une_partie.add_argument('joueurs', help="Identifiants des joueurs concernes sous forme de suite de chiffres")
# --- Sous-commande 5 : plusieurs_joueurs_plusieurs_parties ---
subparsers.add_parser('plusieurs_joueurs_plusieurs_parties', help="Enregistrer les donnees de plusieurs joueurs sur plusieurs parties")
args = parser.parse_args()

match args.commande:
    case "un_joueur_caracteristiques" | "un_joueur_plusieurs_parties" | "plusieurs_joueurs_plusieurs_parties":
        enregistrer_statistiques(traces)
    case "un_joueur_une_partie":
        enregistrer_donnees_partie_un_joueur(args.joueur, args.id_partie)
    case "plusieurs_joueurs_une_partie":
        enregistrer_stats_partie(args.id_partie, args.joueurs)
