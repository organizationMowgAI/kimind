## ============================ TRAITEMENTS REQUETES/MESSAGES =============================

import json

class Requete:

    def __init__(self, intitule_requete):
        self.__intitule = intitule_requete

    def intitule(self):
        return self.__intitule

    def __str__(self):
        return self.__intitule

    def est_requete_json(self):
        try:
            requete1 = self.decompose_requete_json()
            return True
        except ValueError:
            return False

    def decompose_requete_json(self):
        print("decompose intitule = " + self.__intitule)
        requete = json.loads(self.__intitule.strip())
        function = requete.get("function")
        args = requete.get("args", [])
        return function, args

    def decompose_requete_message(self):
        requete = json.loads(self.__intitule.strip())
        message = requete.get("message")

    def fin_connexion(self):
        return self.__intitule == "fin_connexion"

# ============================== FIN LISTING ===============================================
