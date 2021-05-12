#-------------------------------------

#Script de listage des membres d'un groupe d'un Active Directory
#Version 0.3 (v0.1 avec export en .csv, v0.2 avec export en fichier texte, sans vérifications d'erreurs ni message de bon déroulement et sans boucle)
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

Clear-Host

Write-Host "
            /////////////////////////////////////////////////////////////////////
           // Script de listage des membres d'un groupe d'un Active Directory //
          /////////////////////////////////////////////////////////////////////
         ////// Codeur Gerhard Eibl 'GE-P'///// https://github.com/GE-P //////
        /////////////////////////////////////////////////////////////////////

          "

#Ouverture de la boucle.

Do {

#Essai de la commande.

try {



#Variable pour connaitre quel groupe nous cherchons.

$groupname = Read-Host "Veuillez renseigner le nom du groupe dont vous voulez connaitre les utilisateurs"

#Commande pour chercher le groupe + récupération d'erreurs [ErrObj1] si existantes.

Get-ADGroupMember $Groupname 

}

#Si l'essai n'est pas concluant, on demande de faire une commande après le catch.

catch 

{

#Commande pour écrire un message d'erreur si l'essai n'est pas concluant.

Write-Host "Le groupe spécifié n'existe pas, vérifiez la syntaxe et recommencez"

}



#Condition, à remplir si erreur = 0.

if($Error.count -ieq 0){

#Confirmation d'export si erreur = 0.

$Confirmation = Read-Host "Souhaitez vous exporter la liste oui [y] non [n] ?"

}

#Condition à remplir si confirmation = oui

if ($Confirmation -eq 'y') {

#Variable avec commande de recherche du groupe.

$user = Get-ADGroupMember $Groupname 

#Methode pour écrire uniquement le nom dans le fichier texte.

foreach($u in $user) {

    $nom = $u.name
    
   
#Commande pour créer le fichier texte dans le dossier d'execution du script.

    Add-Content -Path "$Groupname.txt" -Value $nom

    }

#Condition, à remplir si erreur = 0.

if($Error.count -ieq 0){

#Message à afficher si erreur = 0.
    
Write-Host "

La liste a bien été exportée

"
}
    
} else {}


#Confirmation pour continuer yes/no la boucle.

$Confirmation2 = Read-Host "Souhaitez vous recommencer oui [y] non [n] ?"

#Fermeture de boucle.

}until($confirmation2 -eq 'n')
    
