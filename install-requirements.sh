#!/bin/bash
# Comprobamos si tenemos git instalado, de lo contrario, se instalará.
git=$(git --version)
if [ $(echo $git | grep -c "git version") -gt 0 ]; then
  echo "git está instalado correctamente."
else
  echo "Instalando git..."
  sudo apt-get install -y git
fi
# Definimos la versión mínimas de docker.
MIN_DOCKER_VERSION="19.00"
DOCKER_INSTALLED="false"
#Comprobamos si no tenemos curl instalado, de ser así, se instalará.
command -v curl >/dev/null 2>&1
if [ $? -eq 1 ]; then
  sudo apt-get install -y curl
fi
# Comprobamos si tenemos docker instalado, de no ser así, se instalará.
command -v docker >/dev/null 2>&1
if [ $? -eq 1 ]; then
  curl -sSL https://get.docker.com/ | sudo sh
  sudo usermod -aG docker $USER
  DOCKER_INSTALLED="true"
else
  # Comprobamos la versión de docker instalada.
  DOCKER_VERSION=$(docker --version)
  VERSION=$(echo $DOCKER_VERSION | cut -d \  -f 3)
  VERSION_1=$(echo $VERSION | cut -d \. -f 1)
  VERSION_2=$(echo $VERSION | cut -d \. -f 2)
  VERSION=$VERSION_1.$VERSION_2

  if [ $(echo $DOCKER_VERSION | grep -c "Docker version") -gt 0 ]; then
    if [ "$(echo "${VERSION} <" $MIN_DOCKER_VERSION | bc)" -eq 1 ]; then
      echo "La versión de docker no es correcta. Tiene que ser superior o igual a la" $MIN_DOCKER_VERSION
      exit 1
    else
      echo "docker está instalado correctamente.";
    fi
  fi
fi
command -v lando >/dev/null 2>&1
if [ $? -eq 1 ]; then
  LANDO_VERSION="v3.0.0-rc.23"
  if [ ! test -f "lando-"$LANDO_VERSION".deb" ]; then
    wget "https://github.com/lando/lando/releases/download/"$LANDO_VERSION"/lando-"$LANDO_VERSION".deb"
  fi
  sudo dpkg -i "lando-"$LANDO_VERSION".deb";
else
  echo "lando está instalado correctamente."
fi
if [ $DOCKER_INSTALLED == "true" ]; then
  echo "[!] Por favor, reinicia tu computadora.";
else
  sh init-oneclickdrupal.sh
fi