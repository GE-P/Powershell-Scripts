
#-------------------------------------

#Script de création de groupes utilisateurs d'un Active Directory
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

Clear-Host

Write-Host "
            //////////////////////////////////////////////////////////////////////
           // Script de création de groupes utilisateurs d'un Active Directory //
          //////////////////////////////////////////////////////////////////////
         // Codeur Gerhard Eibl 'GE-P'////////////// https://github.com/GE-P //
        //////////////////////////////////////////////////////////////////////

          "

Do{

$confirmation01 = Read-Host "Souhaitez vous creer un dossier de rangement des groupes"

if ($confirmation01 -eq 'y') {

$dossier = Read-Host "Veuillez indiquer le nom de dossier à créer"

$uo1 = Read-Host "Veuillez indiquer le dossier racine de votre AD"

New-ADOrganizationalUnit -Name $dossier -Path ("OU=$uo1, DC=ACME, DC=org")

} else {}

$confirmation02 = Read-Host "Souhaitez vous créer un groupe ?"

if ($confirmation02 -eq 'y') {

$groupe = Read-Host "Veuillez rentrer le nom du groupe à créer"

$uo1 = Read-Host "Veuillez indiquer le dossier racine de votre AD"

$dossier = Read-Host "Veuillez indiquer le dossier dans lequel il sera rangé"

$Scope = Read-Host "Le groupe est t-il Global ou Local ?"

New-ADGroup $groupe -GroupScope $Scope -Path "OU=$dossier, OU=$uo1, DC=ACME, DC=org"

} else {}

$confirmation03 = Read-Host "Souhaitez vous ajouter des membres dans un groupe ?"

if ($confirmation03 -eq 'y') {

$groupe = Read-Host "Veuillez renseigner le nom du groupe"

[int] $nombre = Read-Host "Veuillez rentrer le nombre d'utilisateurs à insérer dans le groupe"

for ($i=1; $i -le $nombre; $i++)
{

$login = Read-Host "Veuillez rentrer le login de l'utilisateur à insérer dans le groupe $groupe"

Add-ADGroupMember -identity $groupe -Members $login

Write-Host "L'utilisateur $login a bien été inséré dans le groupe $groupe"
}} else {}




$confirmation04 = Read-Host "Souhaitez vous continuer ?"

} Until($confirmation04 -eq 'n')
