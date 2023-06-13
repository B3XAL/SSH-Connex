<div align="center">
  <img src="https://github.com/B3XAL/SSH-Connex/blob/5441cb8f374a215bdfa6a3d84b76a70e57449fb7/ssh.JPG" alt="SSH-Connex">
</div>
<br>
<p align="center">
  <a href="https://git-scm.com/"><img src="https://img.shields.io/badge/Git-2C363F?style=for-the-badge&logo=git&logoColor=F05032" alt="Git"></a>
  <a href="https://www.openssh.com/"><img src="https://img.shields.io/badge/OpenSSH-000000?style=for-the-badge&logo=OpenSSH&logoColor=FFFFFF" alt="OpenSSH"></a>
  <a href="https://nmap.org/"><img src="https://img.shields.io/badge/Nmap-000000?style=for-the-badge&logo=nmap&logoColor=DC572E" alt="Nmap"></a>
  <a href="https://help.gnome.org/users/gnome-terminal/stable/"><img src="https://img.shields.io/badge/Terminal%20Gnome-2C3539?style=for-the-badge&logo=gnome&logoColor=FFFFFF" alt="Terminal Gnome"></a>
  <a href="https://github.com/arthepsy/ssh-audit"><img src="https://img.shields.io/badge/ssh--audit-000000?style=for-the-badge&logo=OpenSSH&logoColor=FFFFFF" alt="ssh-audit"></a>
</p>
<!-- <br> -->
<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/Version-1.0-green.svg" alt="Version">
</p>
<br>

### ***Índice***

* [Descripción del proyecto](#descripción)
* [Instalación local de SSH_Connex](#instalación-local-de-ssh_connex)
* [Ejemplos de uso](#ejemplos-de-uso)
* [Desarrolladoras del proyecto](#desarrolladoras-del-proyecto)
* [Tecnologías utilizadas](#tecnologías-utilizadas)
* [Licencia](#licencia)


<br>

## ***Descripción***

Ssh connex es una herramienta de línea de comandos escrita en bash que simplifica y automatiza la conexión segura a servidores ssh.

El desarrollo de ssh connex se basó en la necesidad de simplificar el proceso de conexión a servidores ssh y proporcionar a los usuarios una interfaz intuitiva y fácil de usar.

Los usuarios pueden guardar las configuraciones de conexión con el comando   ```shell -g <hostname/IP> ```   y acceder rápidamente a ellas eliminando la necesidad de recordar y escribir comandos largos y complicados cada vez que deseen establecer una conexión ssh.

Durante el desarrollo de este proyecto (realizado como parte de mi trabajo de fin de Master en [TssCiberseguridad](https://tssciberseguridad.com/)) adquirí conocimientos sobre la creación de scripts de línea de comandos en bash, la interacción segura con servidores ssh y la automatización de tareas mediante scripts. Además tuve la oportunidad de aprender en profundidad los conceptos relacionados con la seguridad en las conexiones ssh y la gestión de claves públicas y privadas.
<br>
<br>

### ***Instalación local de SSH_Connex***

Construir y ejecutar SSH-Connex es muy fácil. Asegúrese de tener instalados [ Git ](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git), y siga las instrucciones que se indican a continuación. 

 1. Clona este repositorio en tu máquina local
```shell
git clone https://github.com/B3XAL/SSH-Connex.git
 ```
 <br>
 
 2. Navega al directorio del proyecto
```shell
cd SSH-Connex
```
<br>

 3. Ejecuta el script SSH_Connex.sh para iniciar la herramienta
```shell
sudo ./SSH_Connex.sh
```
<br>

## Ejemplos de uso

Al ejecutar SSH-Connex, se realizará de foma automática una verificación de todas las dependecias necesarias con las que se trabaja.
Así mismo, en caso de que alguna de las dependencias no esté instalada, se procederá a su instalación de forma automática.

- ✔️ Git
- ✔️ OpenSSH
- ✔️ Nmap
- ✔️ Terminal Gnome
- ✔️ ssh-audit

Una vez verifcado todo entraremos al menú.
<p align="center">
  <img src="https://github.com/B3XAL/SSH-Connex/blob/9efaaa986697d725fe01481a0fc6fd54173df9cd/Men%C3%BA.JPG" alt="SSH-Connex Menú">
</p>

<br>

* Conexión SSH con contraseña:

1. Te solicitará ingresar el nombre de host o la dirección IP a la cual deseas conectarte. Puedes ingresar, por ejemplo, `nmap.org` o la dirección IP específica, como `45.33.49.119`. 

2. Te pedirá que ingreses el nombre de usuario correspondiente de la cuenta que deseas acceder a través de la conexión SSH.

3. Finalmente, te solicitará que especifiques el puerto al cual deseas conectarte.

<p align="center">
  <img src="https://github.com/B3XAL/SSH-Connex/blob/a72c6c684bfd97fd055c62093450666ea8870ec7/Conexion%20ssh1.JPG" alt="SSH Contraseña">
</p>

> En la foto dada se realiza un ejemplo del cambio de usuario y puerto predeterminado con el comando `-g`.

<br>
<br>

* Conexión SSH con contraseña obteniendo una shell en bash:

La diferencia la opción anterior es que, una vez autenticados, se nos proporciona una shell para operar inmediatamente en el servidor.
<p align="center">
  <img src="https://github.com/B3XAL/SSH-Connex/blob/0d171c1ae302eb35d9032e1cb37faea2a2c8868c/shell.JPG" alt="SSH Shell">
</p>

> Parece que se ha quedad congelado pero en realidad estás dentro (si has introducido bien la contraseña).

<br>
<br>

* Conexión SSH con claves privadas:

:construction: Proyecto en construcción :construction:

<br>
<br>


## Desarrolladoras del proyecto

Desarrollador: B3XAL

## Tecnologías utilizadas

- ✔️ Git Herramienta de control de versiones utilizada en el proyecto.
- ✔️ OpenSSH Client: Cliente OpenSSH utilizado para la conexión SSH.
- ✔️ Nmap: Herramienta de escaneo de red utilizada en el proyecto.
- ✔️ Terminal GNOME: Terminal GNOME utilizado en el proyecto.
- ✔️ ssh-audit: Herramienta utilizada para auditar la seguridad de SSH.
- ✔️ Hydra: Herramienta de fuerza bruta utilizada en el proyecto.


## Licencia

Este proyecto se distribuye bajo la [Licencia MIT](LICENSE). Consulta el archivo LICENSE para más detalles.




