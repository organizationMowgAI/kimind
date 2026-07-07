#! /usr/bin/env python3

import threading
import time

from view_guess_value_color2 import ViewGuessValueColor
from client_kimind import ClientKimind
from serveur_kimind import ServeurKimind

# ============================ PROGRAMME PRINCIPAL ============================

if __name__ == "__main__":

    print('python : begin of the script vue_kimind...')
    print()

    client = ClientKimind(5000)                                        
    vue = ViewGuessValueColor(client)  
    client.set_vue(vue)   
    print("avant affiche infos parties")
    client.affiche_infos_partie()
    print("avant demande nb solutions")
    client.demande_nb_solutions()
    vue.active_view()

    print()
    print('python : end of the script vue_kimind.')

# ============================== FIN LISTING ==================================
