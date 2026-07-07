# =============================================================================
#                ETABLIT UNE CONNEXION AVEC LE CLIENT PROLOG DE KIMIND
# =============================================================================

import json
from client_serveur import ClientServeur
from view_guess_value_color2 import ViewGuessValueColor

class ServeurKimind:

    def __init__(self, port_client, vue):
        self.__vue = vue
        self.__serveur = ClientServeur()
        self.__serveur.ouvre_connexion(port=port_client)

    def get_vue(self):
        return self.__vue

    def get_serveur(self):
        return self.__serveur

# ============= FONCTIONS EN TANT QUE SERVEUR POUR LE CLIENT PROLOG ===========

        # recupere les requetes
    def lit_requetes(self):
            #print("attente requetes")
        requete = self.__serveur.lit_requete()
        print('requete lue')
        print(str(requete))
        while not requete.fin_connexion():
            self.traite_requete(requete)
            requete = self.__serveur.lit_requete()
            print('requete lue :')
            print(str(requete))

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
                case "add3":
                    pass
                    print('avant add3')
                        # reponse = add3(connexion, *args)
                    print('reponse apres add3')
                    # print(reponse)
                case _:
                    reponse = json.dumps({"error": "Unknown function"}) + "\n"

            reponse_au_client = json.dumps({"id": ident, "result": reponse}) + "\n"
            print('python: reponse envoyee = ' + reponse_au_client)
            connexion.envoie(reponse_au_client)

        except Exception as e:
            return json.dumps({"error": str(e)}) + "\n"


    # ==================== EMET/RECOIT REQUETES ET MESSAGES ===================

    def envoie(self, message):
        self._client.envoie(message)

    # ========================= OUVRE/FERME CONNEXION =========================

    def ferme_connexion(self):
        self.__serveur.ferme_connexion()

    # ===================== FONCTIONS APPELLANT LA VUE ========================

    
# ============================== FIN LISTING ==================================
