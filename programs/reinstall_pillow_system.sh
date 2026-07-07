#!/bin/bash

echo "=== Suppression manuelle de Pillow installé dans le système ==="

sudo rm -rf /usr/lib/python3/dist-packages/PIL
sudo rm -rf /usr/lib/python3/dist-packages/pillow-*.egg-info

echo "✓ Dossiers Pillow supprimés."

echo "=== Vérification de la suppression ==="
python3 -c "from PIL import Image" 2>/dev/null && echo "⚠️ Pillow est encore là !" || echo "✓ Pillow supprimé avec succès."

echo "=== Installation des dépendances système nécessaires ==="
sudo apt install -y python3-tk tk-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev

echo "=== Réinstallation de Pillow via pip (avec --break-system-packages) ==="
pip install pillow --break-system-packages

echo "=== Test final de l'import de Pillow + ImageTk ==="
python3 -c "from PIL import Image, ImageTk; print('✅ Pillow avec ImageTk est installé et fonctionnel !')" || echo "❌ Problème avec ImageTk"
