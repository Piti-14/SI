$usuarios=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Usuarios.csv
foreach($user in $usuarios)
{
	Remove-LocalUser $user.cuenta
}