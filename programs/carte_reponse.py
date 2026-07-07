from carte import Carte

class CarteReponse(Carte):

    def __init__(self, position, couleur, valeur, rep_couleur, rep_valeur):
        super().__init__(position, couleur, valeur)
        self.init_reponse_valeur(rep_valeur)
        self.__rep_couleur = rep_couleur
        self.__coup_identification = 0

    def __str__(self):
        return super().__str__() + "\nrep_couleur = " + str(self.get_reponse_couleur()) + \
                "\nrep_valeur  = " + str(self.get_reponse_valeur())  + \
                "\ncoup_ident  = " + str(self.get_coup_identification())           

    def init_reponse_valeur(self, rep_valeur):
        if rep_valeur == "plus":
            self.__rep_valeur = "more"
        elif rep_valeur == "moins":
            self.__rep_valeur = "less"
        else:
            self.__rep_valeur = "equals"
        
    def get_reponse_couleur(self):
        return self.__rep_couleur

    def get_reponse_valeur(self):
        return self.__rep_valeur

        # a quel coup la carte a ete identifiee
    def get_coup_identification(self):
        return self.__coup_identification

    def set_coup_identification(self, numero_coup):
        self.__coup_identification = numero_coup

    def couleur_devinee(self):
        return self.get_reponse_couleur() == "oui"

    def valeur_devinee(self):
        return self.get_reponse_valeur() == "equals"

    def valeur_trop_grande(self):
        return self.get_reponse_valeur() == "less"

    def valeur_trop_petite(self):
        return self.get_reponse_valeur() == "more"

    def carte_devinee(self):
        return self.couleur_devinee() and self.valeur_devinee()

    def carte_venant_etre_devinee(self, numero_coup):
        return numero_coup > 0 and self.get_coup_identification() == numero_coup
        
# ============================== FIN LISTING ==================================
