#!/bin/bash
INSTALLATION_DIRECTORY=~/oneclickdrupal
cd $INSTALLATION_DIRECTORY;
# Habilitar módulos del core
lando drush en -y layout_builder;
# Habilitar módulos contrib
lando drush en -y da_vinci admin_toolbar pathauto ctools smtp select2 ckeditor_uploadimage slick eu_cookie_compliance linkit twitter_api_block simple_gmap easy_breadcrumb inline_entity_form;