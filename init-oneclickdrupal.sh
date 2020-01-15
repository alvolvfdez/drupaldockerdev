#!/bin/bash
CURRENT_DIRECTORY=$PWD
INSTALLATION_DIRECTORY=~/oneclickdrupal
if [ -d $INSTALLATION_DIRECTORY ]; then
  echo "Es necesario destruir la instalación anterior para continuar con la actual ¿Desea continuar?.";
  select opcion in Sí No
  do
    case $opcion in
      "Sí")
        echo "Destruyendo instalación anterior...";
        cd $INSTALLATION_DIRECTORY;
        lando destroy -y $INSTALLATION_DIRECTORY || echo "No ha sido posible destruir la instalación anterior. Por favor, contacte con los desarrolladores.";
        sudo rm -rf $INSTALLATION_DIRECTORY;
        cd $CURRENT_DIRECTORY;
        break
        ;;
      "No")
        echo "Instalación cancelada.";
        exit 1
        break
        ;;
      *)
        echo "Opción no válida. Por favor, seleccione una opción válida (1 ó 2): ";
        ;;
    esac
  done
fi
mkdir $INSTALLATION_DIRECTORY && cp "fix-drupal8-permissions.sh" $INSTALLATION_DIRECTORY && cd $INSTALLATION_DIRECTORY &&
lando --clear &&
lando init --source remote --remote-url https://ftp.drupal.org/files/projects/drupal-8.8.1.tar.gz --remote-options="--strip-components 1" --recipe drupal8 --webroot . --name oneclickdrupal &&
lando start &&
lando drush si standard --db-url=mysql://drupal8:drupal8@database/drupal8 --locale=es --account-pass=admin --site-name=OneClickDrupal -y ||
lando drush si standard --db-url=mysql://drupal8:drupal8@database/drupal8 --locale=es --account-pass=admin --site-name=OneClickDrupal -y ||
lando drush si standard --db-url=mysql://drupal8:drupal8@database/drupal8 --locale=es --account-pass=admin --site-name=OneClickDrupal -y ||
echo "La instalación de drupal no se ha realizado correctamente. Por favor, contacte con los desarrolladores.";
sh fix-drupal8-permissions.sh;
lando composer install;
# xdg-open https://oneclickdrupal.lndo.site;
