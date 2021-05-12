
$Confirmation1 = Read-Host "Souhaitez vous lister les Utilisateurs de votre AD ?"

if ($Confirmation1 -eq 'y') {

$user = Get-ADUser -Filter * -SearchBase "OU=PARIS,DC=ACME,DC=org" 
foreach($u in $user) {echo $u.name}

}

$Confirmation2 = Read-Host "Souhaitez vous l'exporter en fichier texte ?"

if ($Confirmation2 -eq 'y') {

$user = Get-ADUser -Filter * -SearchBase "OU=PARIS,DC=ACME,DC=org" 




    Add-Content -Path "Utilisateurs.txt" -Value $user



}else{}
