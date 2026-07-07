class Carte:

    def __init__(self, position, couleur, valeur):
        self.__position = position
        self.__couleur = couleur
        self.__valeur = valeur

    def __str__(self):
        return  "\nposition    = " + str(self.get_position()) + \
                "\ncouleur     = " + str(self.get_couleur())  + \
                "\nvaleur      = " + str(self.get_valeur())                

    def get_position(self):
        return self.__position

    def get_couleur(self):
        return self.__couleur

    def get_valeur(self):
        return self.__valeur

# ============================== FIN LISTING ==================================
    

