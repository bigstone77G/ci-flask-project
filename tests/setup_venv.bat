@echo off
echo --- Activation de l'environnement virtuel ---
call venv\Scripts\activate

echo --- Installation des dépendances ---
pip install -r requirements.txt

echo --- Terminé ---
pause
