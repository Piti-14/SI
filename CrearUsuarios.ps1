$file_users=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\UsuarioPrueba.csv
foreach ($user in $file_users){
	$clave=ConvertTo-SecureString $user.password -AsPlainText -Force
	New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
	Add-LocalGroupMember -Group usuarios -Member $user.cuenta
    Add-LocalGroupMember -Group $user.departamento -Member $user.cuenta
    Add-LocalGroupMember -Group $user.deptSecundario -Member $user.cuenta
	
	net user $user.cuenta /logonpasswordchg:yes
    
    net user $user.cuenta /times:"$($user.diasAcceso),$($user.inicioAcceso)-$($user.finAcceso)"
}

