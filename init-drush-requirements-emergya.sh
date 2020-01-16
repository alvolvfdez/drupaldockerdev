#!/bin/bash
INSTALLATION_DIRECTORY=~/oneclickdrupal
cd $INSTALLATION_DIRECTORY && lando drush cr && lando drush cex -y;