# SSH Connex

## Descripción

SSH Connex es una herramienta de línea de comandos escrita en Bash que simplifica y automatiza la conexión segura a servidores SSH. Esta herramienta se desarrolló con el propósito de agilizar el proceso de conexión y permitir la ejecución de tareas comunes en entornos de red de forma más eficiente.

Algunas de las motivaciones detrás de este proyecto son:

- Simplificar el proceso de conexión a servidores SSH.
- Proporcionar una interfaz intuitiva y fácil de usar.
- Automatizar tareas comunes en entornos de red.

El principal problema que resuelve SSH Connex es eliminar la necesidad de recordar y escribir comandos largos y complicados cada vez que se desea establecer una conexión SSH. Con esta herramienta, los usuarios pueden guardar las configuraciones de conexión y acceder rápidamente a ellas cuando sea necesario.

A lo largo del desarrollo de este proyecto, se aprendió sobre:

- La utilización de Bash para crear scripts de línea de comandos.
- La interacción con servidores SSH de forma segura.
- La automatización de tareas a través de scripts.

## Índice

- [Instalación](#instalación)
- [Uso](#uso)
- [Créditos](#créditos)
- [Licencia](#licencia)

## Instalación

¿Cuáles son los pasos necesarios para instalar tu proyecto? Proporciona una descripción paso a paso de cómo poner en funcionamiento el entorno de desarrollo.

Clona este repositorio en tu máquina local
```shell
git clone https://github.com/B3XAL/SSH-Connex.git
 ```
Navega al directorio del proyecto
```shell
cd SSH-Connex
```
Ejecuta el script SSH_Connex.sh para iniciar la herramienta
```shell
sudo ./SSH_Connex.sh
```

## Uso

Para utilizar SSH Connex, sigue estos pasos:

1. Ejecuta el script ` sudo SSH_Connex.sh`.
2. Sigue las instrucciones en pantalla para seleccionar una configuración de conexión o agregar una nueva.
3. Ingresa tus credenciales de autenticación cuando se te solicite.
4. Una vez conectado, podrás ejecutar comandos y realizar tareas en el servidor SSH remoto.

Las opciones disponibles en el menú de la aplicación son:

1. Conexión SSH con contraseña: Esta opción te permite establecer una conexión SSH utilizando una contraseña de autenticación.

2.Conexión SSH con contraseña obteniendo shell en bash: Esta opción también establece una conexión SSH con contraseña, pero además obtiene un shell interactivo en el servidor remoto utilizando el intérprete de comandos Bash.

3.Conexión SSH con clave privada: Esta opción te permite establecer una conexión SSH utilizando una clave privada de autenticación.

4.Conexión SSH con clave pública: Esta opción establece una conexión SSH utilizando una clave pública de autenticación.

5.Conexión SSH con Hydra: Esta opción utiliza la herramienta Hydra para realizar un ataque de fuerza bruta en la autenticación SSH. Se intentarán diferentes combinaciones de usuarios y contraseñas para acceder al servidor remoto.

Escaneo: Esta opción te permite realizar diferentes tipos de escaneos relacionados con SSH:

1. Escaneo de puertos SSH: Realiza un escaneo de puertos en el servidor remoto para identificar los puertos SSH abiertos.

2. Escaneo de claves públicas SSH: Realiza un escaneo en busca de claves públicas SSH en el servidor remoto.

3. Escaneo de ssh-audit: Utiliza la herramienta ssh-audit para realizar un escaneo de seguridad en el servidor SSH y obtener información sobre las configuraciones y vulnerabilidades.



## Créditos

Desarrollador: B3XAL

Herramientas usadas:

- Git Herramienta de control de versiones utilizada en el proyecto.
- OpenSSH Client: Cliente OpenSSH utilizado para la conexión SSH.
- Nmap: Herramienta de escaneo de red utilizada en el proyecto.
- Terminal GNOME: Terminal GNOME utilizado en el proyecto.
- ssh-audit: Herramienta utilizada para auditar la seguridad de SSH.
- Hydra: Herramienta de fuerza bruta utilizada en el proyecto.


## Licencia

Este proyecto se distribuye bajo la [Licencia MIT](LICENSE). Consulta el archivo LICENSE para más detalles.




