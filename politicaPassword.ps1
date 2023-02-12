#Parametros básicos para nuestras contraseñas: 
#Longitud de 10 caracteres, 
#cambio de contraseña preestablecida entre 2 y 30 días, //posteriormente se fuerza su cambio al inicio
#bloqueo a los 3 intentos erróneos
#el bloqueo perdura por 120 min

net accounts /lockoutthreshold:3
net accounts /lockoutduration:120
net accounts /lockoutwindow:120
net accounts /maxpwage:30
net accounts /minpwage:2
net accounts /minpwlen:10
net accounts /UNIQUEPW:5

net accounts

secedit /export /cfg c:\secpol.cfg
(gc C:\secpol.cfg).replace("PasswordComplexity=0", "PasswordComplexity=1") | Out-File C:\secpol.cfg
secedit /configure /db c:\windows\security\local.sdb /cfg c:\secpol.cfg /areas SECURITYPOLICY
rm -force c:\secpol.cfg -confirm:$false