#Script de sauvegarde des dossiers utilisateurs 
#Version 0.3 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P
#V0.1 Copy-Item
#v0.2 Xcopy
#V0.3 Robocopy, version finale retenue

#-------------------------------------

#Commande de copie des fichiers de l'ordinateur client vers le serveur.


Robocopy \\PC-CLIENT01-W10\c$\Users \\SRV-AD-01\SAV\dossier *.* /XD "AppData" "ADMIN" "All Users" "Default" "Default User" "Administrateur" "Public" "Recent" "Contacts" "Local Settings" "Saved Games" "3D Objects" "Menu Démarrer" "SendTo" "Favorites" "Searches" "Application Data" "Mes vidéos" "Videos" "Documents" "Menu Démarrer" "OneDrive" "Links" "Mes images" "Mes vidéos" "Videos" "Ma musique" "Music" /s 






