$file_groups=Import-Csv -Path Departamentos.csv
foreach($group in $file_groups){
	New-LocalGroup -Name $group.departamento -Description $group.descripcion
}