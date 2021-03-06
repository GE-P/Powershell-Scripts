
#-------------------------------------

#Script de listage de GPO d'un Active Directory et export en fichier texte
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

$Confirmation1 = Read-Host "Souhaitez vous lister les GPO de votre domaine ?"

if ($Confirmation1 -eq 'y') {

$domain = Read-Host "Veuillez indiquer votre nom de domaine"

Get-GPO -Domain $domain -All 

}

$Confirmation2 = Read-Host "Souhaitez vous sauvegarder ces GPO ?"

if ($Confirmation2 -eq 'y') {

$path = Read-Host "Veuillez indiquer le chemin du dossier de sauvegarde"
$domain = Read-Host "Veuillez indiquer votre nom de domaine"

Get-GPO -Domain $domain -All | Backup-GPO -Path "$path"
}
