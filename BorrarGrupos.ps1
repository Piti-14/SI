$depts=Import-Csv -Path C:\Users\laran\Desktop\DAW\Descargas\Scripts_GestorDocumental-SI\Departamentos.csv
foreach($group in $depts)
{
	Remove-LocalGroup $group.departamento
}