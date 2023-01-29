#!/bin/bash

#Este script se ejecutará sin sudo !

#Creamos carpeta principal de la empresa
mkdir proyectos

#Otorgamos permisos y herencia
setfacl -m d:g:sinformacion:rwx /proyectos
setfacl -m g:sinformacion:rwx /proyectos

#Gestionamos permisos de cualquier otro miembro/grupo
setfacl -m d:other:0 /proyectos
setfacl -m other:0 /proyectos

#Creamos el resto de la estructura de la empresa
mkdir -p /proyectos/pruebas
mkdir -p /proyectos/src

#Otorgamos permisos a cada grupo especifico 
#creado a la hora del diseño empresarial
setfacl -m g:proyectos_r:r /proyectos
setfacl -m g:proyectos_w:w /proyectos
setfacl -m g:proyectos_x:x /proyectos

setfacl -m g:pruebas_r:r /proyectos/pruebas
setfacl -m g:pruebas_w:w /proyectos/pruebas
setfacl -m g:pruebas_x:x /proyectos/pruebas

#Los usuarios de Desarrollo necesitan también
#acceso a subdirectorios de la carpeta src
#así que asignamos aquí herencia a sus grupos 
setfacl -m d:g:src_r:r /proyectos/src
setfacl -m d:g:src_w:w /proyectos/src
setfacl -m d:g:src_x:x /proyectos/src
setfacl -m g:src_r:r /proyectos/src
setfacl -m g:src_w:w /proyectos/src
setfacl -m g:src_x:x /proyectos/src

#Creamos los archivos de la empresa
#con comando inline
touch proyectos/Proyecto1.pdf proyectos/Proyecto2.pdf proyectos/pruebas/prueba1.pdf proyectos/pruebas/prueba2.pdf proyectos/src/app1.sh proyectos/src/app2.sh
