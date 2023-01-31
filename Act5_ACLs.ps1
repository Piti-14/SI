New-LocalGroup grupo01
New-LocalGroup grupo02
New-LocalGroup grupo03

New-LocalUser -FullName J.Cuantico -Password passuser01 -Description Gestor de Proyecto
New-LocalUser -FullName R.Nvidia -Password passuser02 -Description Analista de BD
New-LocalUser -FullName L.Puerta Logica -Password passuser03 -Description Programador Web

Add-LocalGroupMember -Group grupo01 -Member J.Cuantico
Add-LocalGroupMember -Group grupo02 -Member R.Nvidia
Add-LocalGroupMember -Group grupo03 -Member L.Puerta Logica

------------------------------------------------------------

mkdir -p C:\user02\home\{dir01\{dir03}, dir02}
write "" > C:\user02home\dir01\fich01

write "" > C:\user02home\fich02

icacls C:\user02home\dir01 /grant usu01:(OI)(CI)F /T

icacls C:\user02home\dir01\fich01 /grant usu03:(OI)(CI)F /T

icacls C:\user02home\fich02 /grant usu01:(OI)(CI)F /T

icacls C:\user02home\dir02 /grant usu01:(OI)(CI)F /T
