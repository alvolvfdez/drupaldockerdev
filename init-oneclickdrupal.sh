#!/bin/bash
cd ~ && sudo rm -rf ~/oneclickdrupal && mkdir ~/oneclickdrupal && cd ~/oneclickdrupal &&
lando init --source remote --remote-url https://ftp.drupal.org/files/projects/drupal-8.8.1.tar.gz --remote-options="--strip-components 1" --recipe drupal8 --webroot . --name oneclickdrupal &&
lando start &&
lando drush si standard --db-url=mysql://drupal8:drupal8@database/drupal8 --locale=es --account-pass=admin --site-name=OneClickDrupal -y;
# xdg-open https://oneclickdrupal.lndo.site;
