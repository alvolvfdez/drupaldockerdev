#!/bin/bash
INSTALLATION_DIRECTORY=~/oneclickdrupal
cd $INSTALLATION_DIRECTORY &&
lando composer require 'drupal/da_vinci:^4.1';
lando composer require 'drupal/admin_toolbar:^2.0';
lando composer require 'drupal/pathauto:^1.6';
lando composer require 'drupal/ctools:^3.2';
lando composer require 'drupal/smtp:^1.0';
lando composer require 'drupal/select2:^1.6';
lando composer require 'drupal/ckeditor_uploadimage:^1.7';
lando composer require 'drupal/slick:^2.0';
lando composer require 'drupal/eu_cookie_compliance:^1.8';
lando composer require 'drupal/linkit:^4.3';
lando composer require 'drupal/twitter_api_block:^2.6';
lando composer require 'drupal/simple_gmap:^1.4';
lando composer require 'drupal/easy_breadcrumb:^1.12';
lando composer require 'drupal/inline_entity_form:^1.0';