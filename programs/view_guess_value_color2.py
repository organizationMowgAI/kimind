#!/bin/python3

from tkinter import *
import customtkinter as ctk
from view_guess_color2 import ViewGuessColor
from pathlib import Path
from PIL import Image
from carte_reponse import CarteReponse

class ViewGuessValueColor(ViewGuessColor):

    NB_VALUES = 10

    def __init__(self, com, robot_joue=True):
        super().__init__(com, robot_joue)
        self.cardimg = [0, 0, 0, 0, 0, 0, 0, 0]
        self.values_buttons = []
        self.make_buttons_values()

    def make_buttons_values(self):

        self.VALUE_BUTTON_WIDTH   = 0.01 * self.get_resolution_x()
        self.VALUE_BUTTON_HEIGHT  = 0.02 * self.get_resolution_y()

        self.NUM_AREA_WIDTH = int(ViewGuessValueColor.NB_VALUES * self.VALUE_BUTTON_WIDTH * 1.3)
        self.NUM_AREA_HEIGHT = int(self.VALUE_BUTTON_HEIGHT * 1.2)
        self.NUM_AREA_RELX = self.COLORS_AREA_RELX
        self.NUM_AREA_RELY = self.COLORS_AREA_RELY

        self.num_area = ctk.CTkFrame(
            self.window,
            width=self.NUM_AREA_WIDTH,
            height=self.NUM_AREA_HEIGHT,
            corner_radius=8,
            fg_color="#FCEDD6")
        self.num_area.place(relx=self.NUM_AREA_RELX, rely=self.NUM_AREA_RELY, anchor="nw")

        grid_dict = {"sticky": "nsew", "padx": 5, "pady": 5}

        nb_values = ViewGuessValueColor.NB_VALUES

        for j in range(nb_values):
            self.num_area.grid_columnconfigure(j, weight=1)
            button = ctk.CTkButton(self.num_area,
                                   width=self.VALUE_BUTTON_WIDTH,
                                   height=self.VALUE_BUTTON_HEIGHT,
                                   font=("Lato", 16),
                                   fg_color="#FDF9F2",
                                   hover=False,
                                   text_color="#000000",
                                   text=str(j+1),
                                   command=lambda i=j: self.handler_value((i+1)))
            button.grid(column=j, row=0, **grid_dict)

            self.values_buttons.append(button)

        self.hide_num_area()

    def show_num_area(self):
        self.num_area.place(relx=self.NUM_AREA_RELX, rely=self.NUM_AREA_RELY, anchor="nw")

    def hide_num_area(self):
        self.num_area.place_forget()

# ================================ HANDLERS ===================================

    def handler_value(self, value):
        self._controler.receive_value(value)

# ==================================== PATHS ==================================

    def path_to_guess_card_image(self):
        guess_suit = self.get_com().current_guess_suit()
        guess_value = self.get_com().current_guess_value()
        return Path("./img/cards/" + guess_suit + "/" + str(guess_value) + ".png")

    def path_to_correct_card_image(self, i):
        correct_suit = self.get_com().correct_suit(i)
        correct_value = self.get_com().correct_value(i)
        return Path(f"../img/cards/{correct_suit}/{correct_value}.png")

    def path_to_little_card_image(self):
        guess_suit = self.get_com().current_guess_suit()
        guess_value = self.get_com().current_guess_value()
        return Path("../img/cards/little/s" + guess_suit + "/" + 
                    str(guess_value) + ".png")

    def path_to_guess_card_image(self):
        guess_suit = self.get_com().current_guess_suit()
        guess_value = self.get_com().current_guess_value()
        return Path("../img/cards/" + guess_suit + "/" + 
                    str(guess_value) + ".png")

# ================================= DISPLAY ===================================

    def affiche_message_carte_devinee(self):
        p = self.get_com().position_carte_courante()
        self.display_message("you guessed the colour and value of the card " + 
                                str(p))

    def display_cartes_cachees(self, cartes):   
        for carte in cartes:
            self.display_carte_cachee(carte)
        self.update_view()

    def display_carte_cachee(self, carte):
        position = carte.get_position()

        if carte.carte_devinee():
            self.hiddenans[position].configure(
                image=self.correct_cards[position][0],
                width=self.HIDDEN_CARD_WIDTH,
                height=self.HIDDEN_CARD_HEIGHT)
        else:
            if carte.couleur_devinee():
                suffixe = carte.get_couleur()
            else:
                suffixe = 'neutral'

            if carte.valeur_devinee():
                compare = 'frame'
            else:
                compare = carte.get_reponse_valeur()

            file_name = Path('../img/assets/card-' + compare + '-' + suffixe + '.png')
            self.cardimg[position] = ctk.CTkImage(light_image=Image.open(file_name),
                                                  size=(self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARD_HEIGHT))
            self.hiddenans[position].configure(image=self.cardimg[position])

    def get_file_image_feedback_reponse(self, carte):

        position = carte.get_position()
        carte_devinee = carte.carte_devinee()

        if carte_devinee:
            correct_suit = carte.get_couleur()
            correct_value = carte.get_valeur()   
            return Path(f"../img/cards/{correct_suit}/{correct_value}.png")

        couleur_devinee = carte.couleur_devinee()
        if couleur_devinee:
            suffixe = carte.get_couleur()
        else:
            suffixe = 'neutral'

        valeur_devinee = carte.valeur_devinee()
        if valeur_devinee:
            compare = 'frame'
        else:
            compare = carte.get_reponse_valeur()

        return Path('../img/assets/card-' + compare + '-' + suffixe + '.png')

# end of listing
