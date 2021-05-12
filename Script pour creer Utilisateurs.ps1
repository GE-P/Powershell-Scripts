#-------------------------------------

#Script de création d'utilisateurs d'un Active Directory
#Version 0.3 (v0.1 avec uniquement le nom et login, sans boucle et sans conditions, v0.2 sans vérifications d'erreurs ni message de bon déroulement)
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

Clear-Host

Write-Host "
            ////////////////////////////////////////////////////////////
           // Script de création d'utilisateur d'un Active Directory //
          ////////////////////////////////////////////////////////////
         // Codeur Gerhard Eibl 'GE-P'//// https://github.com/GE-P //
        ////////////////////////////////////////////////////////////

          "

#Ouverture de la boucle.

Do {

#Confirmation yes/no pour créer un Utilisateur.

$confirmation1 = Read-Host "Souhaitez vous créer un utilisateur oui [y] non [n] ?"

#Condition.

if ($confirmation1 -eq 'y') {



#Variables pour la commande New-ADUser.

$nom = Read-Host "Veuillez renseigner le nom de l'utilisateur"

$prenom = Read-Host "Veuillez renseigner le prénom de l'utilisateur"

$login = Read-Host "Veuillez rentrer le login de l'utilisateur à créer"

$tel = Read-Host "Veuillez renseigner le tel fixe de l'utilisateur"

$tel2 = Read-Host "Veuillez renseigner le tel mobile de l'utilisateur"

$fonction = Read-Host "Veuillez renseigner la fonction de l'utilisateur"

$site = Read-Host "Veuillez renseigner la ville (site d'execution des fonctions/UO principale)"

$departement = Read-Host "Veuillez renseigner le departement de l'utilisateur"

$mdp = Read-Host "Veuillez rentrer le mot de passe de l'utilisateur à créer"

$mail = ($login + "@acme.fr")

$nomcomplet = ($nom + " " + $prenom)

#Essai de la commande.

try{

#Commande de création de l'utilisateur.

New-ADUser -Name $nomcomplet `
           -GivenName $nom `
           -Surname $prenom `
           -Title $fonction `
           -Department $departement `
           -EmailAddress $mail `
           -OfficePhone $tel `
           -MobilePhone $tel2 `
           -SamAccountName $login `
           -UserPrincipalName $login@ACME.fr `
           -AccountPassword (ConvertTo-SecureString -AsPlainText $mdp -Force) `
           -PasswordNeverExpires $false `
           -CannotChangePassword $false `
           -ChangePasswordAtLogon $true `
           -Enabled $true `
           -HomeDrive "S:" `
           -HomeDirectory "\\SRV-AD-01\$login$" `
           -Path ("OU=$departement, OU=$site, DC=ACME, DC=org") `
           
}

#Si l'essai n'est pas concluant, on demande de faire une commande après le catch.

catch

{

#Commande pour écrire un message d'erreur si l'essai n'est pas concluant.

Write-Host "L'utilisateur ne peut pas être créé, vérifiez la bonne syntaxe des dossiers [ville] et [departement]" 

}

#On efface les erreurs du Host.
  
$Error.clear()

#Commande pour créer un dossier lecteur de l'utilisateur + récupération d'erreurs [ErrObj1] si existantes.

New-Item "C:\Partage\$login" -ItemType Directory -ErrorVariable ErrObj1 -ErrorAction SilentlyContinue

#Commande pour créer le partage du lecteur à l'utilisateur et l'administrateur + récupération d'erreurs [ErrObj2] si existantes.

New-SmbShare -Name "$login$" -Path C:\Partage\$login -FullAccess "Administrateur",$login -FolderEnumerationMode AccessBased -ErrorVariable ErrObj2 -ErrorAction SilentlyContinue

#Condition à remplir si erreur = 0.

if ($Error.Count -ieq 0){

#Message à afficher si erreur = 0.

Write-Host "

La création de l'utilisateur s'est bien déroulée

"

}else{

#Messages d'erreurs à afficher [ErrObj1] [ErrObj2] si erreurs.

Write-Host $ErrObj1[0]
Write-Host $ErrObj2[0]

}

} else {}

#Confirmation pour continuer yes/no la boucle.

$confirmation2 = Read-Host "Souhaitez vous recommencer oui [y] non [n] ?"

#Fermeture de boucle.

}until($confirmation2 -eq 'n')


