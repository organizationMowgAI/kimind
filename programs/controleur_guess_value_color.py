from controleur_guess_color import ControlerGuessColor
from model_guess_value_color import ModelGuessValueColor
from view_guess_value_color import ViewGuessValueColor

class ControlerGuessValueColor(ControlerGuessColor):

    def __init__(self, model):
        super().__init__(model)

        # traite couleur proposee
    def receive_color(self, color):
        self.model().set_current_guess_suit(color)
        position_carte = self._model.position_carte_courante()
        self._view.invisible_colors_area()
        self._view.inactive_color_button(color)
        if not self._model.valeur_devinee(position_carte):
            self._view.show_num_area()
        else:
            self.handle_guess_card(position_carte)

    def handle_click_back_card(self, position_carte):
        super().handle_click_back_card(position_carte)
        if self._model.couleur_devinee(position_carte):  # si couleur deja devinee
            self._view.show_num_area()                   # active directement panneau des valeurs

    def receive_value(self, value):
        self.model().set_current_guess_value(value)
        self._view.hide_num_area()
        self._view.update_view()
        self.handle_guess_card(self._model.position_carte_courante())

    def new_game(self):
        self.end_game()
        self._model = ModelGuessValueColor(self._model.nb_guess_suits(), self._model.nb_guess_values())
        self._model.initialize_cards_and_game()
        self._view = ViewGuessValueColor(self._model, self)

# end of listing
