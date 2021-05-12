
Clear-Host

Write-Host "
            ///////////////////////////////////////////////////////////////////
           // Script de création de dossiers partagés d'un Active Directory //
          ///////////////////////////////////////////////////////////////////
         // Codeur Gerhard Eibl 'GE-P'/////////// https://github.com/GE-P //
        ///////////////////////////////////////////////////////////////////

          "

Do{

$confirmation = Read-Host "Souhaitez vous creer un lecteur pour les departements ?"

if ($confirmation -eq 'y'){

$Dossier1 = Read-Host "Veuillez renseigner un nom au lecteur commun du département"

New-Item "C:\Partage\$Dossier1" -ItemType Directory

$Groupe = Read-Host "Veuillez renseigner le nom du groupe [Global] à qui donner les droits de partage"

New-SmbShare -Name $Dossier1 -Path C:\Partage\$Dossier1 -FullAccess "Administrateur",$Groupe -FolderEnumerationMode AccessBased
} else {}

$confirmation2 = Read-Host "Souhaitez vous lier un lecteur à un utilisateur ? [Y] [N]"

if ($confirmation2 -eq 'y'){

$Dossier2 = Read-Host "Veuillez renseigner le nom du lecteur du département"

[int] $nombre = Read-Host "Veuillez rentrer le nombre d'utilisateurs à qui donner les accès"

for ($i=1; $i -le $nombre; $i++)
{

$login = Read-Host "Veuillez rentrer le login de l'utilisateur"


$bat_user = "share_$login.bat"
$path_bat = "\\SRV-AD-01\netlogon\share_$login.bat"
$value_1 = "net use H: \\SRV-AD-01\$Dossier2"

Add-Content -Path $path_bat -Value $value_1
Set-ADUser $login -ScriptPath $bat_user
}

}else{}

$confirmation1 = Read-Host "Souhaitez vous recommencer ? [Y] [N]"

}Until($confirmation1 -eq 'n')
