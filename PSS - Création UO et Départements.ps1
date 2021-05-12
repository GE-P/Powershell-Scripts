  
#-------------------------------------

#Script de création d'unités d'organisations d'un Active Directory
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

Clear-Host

Write-Host "
            ///////////////////////////////////////////////////////////////////////
           // Script de création d'unités d'organisations d'un Active Directory //
          ///////////////////////////////////////////////////////////////////////
         // Codeur Gerhard Eibl 'GE-P'/////////////// https://github.com/GE-P //
        ///////////////////////////////////////////////////////////////////////

          "

Do{

$Confirmation01 = Read-Host "Souhaitez vous créer une UO de départ ?"

if ($Confirmation01 -eq 'y') {

$uo1 = Read-Host "veuillez renseigner la première unité d'organisation de votre AD"

New-ADOrganizationalUnit -Name $uo1 -Path ("DC=ACME, DC=org")

} else {}

$Confirmation02 = Read-Host "Souhaitez vous créer une UO département ?"

if ($Confirmation02 -eq 'y') {

    $ado = Read-Host "Veuillez renseigner le departement que vous souhaitez créer"

    $uo1 = Read-Host "veuillez renseigner la première unité d'organisation de votre AD"


New-ADOrganizationalUnit -Name $ado -Path ("OU=$uo1, DC=ACME, DC=org")
} else {}

$confirmation03 = Read-Host "Souhaitez vous continuer [Y] [N] ?"

}Until($confirmation03 -eq 'n')
