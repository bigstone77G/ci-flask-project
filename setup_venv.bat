@echo off
echo --- Activation de l'environnement virtuel ---
call venv\Scripts\activate

echo --- Installation des dépendances ---
pip install flask pytest pytest-cov

echo --- Génération du fichier requirements.txt ---
pip freeze > requirements.txt

echo --- Terminé ---
pause
