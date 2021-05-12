#-------------------------------------

#Script pour lister les dossiers partagés d'un Active Directory et en exporter un fichier texte
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------


$Confirmation1 = Read-Host "Souhaitez vous lister les dossiers partagés ?"

if ($Confirmation1 -eq 'y') {

$Dossier = Get-SmbShare

foreach($u in $Dossier) {echo ----------,$u.name,$u.path}

}

$Confirmation2 = Read-Host "Souhaitez vous l'exporter en fichier texte ?"

if ($Confirmation2 -eq 'y') {

$Dossier = Get-SmbShare 


foreach($u in $Dossier) {

    $nom = $u.name
    $path = $u.path

    Add-Content -Path "Dossiers.txt" -Value ----------
    Add-Content -Path "Dossiers.txt" -Value $nom
    Add-Content -Path "Dossiers.txt" -Value $path

}

}else{}
