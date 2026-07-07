# =============================================================================
#                ETABLIT UNE CONNEXION AVEC UN SERVEUR PROLOG
# =============================================================================

import json
from client_serveur import ClientServeur

class Client:

    def __init__(self, port_client):
        self._client = ClientServeur()
        print('avant connexion client py')
        self._client.ouvre_connexion(port=port_client)
        print('apres connexion client py')

    # =========== FONCTIONS EN TANT QUE SERVEUR POUR UN CLIENT PROLOG =========

    def indices(self):
        self._vue.creer_fenetre_indices()
        print("apres indices")

     # recupere les requetes
    def lit_requetes(self):
        requete = self._serveur.lit_requete()
        print('requete lue')
        print(str(requete))
        while not requete.fin_connexion():
            self.traite_requete(requete)
            requete = self._serveur.lit_requete()
            print('requete lue :')
            print(str(requete))

    # ============ FONCTIONS EN TANT QUE CLIENT POUR UN SERVEUR PROLOG ========

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

            reponse_au_client = json.dumps({"id": ident, "result": reponse}) + "\n"
            print('python: reponse envoyee = ' + reponse_au_client)
            connexion.ecrit(reponse_au_client)

        except Exception as e:
            return json.dumps({"error": str(e)}) + "\n"

    # ========================================================================

    def demande(self, message):
        print("demande : " + message)
        self._client.ecrit(message)
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

    # ============================= FONCTIONS 2 arguments =====================

    def demande2(self, message, argument):
        self._client.ecrit(message)
        self._client.ecrit(argument)
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


    # ======================= FONCTION SPECIFIQUES A LA VUE ===================

    def handler_click_back_card(self, i):
        print("handler_click_back_card " + str(i))

    def handler_card(self, color):
        print("hander_card: + color")

    def handler_new_game(self):
        print("handler new game")

    def handler_exit(self):
        print("handler exit")

    def joue(self):
        self._client.ecrit("joue")

    def carte_devinee(self, position_carte):
        self._client.ecrit('carte_devinee')
        self._client.ecrit(str(position_carte))
        return bool(self._client.lit())

    def carte_venant_detre_devinee(self, position_carte):
        self._client.ecrit('carte_venant_detre_devinee')
        self._client.ecrit(str(position_carte))
        return bool(self._client.lit())

    def correct_suit(self, i):
        self._client.ecrit('correct_suit')
        self._client.ecrit(str(i))
        return bool(self._client.lit())

    def carte_devinee(self, position):
        self._client.ecrit('carte_devinee')
        self._client.ecrit(str(position))
        return bool(self._client.lit())

    def carte_devinee_en_i(self, i):
        self._client.ecrit('carte_devinee_en_i')
        self._client.ecrit(str(i))
        return bool(self._client.lit())

    def is_played_card(self, i):
        self._client.ecrit('carte_devinee_en_i')
        self._client.ecrit(str(i))
        return bool(self._client.lit())

    def couleurs_cartes_devinees(self):
        self._client_ecrite('couleurs_cartes_devinees')
        reponse = self._client.lit()
        return reponse

    def correct_suit(self, i):
        self._client.ecrit('correct_suit')
        self._client.ecrit(str(i))
        return self._client.lit()

    # ==================== EMET/RECOIT REQUETES ET MESSAGES ====================

    def envoie(self, message):
        self._client.ecrit(message)

    # ======================= OUVRE/FERME CONNEXION ============================

    def ferme_connexion(self):
        self._client.ferme_connexion()

# ============================== FIN LISTING ===================================
