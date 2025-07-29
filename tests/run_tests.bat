@echo off
echo --- Activation de l'environnement virtuel ---
call venv\Scripts\activate

echo --- Lancement des tests avec couverture ---
pytest --cov=app tests/

pause