
#-------------------------------------

#Script de listage des groupes d'un Active Directory et export en fichier texte
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

$Confirmation1 = Read-Host "Souhaitez vous lister les Groupes de votre AD ?"

if ($Confirmation1 -eq 'y') {

$groups = Get-ADGroup -Filter * -SearchBase "OU=PARIS,DC=ACME,DC=org"

foreach($u in $groups) {echo $u.name}

}

$Confirmation2 = Read-Host "Souhaitez vous exporter la liste en fichier texte ?"

if ($Confirmation2 -eq 'y') {

$groups = Get-ADGroup -Filter * -SearchBase "OU=PARIS,DC=ACME,DC=org" 




    Add-Content -Path "Groupes.txt" -Value $groups



}else{}
