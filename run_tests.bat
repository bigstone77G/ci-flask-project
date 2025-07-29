@echo off 
echo --- Activation de l'environnement virtuel --- 
call venv\Scripts\activate 
echo --- Lancement des tests avec couverture --- 
pytest --cov=app --cov-report=xml tests/test_main.py -v 
echo --- Termin‚ --- 
pause 
