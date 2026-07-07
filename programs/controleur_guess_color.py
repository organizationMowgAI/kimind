# contains all the logics of the mastermind level 1 game

from model_guess_color import ModelGuessColor
from view_guess_color import ViewGuessColor

class ControlerGuessColor:

    def __init__(self, model):
        self._model = model

    def set_view(self, view):
        self._view = view

    def model(self):
        return self._model

    def exit_game(self):
        self.end_game()

    def end_game(self):
        print("controleur_guess_color : debut end_game")
        self._view.close_window()
        self.set_resultat()
        self._model.sauvegarder_partie()
        print("controleur_guess_color : fin end_game")

    def new_game(self):
        self.end_game()
        self._model = ModelGuessColor(self._model.nb_guess_suits())
        self._model.initialize_cards_and_game()
        self._view = ViewGuessColor(self._model, self)

        # toutes les cartes sont posees
    def next_try(self):
        self._view.active_colors_buttons()
        self._model.increment_nb_tries()
        self._model.reinitialise_nb_cartes_posees()
        self._model.update_nb_cartes_a_poser()
        self._model.reset_cartes_posees()
        self._model.reset_played_cards()
        self._model.maj_cartes_venant_detre_devinees()
        self._view.active_back_cards()
        self._view.display_message("essai " + str(self._model.nb_tries() + 1))
        self._view.hide_played_cards()
        self._view.clear_mid_images()
        self._view.clear_mid_labels()
        self._view.maj_feedback_data()
        self._view.update_view()

    def set_resultat(self):
        if self._model.win():
            self._model.set_resultat('gagne')
        else:
            self._model.set_resultat('abandon')

    def set_position_carte(self, i):
        self._model.set_position_carte_courante(i)

    def active_carte_courante_precedente(self):
        i = self._model.position_carte_courante()
        self._view.active_back_card(i)

        # dos de la carte cachée de position position_carte été cliqué
    def handle_click_back_card(self, position_carte):
        self.set_position_carte(position_carte)              # carte i devient carte courante
        self._view.inactive_back_cards()                     # bloque toutes les cartes
        if not self._model.couleur_devinee(position_carte):
            self._view.active_colors_area()                  # active panneau des couleurs
        self._view.update_view()

    def receive_color(self, color):
        position_carte = self._model.position_carte_courante()
        self._view.invisible_colors_area()
        self._view.inactive_color_button(color)
        self.model().set_current_guess_suit(color)
        self.handle_guess_card(position_carte)

        # nouvelle carte posee par le joueur
    def handle_guess_card(self, position_carte):
        self._model.add_duree()
        self._model.ajoute_carte_jouee(position_carte)
        self._view.display_card(position_carte)              
        self.update_view()
        self._view.maj_feedback_position(position_carte)
        self._model.incremente_nb_cartes_posees()
        self._model.incremente_total_cartes_jouees()

        if self._model.carte_devinee(position_carte):
            self._model.set_carte_courante_devinee(position_carte)
            self._model.set_carte_venant_detre_devinee(position_carte, True)

        if self._model.toutes_cartes_posees():
            self._view.show_feedback()
            self._view.display_cartes_cachees()
            message_contraintes = self._model.contraintes_respectees()
            if message_contraintes != "":
                self._view.show_error("erreur !", message_contraintes)
            self._view.inactive_colors_buttons()

            if self._model.win():
                nb_coups = self._model.nb_tries() + 1
                self._view.display_message('GAGNE en '+ str(nb_coups) + ' coup(s) !!!!')
                self._model.set_resultat('win')
                self._view.active_new_game_button()
                self._view.update_view()
            else:
                self.next_try()
        else:
            self._view.active_back_cards()

    def update_view(self):
        self._view.update_view()

    def hide_color_area(self):
        self._view.invisible_colors_area()

# end of listing
