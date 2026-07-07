#! /usr/bin/env python3

# ===================== CREE ET GERE UN CLIENT SERVEUR PYTHON =================

import os
import socket
import time
from requete import Requete

class ClientServeur:

    def __init__(self):
        self._stop = False
        self._connexion = None
        self._server_socket = None

    # ========================== CONNEXION/DECONNEXION ========================
    
    def ouvre_connexion(self, host="127.0.0.1", port=5000):
        print('(python) ouverture connexion')
        print('(python) host : ' + host)
        print('(python) port : ' + str(port))
        self._host = host
        self._port = port
        self.connecte()

    def connecte(self):
        self._stop = False
        self._connexion = None

        self._server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self._server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self._server_socket.bind((self._host, self._port))
        self._server_socket.listen(1)

        print("LISTEN sur", self._server_socket.getsockname(), flush=True)
        print("(python) attente de la demande de connexion", flush=True)
            # clé: timeout pour pouvoir sortir si on demande l'arrêt
        self._server_socket.settimeout(0.5)
        try:
            while not self._stop:
                try:
                    self._connexion, self._adresse = self._server_socket.accept()
                    print(f"(python) connexion acceptée depuis {self._adresse}", flush=True)
                    return
                except socket.timeout:
                    continue
        finally:
                # si on sort sans connexion, on ferme le socket serveur
            if self._connexion is None and self._server_socket is not None:
                try:
                    self._server_socket.close()
                except OSError:
                    pass
                self._server_socket = None

    def ferme_connexion(self):
            self._connexion.close()
            self._server_socket.close()
            time.sleep(1)

    # ======================== ENVOIE MESSAGES ================================

    def envoie_et_reponse(self, requete_json):
        self.envoie(requete_json)
        return self.lit()

    def envoie_et_reponse_brute(self, requete_json):
        self.envoie(requete_json)
        return self.lit(brute=True) 

    def envoie_et_reponse_json(self, requete_json):
        reponse = self.envoie_et_reponse(requete_json)
        reponse_json = Requete(reponse)
        return reponse_json.decompose_requete_json()

    def envoie(self, message):
        print('(python) message a envoyer : ' + str(message))
        message = message + '\n'
        with self._connexion.makefile(mode='rwb') as socket_file:
            socket_file.write(message.encode("utf-8"))
            socket_file.flush()

    # ======================== RECEPTION MESSAGES==============================

    def lit_requete(self):
        time.sleep(0.1)
        message = self.lit()
        return Requete(message)

    def lit_plusieurs_lignes(self):
        delimiter = '<<END>>\n'
        with self._connexion.makefile(mode='r', encoding='latin-1') as socket_file:
            lines = []
            while True:
                line = socket_file.readline()
                if line == delimiter or not line:
                    break                           # pas beau
                lines.append(line)
        message = ''.join(lines)
        return message

    def lit(self, brute=False):
        with self._connexion.makefile(mode='r') as socket_file:
            message = socket_file.readline()
            print("message lu = " + message)
            if not brute:
                message = ClientServeur.retirer_retour_ligne(message)
            print('python:message reçu :' + message + 'xxx')
        return message

    def lit_requete_json(self):
        with self._connexion.makefile(mode='r', encoding='latin-1') as socket_file:
            message = socket_file.readline()
            print("(python) message lu = " + message)
            message = ClientServeur.retirer_retour_ligne(message)
            print('(python) message reçu :' + message + 'xxx')
        return message

    @classmethod
    def retirer_retour_ligne(cls, texte):
        texte_sans_retour = texte.replace('\r\n', '').replace('\n', '').replace('\r', '')
        return texte_sans_retour

# =========================== FIN LISTING =====================================
