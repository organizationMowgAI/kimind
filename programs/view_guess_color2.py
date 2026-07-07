#!/bin/python3

from tkinter import *
import tkinter as tk

from customtkinter import *
import customtkinter as ctk

from pathlib import Path
from PIL import Image

from carte_reponse import CarteReponse

class ViewGuessColor():

    DEFAULT_VALUE = 10

    BLUE = 0
    GREEN = 1
    RED = 2
    YELLOW = 3

    COLORS = ['blue', 'green', 'red', 'yellow']
    FRENCH_COLORS = ['bleu', 'vert', 'rouge', 'jaune']

    NB_COLORS = 4

    RESOLUTION_X_PERCENT = 0.9
    RESOLUTION_Y_PERCENT = 0.6

    BORDER_WIDTH = 1
    BORDER_COLOR = 'grey'
    HEIGHT_ON_WIDTH = 1.6

    BLEU = "#0060FE"
    VERT = "#39D100"
    ROUGE = "#DD0505"
    JAUNE = "#FCD700"

    POSITION_BLEU = 0
    POSITION_VERT = 1
    POSITION_ROUGE = 2
    POSITION_JAUNE = 3

    BACKGROUND_COLOR = "#FCEDD6"
    DARK_TEXT_COLOR_BUTTON = 'black'
    LIGHT_TEXT_COLOR_BUTTON = 'grey'
    TRANSPARENT = '#ab23ff'

    SHOW = False
    GRID_DICT = {"sticky": "nw", "padx": 2, "pady": 0}
    ctk.set_appearance_mode("light")

    def __init__(self, com, robot_joue=True): 
        self.__robot_joue = robot_joue
        self.__com = com
           
        self.child_windows = {}
        self.child_exists = False
        self.child_window = None

        self.root_window()
        self.center_window()
        self.set_constantes_ecran()
    
        self.init_mid_images_labels()

        self.backimg = []
        self.init_feedback()
        self.card_labels = []
        self.hiddenans = []          # cartes solutions cachees (dans proposition area)
        self.card_color_buttons = [] # boutons couleurs des cartes (dans proposition area)
        self.card_color_windows = [] # Bools indiquant si les fenêtres couleurs sont ouvertes
        self.card_value_buttons = [] # boutons valeurs des cartes (dans proposition area)
        self.card_value_windows = [] # Bools indiquant si les fenêtres valeurs sont ouvertes
        self.correct_cards = []
        self._colors_buttons = []

        self.main_menu()

    def com(self):
        return self.__com

    def get_com(self):
        return self.__com

    def root_window(self):
        self.__root = tk.Tk()           # artifice pour effacer la fenetere tk
        self.__root.withdraw()          

        self.window = tk.Toplevel()

            # Set relative size and center the window
        # self.window.set_window_size_and_position(width_percentage=0.7, height_percentage=0.7)

        screen_width = self.window.winfo_screenwidth()
        screen_height = self.window.winfo_screenheight()
        self._x_resolution = int(ViewGuessColor.RESOLUTION_X_PERCENT * screen_width)
        self._y_resolution = int(ViewGuessColor.RESOLUTION_Y_PERCENT * screen_height)

        self.window.geometry(f"{self._x_resolution}x{self._y_resolution}")
        self.window.resizable(True, True)

        self.window.title("KIMIND")
        self.window.config(bg="#fff")
        self.fond_ecran()

    def center_window(self): 
            #self.update_idletasks()
        self.window.update()

             # Get screen dimensions
        screen_width = self.window.winfo_screenwidth()
        screen_height = self.window.winfo_screenheight()

            # Get window dimensions (already set in __init__)
        window_width = self._x_resolution
        window_height = self._y_resolution

            # Calculate position for centering
        x = (screen_width - window_width) // 3
        y = (screen_height - window_height) // 2

            # Set window position
        self.window.geometry(f"+{x}+{y}")
  
    def fond_ecran(self):
        bg_light = ctk.CTkImage(light_image=Image.open("../img/background-light.png"),
                                 size=(self._x_resolution, self._y_resolution))
        bg = ctk.CTkLabel(self.window, text="", image=bg_light)
        bg.place(relx=0.5, rely=0.5, anchor="center")

    def set_constantes_ecran(self):
        self.set_constantes_widgets()
        self.set_constantes_frames()

    def set_constantes_widgets(self):
        self.PLAYED_CARD_WIDTH = 0.05 * self._x_resolution
        self.PLAYED_CARD_HEIGHT = ViewGuessColor.HEIGHT_ON_WIDTH * self.PLAYED_CARD_WIDTH

        self.HIDDEN_CARD_WIDTH = int(0.05 * self._x_resolution)
        self.HIDDEN_CARD_HEIGHT = ViewGuessColor.HEIGHT_ON_WIDTH * self.HIDDEN_CARD_WIDTH

        self.FEEDBACK_CARD_WIDTH = int(0.042 * self._x_resolution)
        self.FEEDBACK_CARD_HEIGHT = ViewGuessColor.HEIGHT_ON_WIDTH * self.FEEDBACK_CARD_WIDTH

        self.FEEDBACK_X_SEPARATEUR = 98
        self.FEEDBACK_SEPARATOR_HEIGHT = 20

        self.COLOR_BUTTON_WIDTH = int(0.038 * self._x_resolution)
        self.COLOR_BUTTON_HEIGHT = int(0.03 * self._y_resolution)

    def set_constantes_frames(self):
        nb_cards = self.__com.nb_guess_cards()  # nombre cartes

        self.REGLE_JEU_AREA_WIDTH = int(0.3 * self._x_resolution)
        self.REGLE_JEU_AREA_HEIGHT = int(0.25 * self._y_resolution)
        self.REGLE_JEU_AREA_RELX = 0.02
        self.REGLE_JEU_AREA_RELY = 0.02

        self.MESSAGES_AREA_WIDTH = self.REGLE_JEU_AREA_WIDTH
        self.MESSAGES_AREA_HEIGHT = self.REGLE_JEU_AREA_HEIGHT
        self.MESSAGES_AREA_RELX = self.REGLE_JEU_AREA_RELX
        self.MESSAGES_AREA_RELY = 0.4

        self.PLAYED_CARDS_AREA_WIDTH = int((nb_cards + 1) * self.PLAYED_CARD_WIDTH)  # haute ecran (cartes jouees)
        self.PLAYED_CARDS_AREA_HEIGHT = int(self.PLAYED_CARD_HEIGHT * 1.4)
        self.PLAYED_CARDS_AREA_RELX = 0.35
        self.PLAYED_CARDS_AREA_RELY = 0.02

        self.FEEDBACK_AREA_WIDTH = int(nb_cards * self.FEEDBACK_CARD_WIDTH * 1.5)  # droite ecran
        self.FEEDBACK_AREA_HEIGHT = int(1.22 * self._y_resolution)
        self.FEEDBACK_AREA_RELX = 0.65
        self.FEEDBACK_AREA_RELY = self.REGLE_JEU_AREA_RELY

        self.HIDDEN_CARDS_AREA_WIDTH = int((nb_cards + 1) * self.HIDDEN_CARD_WIDTH)  # milieu ecran (cartes cachees)
        self.HIDDEN_CARDS_AREA_HEIGHT = int(self.HIDDEN_CARD_HEIGHT * 2)
        self.HIDDEN_CARDS_AREA_RELX = self.PLAYED_CARDS_AREA_RELX
        self.HIDDEN_CARDS_AREA_RELY = self.MESSAGES_AREA_RELY

        self.COLORS_AREA_WIDTH = int((ViewGuessColor.NB_COLORS + 1) * self.COLOR_BUTTON_WIDTH)
        self.COLORS_AREA_HEIGHT = int(self.COLOR_BUTTON_HEIGHT * 1.4)
        self.COLORS_AREA_RELX = self.PLAYED_CARDS_AREA_RELX
        self.COLORS_AREA_RELY = 0.65

        self.BOTTOM_BUTTONS_AREA_WIDTH = int(0.26 * self._x_resolution)
        self.BOTTOM_BUTTONS_AREA_HEIGHT = int(0.15 * self._y_resolution)
        self.BOTTOM_BUTTONS_AREA_RELX = 0.35
        self.BOTTOM_BUTTONS_AREA_RELY = 0.72

    def build_frame_areas(self):
            # frame des cartes cachées (mileu de l'écran)
        self.hidden_cards_area = tk.LabelFrame(self.window,
                                               height=self.HIDDEN_CARDS_AREA_HEIGHT,
                                               width=self.HIDDEN_CARDS_AREA_WIDTH,
                                               text="system answer",
                                               bd=self.BORDER_WIDTH,
                                               bg=self.BACKGROUND_COLOR)
        self.hidden_cards_area.place(relx=self.HIDDEN_CARDS_AREA_RELX, 
                                rely=self.HIDDEN_CARDS_AREA_RELY, anchor="nw")


        self.regle_jeu_area = tk.LabelFrame(self.window,
                                            text="parameters of the game",
                                            height=self.REGLE_JEU_AREA_HEIGHT,
                                            width=self.REGLE_JEU_AREA_WIDTH,
                                            bd=self.BORDER_WIDTH,
                                            bg="#FCEDD6")
        self.regle_jeu_area.place(relx=self.REGLE_JEU_AREA_RELX, 
                                rely=self.REGLE_JEU_AREA_RELY, anchor="nw")

            # frame des cartes jouees (haut de l'écran)
        self.played_cards_area = tk.LabelFrame(self.window,
                                               height=self.PLAYED_CARDS_AREA_HEIGHT,
                                               width=self.PLAYED_CARDS_AREA_WIDTH,
                                               text="player's cards",
                                               bd=self.BORDER_WIDTH,
                                               bg=self.BACKGROUND_COLOR)
        self.played_cards_area.place(relx=self.PLAYED_CARDS_AREA_RELX, 
                                rely=self.PLAYED_CARDS_AREA_RELY, anchor="nw")

            # frame de l'historique des coups (feedback)
        self.feedback_area = ctk.CTkScrollableFrame(self.window,
                                                    height=self.FEEDBACK_AREA_HEIGHT,
                                                    width=self.FEEDBACK_AREA_WIDTH,
                                                    border_width=self.BORDER_WIDTH,
                                                    border_color=self.BORDER_COLOR,
                                                    corner_radius=8,
                                                    fg_color=self.BACKGROUND_COLOR)
        self.feedback_area.place(relx=self.FEEDBACK_AREA_RELX, 
                                rely=self.FEEDBACK_AREA_RELY, anchor="nw")

        self.messages_area = tk.LabelFrame(self.window,
                                           text="messages",
                                           height=self.MESSAGES_AREA_HEIGHT,
                                           width=self.MESSAGES_AREA_WIDTH,
                                           bd=self.BORDER_WIDTH,
                                           bg=self.BACKGROUND_COLOR)
        self.messages_area.place(relx=self.MESSAGES_AREA_RELX, 
                                rely=self.MESSAGES_AREA_RELY, anchor="nw")

        self.colors_area = ctk.CTkFrame(self.window,
                                        height=self.COLORS_AREA_HEIGHT,
                                        width=self.COLORS_AREA_WIDTH,
                                        corner_radius=8,
                                        fg_color=self.BACKGROUND_COLOR)
        self.build_bootom_area()

    def build_bootom_area(self):
        self.bottom_area = ctk.CTkFrame(
            self.window,
            height=self.BOTTOM_BUTTONS_AREA_HEIGHT,
            width=self.BOTTOM_BUTTONS_AREA_WIDTH,
            fg_color=ViewGuessColor.BACKGROUND_COLOR)
        self.bottom_area.place(relx=self.BOTTOM_BUTTONS_AREA_RELX, 
                        rely=self.BOTTOM_BUTTONS_AREA_RELY, anchor="nw")

    def main_menu(self):
        self.build_frame_areas()
        self.build_color_buttons()
        self.build_bottom_buttons()
        self.build_message_widget()
        self.build_regle_jeu_widget()
        self.build_hidden_cards()  
        self.affiche_mode_emploi()

    def init_feedback(self):
        self.feedback_imgs = []
        self.feedback_labels = []
        self.feedback_imgs_reponses = []
        self.feedback_labels_reponses = []
        nombre_couleurs = self.__com.nb_guess_suits()
        for i in range(nombre_couleurs):
            self.feedback_imgs.append(None)
            self.feedback_labels.append(None)
            self.feedback_imgs_reponses.append(None)
            self.feedback_labels_reponses.append(None)

    def maj_feedback_data(self):
        nombre_couleurs = self.__com.nb_guess_suits()
        for position_carte in range(nombre_couleurs):
            if not self.__com.carte_devinee(position_carte):
                self.feedback_imgs[position_carte] = None
                self.feedback_labels[position_carte] = None
                self.feedback_imgs_reponses[position_carte] = None
                self.feedback_labels_reponses[position_carte] = None

    def get_resolution_x(self):
        return self._x_resolution * 1.0

    def get_resolution_y(self):
        return self._y_resolution * 1.0

    def build_color_buttons(self):
        colors = [ViewGuessColor.BLEU, ViewGuessColor.VERT, ViewGuessColor.ROUGE, ViewGuessColor.JAUNE]
        nb_colors = ViewGuessColor.NB_COLORS
        for i in range(nb_colors):
            px = i * self.largeur_relative_widget(nb_colors, self.COLOR_BUTTON_WIDTH, self.COLORS_AREA_WIDTH)
            button = ctk.CTkButton(
                master=self.colors_area, width=self.COLOR_BUTTON_WIDTH, height=self.COLOR_BUTTON_HEIGHT,
                text="", font=("Lato", 16), text_color="#000000",
                corner_radius=4, border_spacing=2, fg_color=colors[i], hover=False,
                command=lambda j=i: self.handler_card(ViewGuessColor.COLORS[j]))
            button.place(x=5, relx=px, rely=.15, anchor="nw")
            self._colors_buttons.append(button)

    def build_bottom_buttons(self):
        img_new_game = Image.open("../img/assets/try.png")
        self.new_game = ctk.CTkButton(
            master=self.bottom_area, text="new game", fg_color="transparent", hover=False, state=tk.DISABLED,
            text_color=ViewGuessColor.DARK_TEXT_COLOR_BUTTON,
            text_color_disabled=ViewGuessColor.LIGHT_TEXT_COLOR_BUTTON,
            image=ctk.CTkImage(light_image=img_new_game, size=(64, 64)), command=self.handler_new_game)
        self.new_game.place(relx=.25, rely=.3, anchor="center")

        img_exit = Image.open("../img/assets/leave.png")
        self.exit = ctk.CTkButton(
            master=self.bottom_area, text="end of the game", fg_color="transparent", hover=False,
            text_color=ViewGuessColor.DARK_TEXT_COLOR_BUTTON,
            text_color_disabled=ViewGuessColor.LIGHT_TEXT_COLOR_BUTTON,
            image=ctk.CTkImage(light_image=img_exit, size=(64, 64)), command=self.handler_exit)
        self.exit.place(relx=.75, rely=.3, anchor="center")

        self.play = ctk.CTkButton(
            master=self.bottom_area, text="Play", fg_color="transparent",
            bg_color="#00FF00", hover=False,
            text_color=ViewGuessColor.DARK_TEXT_COLOR_BUTTON,
            text_color_disabled=ViewGuessColor.LIGHT_TEXT_COLOR_BUTTON,
            command=self.handler_joue
        )

        self.play.place(relx=.25, rely=.8, anchor="center")

        self.reason = ctk.CTkButton(
            master=self.bottom_area, text="Explain", fg_color="transparent",
            bg_color="#FF1D8D", hover=False,
            text_color=ViewGuessColor.DARK_TEXT_COLOR_BUTTON,
            text_color_disabled=ViewGuessColor.LIGHT_TEXT_COLOR_BUTTON,
            command= self.handler_explique
        )
        self.reason.place(relx=.75, rely=.8, anchor="center")
        self.child_windows["explications"] = None

    def build_regle_jeu_widget(self):
        self._textRegleJeu = tk.Label(master=self.regle_jeu_area, 
                                        text=self.__com.regle_jeu(),
                                        fg='black',
                                        bg=self.BACKGROUND_COLOR)
        self._textRegleJeu.place(relx=0.1, rely=0.05, anchor="nw")
        self.update_view()

    def build_message_widget(self):
        self._textLabel = tk.Label(master=self.messages_area, justify='left', 
                                    fg='black', 
                                    bg=self.BACKGROUND_COLOR)
        self._textLabel.place(relx=0.1, rely=0.1, anchor="nw")

        # créé et affiche les images des cartes cachées (ou découvertes)
    def build_hidden_cards(self):    
        nb_cards = self.__com.nb_guess_suits()
        for i in range(nb_cards):
            self.correct_cards.append([0, 0])

            # cree les images des cartes découvertes
        for i in range(nb_cards):
            filename = self.path_to_correct_card_image(i)
            image_correct_card = ctk.CTkImage(light_image=Image.open(filename),
                                              size=(self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARD_HEIGHT))
            self.correct_cards[i][0] = image_correct_card
            self.correct_cards[i][1] = ctk.CTkButton(self.hidden_cards_area, fg_color="transparent",
                                                     width=int(self.HIDDEN_CARD_WIDTH * 1.1),
                                                     height=int(self.HIDDEN_CARD_HEIGHT * 1.1),
                                                     text="",
                                                     state=ctk.DISABLED,
                                                     image=image_correct_card,
                                                     hover=False)

            # créé et place les images des cartes cachées
        for j in range(nb_cards):

            label = ctk.CTkLabel(master=self.hidden_cards_area, text=f'{j}', 
                                font=("arial",18))
            self.card_labels.append(label)

            self.backimg.append(Image.open("../img/assets/back.png"))
            image_back_card = ctk.CTkImage(light_image=self.backimg[j],
                                           size=(self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARD_HEIGHT))
            button = ctk.CTkButton(self.hidden_cards_area, fg_color="transparent",
                                   width=int(self.HIDDEN_CARD_WIDTH * 1.1),
                                   height=int(self.HIDDEN_CARD_HEIGHT * 1.1),
                                   text="",
                                   image=image_back_card,
                                   hover=False,
                                   command=lambda i=j: self.handler_click_back_card(i))
            self.hiddenans.append(button)

                    # creation des boutons c0, v0, c1, v1 etc.
            color_window_key = "C" + str(j)
            value_window_key = "V" + str(j)
            self.child_windows[color_window_key] = None
            self.child_windows[value_window_key] = None

            card_color_button_name = color_window_key
            self.card_color_windows.append(False)

            card_color_button = ctk.CTkButton(
                master=self.hidden_cards_area, width=int(self.HIDDEN_CARD_WIDTH/2), 
                                                    height=self.COLOR_BUTTON_HEIGHT,
                text=card_color_button_name, font=("Lato", 16), text_color="#000000",
                corner_radius=4, border_spacing=2, fg_color="#FFFFFF", hover=False,
                command=lambda k=j: self.open_child(
                                    f'Couleurs {k}',
                                    f'Des explications des couleurs C{k} ... \n',
                                    "C" + str(k)
                                                    )
                                             )
            self.card_color_buttons.append(card_color_button)

            card_value_button_name = "V" + str(j)
            card_value_button = ctk.CTkButton(
                master=self.hidden_cards_area, 
                width=int(self.HIDDEN_CARD_WIDTH/2), height=self.COLOR_BUTTON_HEIGHT,
                text=card_value_button_name, font=("Lato", 16), text_color="#000000",
                corner_radius=4, border_spacing=2, fg_color="#FFFFFF", hover=False,
                command=lambda k=j: self.open_child(
                                f'Valeurs {k}',
                                f'Des explications des valeurs V{k} ... \n',
                                "V" + str(k)
                                                    )
                                            )
            self.card_value_windows.append(False)
            self.card_value_buttons.append(card_value_button)

        self.place_card_labels(nb_cards)
        self.place_backcards(nb_cards)
        self.place_card_buttons(nb_cards)

    def open_window(self, window_type, index, window_open):
        if window_open:
            return
        if window_type == "color":
            self.card_color_windows[index] = True
        elif window_type == "value":
            self.card_value_windows[index] = True
        self.__com.indices()

    def place_card_labels(self, nb_cards):
        for i in range(len(self.card_labels)):
            px = i * self.largeur_relative_widget(nb_cards, self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARDS_AREA_WIDTH)
            self.card_labels[i].place(x=55, relx=px, rely=0.075, anchor="center")

    def place_backcards(self, nb_cards):
        for i in range(len(self.hiddenans)):
            px = i * self.largeur_relative_widget(nb_cards, self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARDS_AREA_WIDTH)
            self.hiddenans[i].place(x=5, relx=px, rely=0.15, anchor="nw")

    def place_card_buttons(self, nb_cards):
        for i in range(nb_cards):
            px = i * self.largeur_relative_widget(nb_cards, self.HIDDEN_CARD_WIDTH, self.HIDDEN_CARDS_AREA_WIDTH)
            self.card_color_buttons[i].place(x=55, relx=px, rely=0.95, anchor="se")
            self.card_value_buttons[i].place(x=55, relx=px, rely=0.95, anchor="sw")

    def largeur_relative_widget(self, nb_cards, dimension_x_widget, dimension_x_area):
        espace = dimension_x_widget / nb_cards
        largeur_effective_widget = dimension_x_widget + espace
        return largeur_effective_widget / dimension_x_area

# ================================= HANDLERS ==================================

    def handler_joue(self):
        if self.__robot_joue:
            self.__com.robot_joue()
        else:
            self.__com.joueur_joue()
    
    def handler_explique(self):
        if self.__com.get_nb_tries() > 0:                                                             
            self.__com.explique()
    
    def handler_click_back_card(self, i):
        pass

    def handler_card(self, color):
        pass

    def handler_new_game(self):
        pass

    def handler_exit(self):
        self.__com.exit()

    def quit(self):
        self.__root.destroy()

    # =============================== DISPLAY/HIDE ============================

    def display_message2(self, message):
        self._textRegleJeu.configure(text=message)
        self.update_view()

    def display_message(self, message):
        self._textLabel.configure(text=message)
        self.update_view()   

    def affiche_mode_emploi(self):
        pass

    def affiche_message_carte_devinee(self):
        p = self.__com.position_carte_courante()
        self.display_message("couleur carte " + str(p) + " devinee !")

    def display_cartes_cachees(self, cartes):   
        nb_couleurs = self.__com.nb_guess_suits()
        for carte in cartes:
            self.display_carte_cachee(carte)
        self.update_view()

    def display_carte_cachee_position(self, position_carte):
            # milieu ecran
        if self.__com.carte_devinee(position_carte):
            self.hiddenans[position_carte].configure(image=self.correct_card(position_carte)[0],
                                                     width=self.HIDDEN_CARD_WIDTH,
                                                     height=self.HIDDEN_CARD_HEIGHT)
        self.hiddenans[position_carte].configure(state=tk.DISABLED)

    def hide_played_cards(self):
        for position_carte in range(self.__com.nb_guess_suits()):
            if self.mid_labels[position_carte] != None:
                self.mid_labels[position_carte].place_forget()

    def affiche_carte(self, carte):
        mid_image = Path("../img/cards/" + carte.get_couleur() + "/" + str(carte.get_valeur()) + ".png")
        position = carte.get_position()
        self.mid_imgs[position] = ctk.CTkImage(light_image=Image.open(mid_image),
                                               size=(self.PLAYED_CARD_WIDTH, self.PLAYED_CARD_HEIGHT))
        mid_label = ctk.CTkLabel(self.played_cards_area,
                                 height=int(self.PLAYED_CARD_HEIGHT * 1.1),
                                 width=int(self.PLAYED_CARD_WIDTH * 1.1),
                                 text="",
                                 image=self.mid_imgs[position])
        self.mid_labels[position] = mid_label

        px = position * self.largeur_relative_widget(self.__com.nb_guess_cards(),
                                                     self.PLAYED_CARD_WIDTH,
                                                     self.PLAYED_CARDS_AREA_WIDTH)
        self.mid_labels[position].place(x=10, relx=px, rely=0.05, anchor="nw")
        self.update_view()

        # affiche la carte proposee par le joueur en position position_carte 
    def display_card(self, position_carte):
        mid_image = self.path_to_guess_card_image()
    
        self.mid_imgs[position_carte] = ctk.CTkImage(light_image=Image.open(mid_image),
                                                     size=(self.PLAYED_CARD_WIDTH, self.PLAYED_CARD_HEIGHT))
        mid_label = ctk.CTkLabel(self.played_cards_area,
                                 height=int(self.PLAYED_CARD_HEIGHT * 1.1),
                                 width=int(self.PLAYED_CARD_WIDTH * 1.1),
                                 text="",
                                 image=self.mid_imgs[position_carte])
        self.mid_labels[position_carte] = mid_label

        px = position_carte * self.largeur_relative_widget(self.__com.nb_guess_cards(),
                                                           self.PLAYED_CARD_WIDTH,
                                                           self.PLAYED_CARDS_AREA_WIDTH)
        self.mid_labels[position_carte].place(x=10, relx=px, rely=0.05, anchor="nw")
        self.update_view()

    def show_feedback(self, cartes, numero_coup):
        nombre_couleurs = self.__com.nb_guess_suits()
        numero_ligne = numero_coup * 3
        self.affiche_separateur_coup(numero_coup, numero_ligne)
        for carte in cartes:
            position_carte = carte.get_position()
            if not carte.carte_devinee() or carte.carte_venant_etre_devinee(numero_coup): 
                self.feedback_labels[position_carte].grid(column=position_carte, row=numero_ligne + 1, **self.GRID_DICT)
                self.feedback_labels_reponses[position_carte].grid(column=position_carte, row=numero_ligne + 2,
                                                                   **self.GRID_DICT)
            self.update_view()

    def affiche_separateur_coup(self, nombre_coups_joues, numero_ligne):
        separateur = '---' + str(nombre_coups_joues) + '---'
        separateur_coup = tk.Label(self.feedback_area, text=separateur)
        separateur_coup.grid(column=0, row=numero_ligne)

    def maj_feedback_position(self, carte):
        self.maj_feedback_carte_jouee(carte)
        self.maj_feedback_reponse_carte_jouee(carte)

    def maj_feedback_carte_jouee(self, carte):
        guess_suit = carte.get_couleur()
        guess_value = carte.get_valeur()
        position = carte.get_position()
        file_name = Path("../img/cards/" + guess_suit + "/" + str(guess_value) + ".png")
        image = Image.open(file_name)
        self.feedback_imgs[position] = image
        image = ctk.CTkImage(light_image=self.feedback_imgs[position],
                             size=(self.FEEDBACK_CARD_WIDTH, self.FEEDBACK_CARD_HEIGHT))
        button = ctk.CTkButton(self.feedback_area,
                               width=self.FEEDBACK_CARD_WIDTH,
                               height=self.FEEDBACK_CARD_HEIGHT,
                               text="", fg_color="transparent",
                               image=image,
                               state=DISABLED,
                               hover=False)
        self.feedback_labels[position] = button

    def maj_feedback_reponse_carte_jouee(self, carte):
        position = carte.get_position()
        file_image = self.get_file_image_feedback_reponse(carte)
        image = Image.open(file_image)
        self.feedback_imgs_reponses[position] = image
        image = ctk.CTkImage(light_image=self.feedback_imgs_reponses[position],
                             size=(self.FEEDBACK_CARD_WIDTH, self.FEEDBACK_CARD_HEIGHT))
        button = ctk.CTkButton(self.feedback_area,
                               width=self.FEEDBACK_CARD_WIDTH,
                               height=self.FEEDBACK_CARD_HEIGHT,
                               text="",
                               state=DISABLED,
                               fg_color="transparent", image=image, hover=False)
        self.feedback_labels_reponses[position] = button

    def get_file_image_feedback_reponse(self, carte):
        couleur = carte.get_couleur()
        valeur = carte.get_valeur()
        if carte.carte_devinee():
            path = Path(f"../img/cards/{couleur}/{valeur}.png")
        else:
            path = "../img/assets/back.png"
        return path

    # ================================= PATHS =================================

    def path_to_correct_card_image(self, i):
        return Path(self.correct_card_image_path(i))

    def correct_card_image_path(self, i):
        correct_suit = self.__com.correct_suit(i)
        return "../img/assets/card-frame-" + correct_suit + ".png"

    def path_to_guess_card_image(self):
        guess_suit = self.__com.current_guess_suit()
        return Path("../img/assets/card-frame-" + guess_suit + ".png")

    def path_to_little_card_image(self):
        guess_suit = self.__com.currrent_guess_suit()
        return Path("../img/cards/little/s" + guess_suit + "/10.png")

    # ============================ ACTIVE/DESACTIVE ===========================

    def inactive_back_card(self, i):
        self.hiddenans[i].configure(state=tk.DISABLED)

    def active_back_card(self, i):
        if not self.__com.carte_devinee_en_i(i):
            self.hiddenans[i].configure(state=tk.NORMAL)

    def inactive_back_cards(self):
        for button in self.hiddenans:
            button.configure(state=tk.DISABLED)

    def active_back_cards(self):
        i = 0
        for button in self.hiddenans:
            played_card = self.__com.is_played_card(i)
            guess_card = self.__com.carte_devinee(i)
            if not guess_card and not played_card:
                button.configure(state=tk.NORMAL)
            i += 1

    def inactive_new_game_button(self):
        self.new_game.configure(state=tk.DISABLED)

    def active_new_game_button(self):
        self.new_game.configure(state=tk.NORMAL)

    @staticmethod
    def color_button_from_position(position: int):
        match position:
            case 0:
                return 'blue'
            case 1:
                return 'green'
            case 2:
                return 'red'
            case 3:
                return 'yellow'

    @staticmethod
    def position_button_from_color(color: str):
        match color:
            case 'blue':
                return 0
            case 'green':
                return 1
            case 'red':
                return 2
            case 'yellow':
                return 3

    def button_color(color: str):
        match color:
            case 'blue':
                return ViewGuessColor.BLEU
            case 'green':
                return ViewGuessColor.VERT
            case 'red':
                return ViewGuessColor.ROUGE
            case 'yellow':
                return ViewGuessColor.JAUNE

    def inactive_colors_buttons(self):
        for button in self._colors_buttons:
            button.configure(state=tk.DISABLED)

    def active_colors_buttons(self):
        couleurs_cartes_devinees = self.__com.couleurs_cartes_devinees()
        i = 0
        for button in self._colors_buttons:
            couleur = self.color_button_from_position(i)
            if not couleur in couleurs_cartes_devinees:
                couleur_bouton = ViewGuessColor.button_color(couleur)
                button.configure(state=tk.NORMAL, fg_color=couleur_bouton)
            i += 1

    def inactive_color_button(self, color):
        position = self.position_button_from_color(color)
        self._colors_buttons[position].configure(state=tk.DISABLED, fg_color=ViewGuessColor.BACKGROUND_COLOR)

    def invisible_colors_area(self):
        self.colors_area.place_forget()

    def visible_colors_area(self):
        self.colors_area.place()

    def active_colors_area(self):
        self.colors_area.place(relx=self.COLORS_AREA_RELX, rely=self.COLORS_AREA_RELY, anchor="nw")

    # ============================= GESTION IMAGES ============================

    def correct_cards(self):
        return self.correct_cards

    def correct_card(self, i):
        return self.correct_cards[i]

    def set_correct_card(self, i, v):
        self.correct_cards[i] = v

    def add_correct_card(self, v):
        self.correct_cards.append(v)

    # =========================================================================
    def clear_mid_images(self):
        for i in range(self.__com.nb_guess_suits()):
            self.mid_imgs[i] = None

    def clear_mid_labels(self):
        for i in range(self.__com.nb_guess_suits()):
            self.mid_labels[i] = None

    def init_mid_images_labels(self):
        self.mid_labels = []  # cartes posees
        self.mid_imgs = []
        nb_guess_suits = self.__com.nb_guess_suits()

        for i in range(nb_guess_suits):
            self.mid_labels.append(None)
            self.mid_imgs.append(None)

    def active_view(self):
        self.window.mainloop()

    def update_view(self):
        self.window.update()

    def close_window(self):
        self.window.destroy()

        # open or bring child window to front
    def open_child(self, title, content, window_type):
        print("window_type = " + window_type)
        print("content = " + str(content))
        attr_name = f'PopUp_{title.lower().replace(" ", "_")}'
        
                       # Set window size and position
        PopUp_width = self.window.winfo_width() // 2
        PopUp_height = self.window.winfo_height() // 2
        
        if self.child_windows[window_type] is None or \
            not self.child_windows[window_type].winfo_exists():
                # Create new child window
                # Create a new PopUp window
            new_window = PopUpWindow(self.window, title, 0.25, 0.25, 0.5, 0.5)
                    # Store reference in both places for compatibility
                    # setattr(self, attr_name, child_window)
            new_window.geometry(f"{PopUp_width}x{PopUp_height}")
            new_window.set_window_size(self.window, rel_width=0.5, rel_height=0.5)
            new_window.position_window(self.window, rel_x=0.25, rel_y=0.25)

                    # Set it as topmost immediately
            new_window.attributes("-topmost", True)

                    # Add content
            params = {
                "width": PopUp_width,
                "height": PopUp_height,
                "content": content,
            }
            new_window.insert_window_textbox(**params)

                    # Add content to child window
            # label = tk.Label(new_window, text="This is a child window")
            # label.pack(pady=60)

            self.child_exists = True

                    # Add protocol to update status when child is closed
            def on_child_close():
                self.child_windows[window_type] = None
                new_window.destroy()

            new_window.protocol("WM_DELETE_WINDOW", on_child_close)

                    # Store reference to the new window
            self.child_windows[window_type] = new_window

        else:
                    # Window exists, bring it to front using multiple techniques
            window = self.child_windows[window_type]

                    # Use withdraw and deiconify to force window to front
            # window.withdraw()
            window.deiconify()

                     # Use several techniques for robust focus handling
            window.lift()
            window.focus_force()
      
                      # Add content
            params = {
                "width": PopUp_width,
                "height": PopUp_height,
                "content": content,
            }
            window.insert_window_textbox(**params)

# ============================ Classe PopUpWindow =============================

class PopUpWindow(tk.Toplevel):

    def __init__(self, parent, title, rel_x, rel_y, rel_width, rel_height):

        super().__init__(parent)

        self.parent = parent
        self.title(title)
        self.position_window(parent,rel_x,rel_y)
        self.set_window_size(parent,rel_width,rel_height)

            # Add content to the popup
        self.label = ctk.CTkLabel(self, text=title)
        self.label.pack(pady=20)

        self.close_button = ctk.CTkButton(self, text="Close", command=self.destroy)
        self.close_button.pack(pady=10)

    def set_window_size(self, parent, rel_width, rel_height):
        """
        Set the window's dimensions relative to the parent's using ratios.
        rel_width and rel_height are values between 0 and 1 representing 
        the relative position
        (0.3,0.4) = width is 30% of parent_width, height is 40% of parent_height
        """
        popup_width = int(parent.winfo_width() * rel_width)
        popup_height = int(parent.winfo_height() * rel_height)
        self.geometry(f"{popup_width}x{popup_height}")

    def get_toplevel(self):
        return self.parent

    def position_window(self, parent, rel_x, rel_y):
        """
        Position window relative to parent using relative coordinates.
        rel_x and rel_y are values between 0 and 1 representing the relative position
        (0,0) = top-left, (1,1) = bottom-right, (0.5,0.5) = center
        """
        # Get dimensions
        parent_width = parent.winfo_width()
        parent_height = parent.winfo_height()
        parent_x = parent.winfo_rootx()
        parent_y = parent.winfo_rooty()

        window_width = self.winfo_reqwidth()
        window_height = self.winfo_reqheight()

                    # Calculate relative position
        position_x = int(parent_x + (parent_width - window_width) * rel_x)
        position_y = int(parent_y + (parent_height - window_height) * rel_y)

        self.geometry(f"+{position_x}+{position_y}") # end of listing

    def insert_window_textbox(
            self, width, height, content,
            border_color="#000000", text_color="#000000",
            corner_radius=0
                             ):
            # Create a dictionary of parameters for the CTkTextbox
        textbox_params = {
            "master": self,
            "width": width,
            "height": height,
            "corner_radius": corner_radius,
            "border_color": border_color,
            "text_color": text_color
        }

        self.textbox = ctk.CTkTextbox(**textbox_params)
        self.textbox.insert("0.0", content)
        self.textbox.configure(state="disabled")  # textbox is read-only
        self.textbox.pack(padx=20,pady=20)

    def hide_window(self, event):
        self.withdraw()

# =============================== FIN LISTING ================================= 
