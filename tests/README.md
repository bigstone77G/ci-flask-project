\# CI avec Jenkins et SonarQube – Flask



\## Fonctionnement



Application Flask simple avec une route `/` retournant "Hello DevOps".



\## Pipeline CI



Le pipeline Jenkins effectue :

\- Clonage GitHub

\- Installation des dépendances

\- Exécution des tests Pytest

\- Analyse SonarQube

\- Affichage de "CI terminée avec succès"



\## Déclenchement



\- Webhook GitHub déclenche Jenkins à chaque push



\## Outils



\- Flask

\- Pytest

\- Jenkins

\- SonarQube

\- GitHub



