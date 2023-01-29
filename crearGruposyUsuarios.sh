#!/bin/bash

#Ejecutaremos este script con sudo !

#Creamos los grupos principales de
#los departamentos de la empresa
groupadd sinformacion
groupadd desarrollo
groupadd explotacion

#Creamos un grupo para cada permiso
#de cada una de las carpetas previstas
#en nuestro diseño/estructura empresarial
#(Entendemos dicha organización como inmutable)
groupadd proyectos_r
groupadd proyectos_w
groupadd proyectos_x
groupadd pruebas_r
groupadd pruebas_w
groupadd pruebas_x
groupadd src_r
groupadd src_w
groupadd src_x

#Creamos los usuarios para nuestros empleados
useradd -m -d /home/SisAdmin -G sinformacion -s /bin/bash SisAdmin
useradd -m -d /home/SoftDev -G desarrollo -s /bin/bash SoftDev
useradd -m -d /home/QATester -G explotacion -s /bin/bash QATester

#Añadimos permisos a ciertos usuarios
#siguiendo con la normativa pensada
#para la forma de operar de la empresa
usermod -a -G proyectos_x,src_r,src_w,src_x SoftDev
usermod -a -G proyectos_x,src_r,src_x,pruebas_r,pruebas_w,pruebas_x QATester

#Asignamos una contraseña a cada uno de los miembros
passwd SisAdmin
passwd SoftDev
passwd QATester
