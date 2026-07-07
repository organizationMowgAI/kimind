from tkinter import *
import tkinter as tk

from customtkinter import *
import customtkinter as ctk

from pathlib import Path
from PIL import Image

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
        rel_width and rel_height are values between 0 and 1 representing the relative position
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

        # Calculate position based on relative coordinates
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

# ================================== FIN LISTING ==============================
