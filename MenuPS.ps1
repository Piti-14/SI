function crearUsersyGroups
{
    #$usuarios=C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Usuarios.csv
    #$departamentos=C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Departamentos.csv
    
    $file_groups=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Departamentos.csv
    foreach($group in $file_groups){
	    New-LocalGroup -Name $group.departamento -Description $group.descripcion
    }

    $file_users=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Usuarios.csv
    foreach ($user in $file_users){
	    $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
	    New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
	    Add-LocalGroupMember -Group usuarios -Member $user.cuenta
        Add-LocalGroupMember -Group $user.departamento -Member $user.cuenta
        Add-LocalGroupMember -Group $user.deptSecundario -Member $user.cuenta
	
	    net user $user.cuenta /logonpasswordchg:yes
    
        net user $user.cuenta /times:"$($user.diasAcceso),$($user.inicioAcceso)-$($user.finAcceso)"

        REG ADD	"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.cuenta /T REG_DWORD /D 0
    }
}

function crearEstructuraGestor
{
    mkdir C:\Publico\ESO\1ESO
    mkdir C:\Publico\ESO\2ESO
    mkdir C:\Publico\ESO\3ESO
    mkdir C:\Publico\ESO\4ESO
    mkdir C:\Publico\BACH\1BACH
    mkdir C:\Publico\BACH\2BACH
    mkdir C:\Publico\DAM

    #Establecemos el comportamiento de la herencia, para cada carpeta#

    'icacls "C:\Publico" /inheritance:d /T' | cmd
    'icacls "C:\Publico" /remove:g Usuarios' | cmd
    'icacls "C:\Publico" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\ESO" /inheritance:d /T' | cmd
    'icacls "C:\Publico\ESO" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\ESO" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\ESO\1ESO" /inheritance:d /T' | cmd
    'icacls "C:\Publico\ESO\1ESO" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\ESO\1ESO" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\ESO\2ESO" /inheritance:d /T' | cmd
    'icacls "C:\Publico\ESO\2ESO" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\ESO\2ESO" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\ESO\3ESO" /inheritance:d /T' | cmd
    'icacls "C:\Publico\ESO\3ESO" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\ESO\3ESO" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\ESO\4ESO" /inheritance:d /T' | cmd
    'icacls "C:\Publico\ESO\4ESO" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\ESO\4ESO" /remove:g "Usuarios autentificados"' | cmd

    'icacls "C:\Publico\BACH" /inheritance:d /T' | cmd
    'icacls "C:\Publico\BACH" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\BACH" /remove:g "Usuarios autentificados"' | cmd
    
    'icacls "C:\Publico\BACH\1BACH" /remove:g "Usuarios autentificados"' | cmd
    'icacls "C:\Publico\BACH\1BACH" /inheritance:d /T' | cmd
    'icacls "C:\Publico\BACH\1BACH" /remove:g Usuarios' | cmd
    
    'icacls "C:\Publico\BACH\2BACH" /remove:g "Usuarios autentificados"' | cmd
    'icacls "C:\Publico\BACH\2BACH" /inheritance:d /T' | cmd
    'icacls "C:\Publico\BACH\2BACH" /remove:g Usuarios' | cmd

    'icacls "C:\Publico\DAM" /inheritance:d /T' | cmd
    'icacls "C:\Publico\DAM" /remove:g Usuarios' | cmd
    'icacls "C:\Publico\DAM" /remove:g "Usuarios autentificados"' | cmd
    
    #Ahora se establecen los permisos de cada grupo#

    'icacls "C:\Publico" /grant Lectura_ESO:(OI)(RX)' | cmd
    'icacls "C:\Publico" /grant Lectura_BACH:(OI)(RX)' | cmd
    'icacls "C:\Publico" /grant DAM:(OI)(CI)(M)' | cmd
    
    'icacls "C:\Publico\ESO" /grant Lectura_ESO:(OI)(RX)' | cmd
    
    'icacls "C:\Publico\ESO\1ESO" /grant Lectura_ESO:(OI)(RX)' | cmd
    'icacls "C:\Publico\ESO\2ESO" /grant Lectura_ESO:(OI)(RX)' | cmd
    'icacls "C:\Publico\ESO\3ESO" /grant Lectura_ESO:(OI)(RX)' | cmd
    'icacls "C:\Publico\ESO\4ESO" /grant Lectura_ESO:(OI)(RX)' | cmd

    'icacls "C:\Publico\ESO\1ESO" /grant 1ESO:(OI)(CI)(M)' | cmd
    'icacls "C:\Publico\ESO\2ESO" /grant 2ESO:(OI)(CI)(M)' | cmd
    'icacls "C:\Publico\ESO\3ESO" /grant 3ESO:(OI)(CI)(M)' | cmd
    'icacls "C:\Publico\ESO\4ESO" /grant 4ESO:(OI)(CI)(M)' | cmd
    
    'icacls "C:\Publico\BACH" /grant Lectura_BACH:(OI)(CI)(RX)' | cmd
    
    'icacls "C:\Publico\BACH\1BACH" /grant Lectura_BACH:(OI)(CI)(RX)' | cmd
    'icacls "C:\Publico\BACH\2BACH" /grant Lectura_BACH:(OI)(CI)(RX)' | cmd
    
    'icacls "C:\Publico\BACH\1BACH" /grant 1BACH:(OI)(CI)(M)' | cmd
    'icacls "C:\Publico\BACH\2BACH" /grant 2BACH:(OI)(CI)(M)' | cmd

    'icacls "C:\Publico\DAM" /grant DAM:(OI)(CI)(M)' | cmd    
    
}

#----------------Funcion Submenu  -------------#
#function mostrar_Submenu
#{
#     param (
#           [string]$Titulo = 'Submenu.....'
#     )
#     Clear-Host 
#     Write-Host "================ $Titulo ================"
#    
#     Write-Host "1: Opción 1."
#     Write-Host "2: Opción 2."
#     Write-Host "s: Volver al menu principal."
#do
#{
#     $input = Read-Host "Por favor, pulse una opción"
#     switch ($input)
#     {
#           '1' {
#                'Opcion 1'
#                return
#           } '2' {
#                'Opcion 2'
#                return
#           } 
#     }
#}
#until ($input -eq 'q')
#}

function borrarGestor
{
    #$archivoUsuarios=C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Usuarios.csv
    $usuarios=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Usuarios.csv
    foreach($user in $usuarios)
    {
	    Remove-LocalUser $user.cuenta
    }
    
    #$archivoDepartamentos=C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Departamentos.csv
    $departamentos=Import-CSV -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Departamentos.csv
    foreach($group in $departamentos)
    {
        Remove-LocalGroup $group.departamento
    }

    Remove-Item -Path C:\Publico -Recurse -Force
}

#Función que nos muestra un menú por pantalla con 3 opciones, donde una de ellas es para acceder
# a un submenú y una última para salir del mismo.

function mostrarMenu 
{ 
     param ( 
           [string]$Titulo = "Bienvenido/a:  $($env:USERNAME)"
     ) 
     Clear-Host 
     Write-Host "================ $Titulo ================" 
      
     
     Write-Host "1. Crear grupos y usuarios" 
     Write-Host "2. Crear estructura de carpetas" 
     Write-Host "3. Borrado del Gestor" 
     Write-Host "Salir. Presiona 's' para salir" 
}
do 
{ 
     mostrarMenu 
     $input = Read-Host "Elegir una Opción" 
     switch ($input) 
     { 
           '1' { 
                Clear-Host  
                crearUsersyGroups 
                pause
           } '2' { 
                Clear-Host  
                crearEstructuraGestor 
                pause
           } '3' {
                Clear-Host  
                borrarGestor
                pause      
           } 's' {
                'Saliendo del script...'
                return 
           }  
     } 
     pause 
} 
until ($input -eq 's')