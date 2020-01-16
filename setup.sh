#!/bin/bash
INSTALLATION_DIRECTORY=~/oneclickdrupal
clear &&
echo "Instalando requisitos..." &&
echo "" &&
./install-requirements.sh &&
echo "" &&
echo "Instalando el entorno..." &&
./init-oneclickdrupal.sh &&
echo "" &&
echo "Ejecutando requisitos de composer..." &&
./init-composer-requirements-emergya.sh  &&
echo "Importando base de datos..." &&
./init-db-import-emergya.sh &&
echo "Ejecutando requisitos de drush..." &&
./init-drush-requirements-emergya.sh &&
echo "" &&
echo "¡¡¡Instalación terminada con éxito!!!" &&
echo "" &&
echo "Puede acceder al sitio con http://oneclickdrupal.lndo.site/ o en su versión con SSL https://oneclickdrupal.lndo.site/";