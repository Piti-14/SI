#!/bin/bash
#Ejecutar el script como root

#Creación de grupos
groupadd sinformacion
#groupadd desarrollo
#groupadd explotacion

#Creación de carpeta principal de la empresa
mkdir proyectos

#Aplicamos permisos a este directorio
setfacl -m d:g:sinformacion:rwx proyectos/

#Creamos el resto de directorios
mkdir -p /proyectos/{pruebas,src}

#Se habrán heredado los permisos,
#los modificamos acorde a la organización
#setfacl -m d:g:desarrollo:rw src/

#setfacl -m d:g:explotacion:r pruebas/

#setfacl -m d:g:explotacion:rx src#/

#Creacion de los archivos de la empresa
#touch Proyecto1.pdf, Proyecto2.pdf proyectos/
#touch prueba1.pdf, prueba2.pdf proyectos/pruebas/
#touch App1.sh, App2.sh proyectos/src/


#Comando para listar los grupos
groups

#Comando para listar los grupos con su ID
id













#Creamos los permisos de los distintos grupos
#setfacl -m d:g:sinformacion:rwx
#setfacl -m d:g:desarrollo:rw-
#setfacl -m d:g:explotacion:r-x


#Comando para ver todos los grupos del sistema
#getent group
