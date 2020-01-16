#!/bin/bash
clear
echo "Instalando requisitos..."
echo ""
./install-requirements.sh
echo ""
echo "Instalando el entorno..."
./init-oneclickdrupal.sh
echo ""
echo "Instalando módulos..."
./init-composer-requirements-emergya.sh
echo "Habilitando módulos..."
./init-composer-requirements-emergya.sh