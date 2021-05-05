Do {

$confirmation1 = Read-Host "Souhaitez vous créer un utilisateur ?"

if ($confirmation1 -eq 'y') {

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


New-Item "C:\Partage\$login" -ItemType Directory

New-SmbShare -Name "$login$" -Path C:\Partage\$login -FullAccess "Administrateur",$login -FolderEnumerationMode AccessBased

} else {}

$confirmation2 = Read-Host "Souhaitez vous recommencer ?"

}until($confirmation2 -eq 'n')
