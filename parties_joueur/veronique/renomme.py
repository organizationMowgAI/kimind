import os
import re

# Chemin du dossier contenant les fichiers
dossier = "."

# Changer le répertoire de travail au dossier spécifié
os.chdir(dossier)

# Expression régulière pour correspondre aux fichiers de la forme VVpartie_0 (1).json
pattern = re.compile(r'VVpartie_0 \((\d+)\)\.json')

# Itérer sur tous les fichiers dans le dossier
for fichier in os.listdir(dossier):
    match = pattern.match(fichier)
    if match:
            # Extraire le numéro
        numero = match.group(1)
            # Créer le nouveau nom de fichier
        nouveau_nom = f"_partie_{numero}.json"
            # Renommer le fichier
        os.rename(fichier, nouveau_nom)
        print(f"Renommage de {fichier} en {nouveau_nom}")
