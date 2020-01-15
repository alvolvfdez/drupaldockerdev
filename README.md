# Drupal Docker Dev

### Consideraciones:
Este script se ha desarrollado bajo un Linux Mint 19.3 (Ubuntu 18.04 LTS) y enfocado al terminal **bash**.

### Requisitos:

Si tenemos una instancia ya iniciada del servidor web apache en nuestra máquina, primero debemos pararla, de lo contrario, no se podrá instalar el entorno correctamente.

Por otro lado, lo único realmente fundamental es tener docker con la versión 17.06.
En el script **install-requirements.sh** ya nos comprueba este requisito.

### Instrucciones

Abre una terminal y ejecuta:
```sh
./install-requirements.sh
```
Si tienes todo lo necesario, automáticamente iniciará la instalación del entorno.

Puedes ejecutar directamente la instalación del entorno con:
```sh
./init-oneclickdrupal.sh
```
