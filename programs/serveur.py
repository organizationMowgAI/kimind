# =============================================================================
#                ETABLIT UNE CONNEXION AVEC UN PROGRAMME CLIENT PROLOG
# =============================================================================

import json
from client_serveur import ClientServeur

class Serveur:

    def __init__(self, port_serveur):
        self._serveur = ClientServeur()
        self._serveur.ouvre_connexion(port=port_serveur)

    def set_vue(self, vue):
        self._vue = vue

# ============ FONCTIONS EN TANT QUE SERVEUR POUR UN CLIENT PROLOG ============

     # recupere les requetes
    def lit_requetes(self):
        print("serveur attente requetes")
        requete = self._serveur.lit_requete()
        print('requete lue')
        print(str(requete))
        while not requete.fin_connexion():
            self.traite_requete(requete)
            requete = self._serveur.lit_requete()
            print('requete lue :')
            print(str(requete))

    def indices(self):
        print("indices")
        self._vue.creer_fenetre_indices()
        print("apres indices")

# =========== FONCTIONS EN TANT QUE SERVEUR POUR UN CLIENT PROLOG =============

      # analyse et execute la requete
    def traite_requete(self, connexion, requete):
        print("traitement de la requete")
        print(requete)
        if requete.est_requete_json():
            print('requete json'),
            self.traite_requete_json(connexion, requete)
        else:
            print('requete python')
            self.traite_requete_message(connexion, requete)

    def traite_requete_message(self, requete):
        intitule = requete.intitule()
        match requete.intitule():
            case _:
                print("python: message recu" + intitule)

    def traite_requete_json(self, connexion, requete):
        print('traite requete json')
        function, args, ident = requete.decompose_requete_json()
        print('function:')
        print(function)
        print('args:')
        print(args)
        print('apres decompose')
        try:
            match function:
                case "add":
                    pass
                    # reponse = add(*args)
                case "multiply":
                    pass
                    # reponse = multiply(*args)
                case "add3":
                    pass
                    print('avant add3')
                    # reponse = add3(connexion, *args)
                    print('reponse apres add3')
                    # print(reponse)
                case _:
                    reponse = json.dumps({"error": "Unknown function"}) + "\n"

            reponse_au_serveur = json.dumps({"id": ident, "result": reponse}) + "\n"
            print('python: reponse envoyee = ' + reponse_au_serveur)
            connexion.ecrit(reponse_au_serveur)

        except Exception as e:
            return json.dumps({"error": str(e)}) + "\n"

    # =================== EMET/RECOIT REQUETES ET MESSAGES ====================

    def envoie(self, message):
        self._serveur.ecrit(message)

    # ====================== OUVRE/FERME CONNEXION ============================

    def ferme_connexion(self):
        self._serveur.ferme_connexion()

# ============================= FIN LISTING ===================================
