# =============================================================================
#               ETABLIT UNE CONNEXION AVEC LE SERVEUR PROLOG DE KIMIND
#                       (fait office de controleur cote python)
# =============================================================================
 
import json
from client_serveur import ClientServeur
from carte_reponse import CarteReponse

class ClientKimind:

    def __init__(self, port_serveur):
        self.__client = ClientServeur()
        self.__client.ouvre_connexion(port=port_serveur)
        print("(python) connexion ouverte")
        self.__nb_tries = 0

    def get_nb_tries(self):
        return self.__nb_tries

    def set_nb_tries(self, nb):
        self.__nb_tries = nb
    
    def get_vue(self):
        return self.__vue

    def set_vue(self, vue):
        self.__vue = vue

    def get_client_(self):
        return self.__client

    # ======================= FONCTIONS LIEES A LA VUE ========================

    def joueur_joue(self):
        requete = json.dumps({"fonction": "joue_coup_joueur", "args": []})
        self.traite_coup(requete)
     
    def robot_joue(self):
        requete = json.dumps({"fonction": "joue_coup_robot", "args": []})
        self.traite_coup(requete)

    def explique(self):
        requete = json.dumps({"fonction": "explique", "args": []})
        self.__client.envoie(requete)
        reponse = self.__client.lit_plusieurs_lignes()
        self.__vue.open_child("Explications", reponse, "explications"),

    def ordre_couleurs(self) :
        requete = json.dumps({"fonction": "ordre_couleurs", "args": []})
        return self.__client.envoie_et_reponse(requete)

    def somme_valeurs(self) :
        requete = json.dumps({"fonction": "somme_valeurs", "args": []})
        return int(self.__client.envoie_et_reponse(requete))
    
    def carte_devinee(self, position):
        requete = json.dumps({"fonction": "carte_devinee", "args": [position]})
        reponse = self.__client.envoie_et_reponse(requete)
        return eval(reponse)

    def nb_tries(self):
        requete = json.dumps({"fonction": "nb_tries", "args": []})
        return int(self.__client.envoie_et_reponse(requete))
        
    def current_guess_suit(self, i):
        requete = json.dumps({"fonction": "current_guess_suit", "args": [i]})
        return self.__client.envoie_et_reponse(requete)

    def nb_guess_suits(self):
        requete = json.dumps({"fonction": "nb_guess_suits", "args": []})
        return int(self.__client.envoie_et_reponse(requete))

    def fin_connexion(self):
        requete = json.dumps({"fonction": "fin_connexion", "args": []})
        self.__client.envoie(requete)
        self.__client.ferme_connexion()

    def correct_value(self, i):
        requete = json.dumps({"fonction": "correct_value", "args": [i]})
        return self.__client.envoie_et_reponse(requete)

    def correct_suit(self, i):
        requete = json.dumps({"fonction": "correct_suit", "args": [i]})
        return self.__client.envoie_et_reponse(requete)

    def mode_emploi(self):
        requete = json.dumps({"fonction": "mode_emploi", "args": []})
        return self.__client.envoie_et_reponse(requete)

    def nb_guess_cards(self):
        requete = json.dumps({"fonction": "nb_guess_cards", "args": []})
        return int(self.__client.envoie_et_reponse(requete))

    def regle_jeu(self):
        requete = json.dumps({"fonction": "regle_jeu", "args": []})
        return self.__client.envoie_et_reponse(requete)
            
    def get_com(self, i):
        print("get_com(" + str(i) + ")")

    def is_played_card(self, i):
        self.__client.envoie('carte_devinee_en_i')
        self.__client.envoie(str(i))
        return bool(self.__client.lit())

    def exit(self):
        self.__vue.close_window()
        self.__vue.quit()

            # ====== BOUTONS DE LA VUE NON TRAITES
    def handler_click_back_card(self, i):
        print("handler_click_back_card " + str(i))

    def handler_card(self, color):
        print("hander_card: + color")

    def handler_new_game(self):
        print("handler new game")

    # =========================  DEMANDES A PROLOG ===================

    def traite_coup(self, requete):
        fonction, args = self.__client.envoie_et_reponse_json(requete)

        cartes = []
        for i in range(len(args)):
            cartes.append(ClientKimind.construit_carte(args[i]))
            self.__vue.affiche_carte(cartes[i])
            self.__vue.maj_feedback_position(cartes[i])

        nb_tries = self.nb_tries()
        self.set_nb_tries(nb_tries)
        self.verif_cartes_devinees(cartes, nb_tries)
        self.__vue.display_cartes_cachees(cartes)
        self.__vue.show_feedback(cartes, nb_tries)

        self.demande_nb_solutions()
        self.__vue.update_view()

        if self.gagne(cartes):
                self.__vue.display_message('Kibot gagne en '+ 
                                            str(nb_tries) + ' coup(s) !!!!')

    def demande_nb_solutions(self):
        requete1 = json.dumps({"fonction": "nombre_solutions", "args": []})
        fonction1, args1 = self.__client.envoie_et_reponse_json(requete1)

        nb_solutions_positions = str(args1[0])
        nb_solutions_no_positions = str(args1[1])
        self.__vue.display_message('number of solutions                                         :  ' + nb_solutions_positions + '\n' +
                                   'number of solutions (without positions)   :  ' + nb_solutions_no_positions)

    def display_nb_solutions(self, nb_solutions_json):
        fonction, args = nb_solutions_json.decompose_requete_json()
        print("fonction")
        nb_solutions_positions = str(args[0])
        nb_solutions_no_positions = str(args[1])
        self.__vue.display_message('number of solutions                                      :  ' + nb_solutions_positions + '\n' +
                                   'number of solutions (without positions)   :  ' + nb_solutions_no_positions)

    # ================================= DIVERS ================================

    def affiche_infos_partie(self):
        print("affiche infos partie")
        str_ordre_couleurs = self.ordre_couleurs()
        ordre = eval(str_ordre_couleurs)
        ordre1 = ordre["args"]
        string_ordre = self.string_ordre_couleurs(ordre1)
        somme  = self.somme_valeurs()
        self.__vue.display_message2("the sum of the values of the cards is " + str(somme) + \
                                    "\n" +  string_ordre)
        print("fin affiche infos partie")
        
    @classmethod
    def string_ordre_couleurs(cls, ordre):
        s = ""
        for element in ordre:
            if element == "avant":
                element = "<"
            elif element == "meme_rang":
                element = "="
            
            if element == "<" or element == "=":
                s = s + element + " "
            else:
                s = s + element + " "
        return s
             
    @classmethod
    def gagne(cls, cartes):
        gagne = True
        i = 0
        while i < len(cartes) and gagne:
            gagne = cartes[i].carte_devinee()
            i = i+1
        return gagne

            # verifie les cartes qui viennent d'etre devinees
    def verif_cartes_devinees(self, cartes, nb_tries):
        for carte in cartes:
            if carte.carte_devinee():
                carte.set_coup_identification(nb_tries)
      
    @classmethod
    def construit_carte(cls, carte_json):
        arguments = carte_json["args"]
        return CarteReponse(arguments[0], arguments[1], arguments[2], arguments[4], arguments[5])

# ============================== FIN LISTING ==================================
