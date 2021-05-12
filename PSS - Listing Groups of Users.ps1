#-------------------------------------

#Script de listage des groupes dont fait partie un utilisateur d'un Active Directory
#Version 0.2 (v0.1 avec recherche dans les dossiers en demandant les UO, pas propre et long et sans commentaires, v0.2 sans vérifications d'erreurs ni message de bon déroulement et sans boucle)
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

Clear-Host

Write-Host "
            //////////////////////////////////////////////////////////////////////////
           // Script de listage des groupes d'un utilisateur d'un Active Directory //
          //////////////////////////////////////////////////////////////////////////
         //////// Codeur Gerhard Eibl 'GE-P'////// https://github.com/GE-P ////////
        //////////////////////////////////////////////////////////////////////////

          "

#Ouverture de la boucle.

Do {

#Essai de la commande.

try {



#Variable pour connaitre le nom de l'utilisateur.

$Identifiant = Read-Host "Veuillez renseigner le nom de l'utilisateur"

#Commande pour chercher l'utilisateur et les membres dont il fait partie.

$user = Get-ADUser -Identity $Identifiant -Properties Memberof

foreach($u in $user) {echo $u.memberof}

}

#Si l'essai n'est pas concluant, on demande de faire une commande après le catch.

catch

{

#Commande pour écrire un message d'erreur si l'essai n'est pas concluant.

Write-Host "L'utilisateur spécifié n'existe pas, vérifiez la syntaxe et recommencez"

}



#Condition, à remplir si erreur = 0.

if($Error.count -ieq 0){

#Confirmation d'export si erreur = 0.

$Confirmation = Read-Host "Souhaitez vous exporter la liste oui [y] non [n] ?"

}

#Condition à remplir si confirmation = oui

if ($Confirmation -eq 'y') {

#Variable avec la commande de recherche d'utilisateur.

$User = Get-ADUser -Identity $Identifiant -Properties Memberof

#Méthode pour ecrire uniquement le nom et le/les groupe/s de l'utilisateur dans le fichier texte.

foreach($u in $user) {

    $nom = $u.name
    
    $membre = $u.memberof

#Commandes pour créer le fichier texte dans le dossier d'execution du script.

    Add-Content -Path "$Identifiant.txt" -Value $nom

    Add-Content -Path "$Identifiant.txt" -Value $membre
    
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





