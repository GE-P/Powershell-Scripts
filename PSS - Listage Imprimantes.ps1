
#-------------------------------------

#Script de listage des imprimantes d'un Active Directory
#Version 0.1 
#Codeur Gerhard Eibl "GE-P"
#https://github.com/GE-P

#-------------------------------------

$Confirmation1 = Read-Host "Souhaitez vous lister les Imprimantes ?"

if ($Confirmation1 -eq 'y') {

$Printer = Get-Printer 

foreach($u in $Printer) {echo ----------,'Name:'$u.Name,'Type:'$u.Type,'DriverName:'$u.DriverName,'PortName:'$u.PortName,'Shared:'$u.Shared,'Published:'$u.Published,'DeviceType:'$u.DeviceType}

}

$Confirmation2 = Read-Host "Souhaitez vous exporter la liste en fichier texte ?"

if ($Confirmation2 -eq 'y') {

$Printer = Get-Printer 


foreach($u in $Printer) {

    $nom = $u.name
    $type = $u.Type
    $driver = $u.DriverName
    $port = $u.PortName
    $share = $u.Shared
    $publish = $u.Published
    $device = $u.DeviceType

    Add-Content -Path "Imprimantes.txt" -Value ----------
    Add-Content -Path "Imprimantes.txt" -Value Name:
    Add-Content -Path "Imprimantes.txt" -Value $nom
    Add-Content -Path "Imprimantes.txt" -Value Type:
    Add-Content -Path "Imprimantes.txt" -Value $type
    Add-Content -Path "Imprimantes.txt" -Value DriverName:
    Add-Content -Path "Imprimantes.txt" -Value $driver
    Add-Content -Path "Imprimantes.txt" -Value PortName:
    Add-Content -Path "Imprimantes.txt" -Value $port
    Add-Content -Path "Imprimantes.txt" -Value Shared:
    Add-Content -Path "Imprimantes.txt" -Value $share
    Add-Content -Path "Imprimantes.txt" -Value Published:
    Add-Content -Path "Imprimantes.txt" -Value $publish
    Add-Content -Path "Imprimantes.txt" -Value DeviceType:
    Add-Content -Path "Imprimantes.txt" -Value $device

}

}else{}
