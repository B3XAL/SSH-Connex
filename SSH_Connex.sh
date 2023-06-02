#!/bin/bash

##########################################
# Autor: B3XAL                           #
#                                        #
#                                        #
# SSH Connex                             #
##########################################

clear

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
orangeColour="\e[0;33m\033[1m"

# Variables para valores predeterminados
default_hostname="127.0.0.1"
default_username="kali"
default_port="22"

# Verificar privilegios de superusuario
if [[ $EUID -ne 0 ]]; then
    echo -e "${redColour}Este script debe ejecutarse con privilegios de superusuario (sudo).${endColour}"
    exit 1
fi

function intro_ssh_conex() {
   
    # Variables para el desplazamiento vertical
    offset=0
    max_offset=4

    # Mover el arte hacia arriba solo 6 veces
    for i in $(seq 1 $max_offset); do
        clear

        # Imprimir el arte en la posición actual
        tput cup $offset 0
        printf "███████╗███████╗██╗  ██╗     ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗██╗  ██╗"
        tput cup $((offset + 1)) 0
        printf "██╔════╝██╔════╝██║  ██║    ██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝╚██╗██╔╝"
        tput cup $((offset + 2)) 0
        printf "███████╗███████╗███████║    ██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗   ╚███╔╝ "
        tput cup $((offset + 3)) 0
        printf "╚════██║╚════██║██╔══██║    ██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝   ██╔██╗ "
        tput cup $((offset + 4)) 0
        printf "███████║███████║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗██╔╝ ██╗"
        tput cup $((offset + 5)) 0
        printf "╚══════╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝"

        sleep 0.5

        # Incrementar el desplazamiento vertical
        ((offset++))
    done

    echo
    echo "Cargando SSH Connex..."
    sleep 1
    
}





function connect_ssh_with_password() {
    read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el nombre de usuario${default_username:+ (Predeterminado: $default_username)}: " username_input

    if [[ -z $username_input && $username_input != "-g "* && -n $default_username ]]; then
        username_input=$default_username  # Establecer el valor predeterminado si no se proporciona ninguno
    fi

    if [[ $username_input == "-g "* ]]; then
        username_input="${username_input#-g }"  # Eliminar el prefijo "-g " del username
        echo -e "${orangeColour}Se ha establecido el username de forma predeterminada: $username_input${endColour}"
        default_username="$username_input"
    fi

    username="${username_input:-$default_username}"
    echo

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    echo -e "${blueColour}Estableciendo conexión SSH...${endColour}"

    ssh -oStrictHostKeyChecking=no -p "$port" "$username@$hostname"
}

function connect_ssh_with_shell() {
    read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input
    
    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el nombre de usuario${default_username:+ (Predeterminado: $default_username)}: " username_input

    if [[ -z $username_input && $username_input != "-g "* && -n $default_username ]]; then
        username_input=$default_username  # Establecer el valor predeterminado si no se proporciona ninguno
    fi

    if [[ $username_input == "-g "* ]]; then
        username_input="${username_input#-g }"  # Eliminar el prefijo "-g " del username
        echo -e "${orangeColour}Se ha establecido el username de forma predeterminada: $username_input${endColour}"
        default_username="$username_input"
    fi

    username="${username_input:-$default_username}"
    echo

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    
    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    echo -e "${blueColour}Estableciendo conexión SSH...${endColour}"

    echo -e "${purpleColour}Una vez introducida la contraseña correctamente, estará dentro.${endColour}"
    echo -e "${purpleColour}Pruebe introduciendo: whoami.${endColour}"

    ssh -oStrictHostKeyChecking=no -p "$port" "$username@$hostname" bash -p # También puedes usar --norc
}


function connect_ssh_with_key() {
    read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input
    
    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el nombre de usuario${default_username:+ (Predeterminado: $default_username)}: " username_input

    if [[ -z $username_input && $username_input != "-g "* && -n $default_username ]]; then
        username_input=$default_username  # Establecer el valor predeterminado si no se proporciona ninguno
    fi

    if [[ $username_input == "-g "* ]]; then
        username_input="${username_input#-g }"  # Eliminar el prefijo "-g " del username
        echo -e "${orangeColour}Se ha establecido el username de forma predeterminada: $username_input${endColour}"
        default_username="$username_input"
    fi

    username="${username_input:-$default_username}"
    echo

    read -p "Ingrese la ruta completa del archivo de clave privada: " keyfile


    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    
    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    echo -e "${blueColour}Estableciendo conexión SSH...${endColour}"

    ssh -oStrictHostKeyChecking=no -i "$keyfile" -p "$port" "$username@$hostname"
}


function connect_ssh_with_public_key() {
    read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input
    
    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el nombre de usuario${default_username:+ (Predeterminado: $default_username)}: " username_input
    
    if [[ $username_input == "-g "* ]]; then
        username_input="${username_input#-g }"  # Eliminar el prefijo "-g " del username
        echo -e "${orangeColour}Se ha establecido el username de forma predeterminada: $username_input${endColour}"
        default_username="$username_input"
    fi

    username="${username_input:-$default_username}"

    read -p "Ingrese la ruta completa del archivo id_rsa.pub: " public_key
    authorized_keys="/home/root/.ssh/authorized_keys" #"/home/$username/.ssh/authorized_keys"
    authorized_keys2="/home/root/.ssh/authorized_keys2" #"/home/$username/.ssh/authorized_keys2"

    sudo mkdir -p "/home/root/.ssh" #"/home/$username/.ssh"
    sudo cp "$public_key" "$authorized_keys"
    sudo cp "$public_key" "$authorized_keys2"
    sudo chown -R "root:root" "/home/root/.ssh" #"$username:$username" "/home/$username/.ssh"
    sudo chmod 700 "/home/root/.ssh" #/home/$username/.ssh"
    sudo chmod 600 "$authorized_keys"
    sudo chmod 600 "$authorized_keys2"

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input
    
    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    echo -e "${blueColour}Estableciendo conexión SSH...${endColour}"

    ssh  -p "$port" "$username@$hostname" #-oStrictHostKeyChecking=no
}


function nmap_port_scan_ssh() {
    read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el rango de puertos a escanear (ejemplo: 22 o 1-65535): " port_range

    # Obtener la cantidad total de puertos a escanear
    total_ports=$(echo "$port_range" | awk -F'-' '{print $2 - $1 + 1}')

    # Crear un archivo temporal para guardar los resultados del escaneo
    temp_file=$(mktemp)

    # Ejecutar el escaneo de puertos con nmap en una terminal Gnome separada
    echo -e "\nRealizando escaneo de puertos en $hostname..."

    gnome-terminal -- bash -c "sudo nmap -Pn -n -vvv -p $port_range -sV --script 'ssh* and not (sshv1 or ssh2-enum-algos)' $hostname -oN $temp_file; echo 'El escaneo de Nmap ha finalizado. Presiona Enter para continuar...'; read"

    # Esperar a que el escaneo de nmap en la terminal Gnome separada termine
    read -p "Presiona Enter cuando el escaneo haya finalizado..."

    # Verificar los resultados del escaneo para detectar puertos SSH abiertos
    echo -e "\nAnalizando resultados del escaneo..."

    # Verificar si se encontraron puertos SSH abiertos
    if grep -q "22/tcp.*open.*ssh" "$temp_file"; then
        echo -e "${greenColour}Se encontró el puerto SSH abierto en el puerto 22.${endColour}"
    else
        ssh_ports=$(awk '/[0-9]+\/tcp.*open.*ssh/ {print $1}' "$temp_file" | paste -sd ',' -)
        if [[ -n $ssh_ports ]]; then
            echo -e "${greenColour}Se encontraron puertos SSH abiertos en los siguientes puertos: $ssh_ports.${endColour}"
        else
            echo -e "${redColour}No se encontraron puertos SSH abiertos en el objetivo.${endColour}"
        fi
    fi

    # Eliminar el archivo temporal
    rm "$temp_file"
}







function enum_ssh_public_keys() {
     read -p "Ingrese el nombre/IP de host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    # Obtener claves públicas utilizando ssh-keyscan
    echo -e "\nEnumerando claves públicas SSH en $hostname..."
    public_keys=$(ssh-keyscan $hostname 2>/dev/null)

    # Crear un archivo para cada clave pública encontrada
    while read -r key; do
        output_file="id_rsa_objetivo_$(date +%Y%m%d%H%M%S%N).pub"
        echo "$key" > "$output_file"
        key_type=$(echo "$key" | awk '{print $1" "$2}')
        echo -e "${greenColour}Clave pública de tipo $key_type encontrada. Se ha guardado en el archivo: ${endColour}"
        echo "$(pwd)/$output_file"
        echo
        echo "Contenido del archivo:"
        cat "$output_file"
        echo
        chmod 600 "$output_file"
    done <<< "$public_keys"
}



function ssh_audit_scan() {
    read -p "Ingrese el nombre/IP del host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    # Clonar el repositorio de ssh-audit si no está presente
    if [ ! -d "ssh-audit" ]; then
        git clone https://github.com/jtesta/ssh-audit.git
    fi

    # Navegar al directorio ssh-audit
    cd ssh-audit

    # Ejecutar ssh-audit en el servidor especificado
    ./ssh-audit.py -p "$port" "$hostname"

    # Volver al directorio original
    cd ..
}


function show_ssh_info() {
    read -p "Ingrese el nombre/IP del host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    # Clonar el repositorio de ssh-audit si no está presente
    if [ ! -d "ssh-audit" ]; then
        git clone https://github.com/jtesta/ssh-audit.git
    fi

    # Navegar al directorio ssh-audit
    cd ssh-audit

    # Ejecutar ssh-audit en el servidor especificado y filtrar la información
    info=$(./ssh-audit.py -p "$port" "$hostname" | awk '/banner[ ]*:/ || /compatibility[ ]*:/ || /compression[ ]*:/')

    # Mostrar la información del servidor SSH
    echo -e "Información del servidor SSH en $hostname:\n"
    echo "$info"

    # Volver al directorio original
    cd ..
}


function show_ssh_version() {
    read -p "Ingrese el nombre/IP del host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    # Verificar si el repositorio de ssh-audit ya está presente
    if [ ! -d "ssh-audit/.git" ]; then
        # Clonar el repositorio de ssh-audit
        git clone https://github.com/jtesta/ssh-audit.git
    fi

    # Navegar al directorio ssh-audit
    cd ssh-audit

    # Ejecutar ssh-audit en el servidor especificado y filtrar la versión del software SSH
    version=$(./ssh-audit.py -p "$port" "$hostname" | awk '/software[ ]*:/')

    # Mostrar la versión del software SSH
    echo -e "Versión del software SSH en $hostname:\n"
    echo "$version"

    # Volver al directorio original
    cd ..
}



function show_ssh_fingerprints() {
    read -p "Ingrese el nombre/IP del host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"

    # Verificar si el repositorio de ssh-audit ya está presente
    if [ ! -d "ssh-audit/.git" ]; then
        # Clonar el repositorio de ssh-audit
        git clone https://github.com/jtesta/ssh-audit.git
    fi

    # Navegar al directorio ssh-audit
    cd ssh-audit

    # Ejecutar ssh-audit en el servidor especificado y filtrar las huellas digitales
    fingerprints=$(./ssh-audit.py -p "$port" "$hostname" | awk '/fingerprints/ {flag=1; next} /^\s*$/{flag=0} flag')

    # Mostrar todas las huellas digitales del servidor SSH
    echo -e "Huellas digitales del servidor SSH en $hostname:\n"
    echo "$fingerprints"
}

function hydra_ssh() {
     read -p "Ingrese el nombre/IP del host${default_hostname:+ (Predeterminado: $default_hostname)}: " hostname_input

    if [[ $hostname_input == "-g "* ]]; then
        hostname_input="${hostname_input#-g }"  # Eliminar el prefijo "-g " del hostname
        echo -e "${orangeColour}Se ha establecido el hostname de forma predeterminada: $hostname_input${endColour}"
        default_hostname="$hostname_input"
    fi

    hostname="${hostname_input:-$default_hostname}"
    
    read -p "Ingrese el nombre de usuario${default_username:+ (Predeterminado: $default_username)}: " username_input

    if [[ -z $username_input && $username_input != "-g "* && -n $default_username ]]; then
        username_input=$default_username  # Establecer el valor predeterminado si no se proporciona ninguno
    fi

    if [[ $username_input == "-g "* ]]; then
        username_input="${username_input#-g }"  # Eliminar el prefijo "-g " del username
        echo -e "${orangeColour}Se ha establecido el username de forma predeterminada: $username_input${endColour}"
        default_username="$username_input"
    fi

    username="${username_input:-$default_username}"
    echo

    read -p "Ingrese el puerto${default_port:+" (Predeterminado: $default_port)"}: " port_input

    if [[ $port_input == "-g "* ]]; then
        port_input="${port_input#-g }"  # Eliminar el prefijo "-g " del puerto
        echo -e "${orangeColour}Se ha establecido el puerto de forma predeterminada: $port_input${endColour}"
        default_port="$port_input"
    fi

    port="${port_input:-$default_port}"
    
    read -p "Ingrese la ruta completa del diccionario de contraseñas: " password_list

    output_file=$(mktemp)
    
    if command -v gnome-terminal &>/dev/null; then
        terminal="gnome-terminal"
    else
        echo -e "${yellowColour}gnome-terminal no está instalado. Se procederá a la instalación...${endColour}"
        sudo apt-get install gnome-terminal -y
        terminal="gnome-terminal"
    fi
    
    
    echo "Usando el terminal: $terminal"
    echo -e "${redColour}No cierres la ventana emergente, se cerrará automaticamente una vez terminado el proceso.${endColour}"
    
$terminal -- sh -c "sudo hydra -vV -u -l '$username' -P '$password_list' -t 16 -s '$hostname' ssh://'$hostname':'$port' > $output_file 2>&1; echo 'Hydra terminado. Presione Enter para continuar...'; read" &

    sleep 2

    tail -f "$output_file" | while IFS= read -r line; do
        echo "$line"
        if [[ $line == *"[ssh] host: $hostname"* ]]; then
            password=$(echo "$line" | awk '{print $NF}')
            echo -e "${greenColour}Contraseña encontrada: $password${endColour}"
            pkill -f hydra
            rm "$output_file"
            break
        fi
    done
}


verificar_instalacion() {
    nombre=$1
    comando=$2
    if command -v "$comando" >/dev/null 2>&1; then
        echo -e "${greenColour}✔${endColour} $nombre está instalado."
    else
        echo -e "Instalando $nombre..."
        sudo apt-get install -y "$comando"
        echo -e "${greenColour}✔${endColour} $nombre se ha instalado correctamente."
    fi
}




mostrar_ayuda() {
    echo -e "${blueColour}Ejemplo de uso para poner valor predeterminado:\n${endColour}"
    echo -e "${purpleColour}-g hostname/ip${endColour}    /   ${purpleColour}-g username${endColour}    /    ${purpleColour}-g port${endColour}"
    echo
    echo -e "${blueColour}Breve explicación del programa:${endColour}"
    echo "Este programa ofrece una suite de herramientas avanzadas enfocadas en la conexión SSH."
    echo "Permite realizar conexiones SSH de manera segura y eficiente utilizando diferentes métodos de autenticación, como contraseñas, claves privadas y claves públicas."
    echo "Además, proporciona funcionalidades especializadas para el análisis y la auditoría de servidores SSH, permitiendo realizar escaneos de puertos y descubrir posibles vulnerabilidades en las claves públicas utilizadas."
    echo "El submenú de escaneo incluye una opción exclusiva para realizar un escaneo detallado utilizando la poderosa herramienta 'ssh-audit', que analiza exhaustivamente la configuración y la seguridad del servidor SSH objetivo."
    

}




# Verificar herramientas
verificar_instalacion "SSH" "ssh"
sleep 1
verificar_instalacion "Nmap" "nmap"
sleep 1
verificar_instalacion "Terminal GNOME" "gnome-terminal"
sleep 1
verificar_instalacion "ssh-keyscan" "ssh-keyscan"
sleep 1
verificar_instalacion "ssh-audit" "ssh-audit"
sleep 1
verificar_instalacion "Hydra" "hydra"

# Menú principal
intro_ssh_conex;

while true; do
    echo -e "${greenColour}Menú de Conexión SSH${endColour}"
    echo -e "${blueColour}Seleccione una opción:${endColour}"
    echo -e "${yellowColour}1.${endColour} Conexión SSH con contraseña"
    echo -e "${yellowColour}2.${endColour} Conexión SSH con contraseña obteniendo shell en bash"
    echo -e "${yellowColour}3.${endColour} Conexión SSH con clave privada"
    echo -e "${yellowColour}4.${endColour} Conexión SSH con clave pública"
    echo -e "${yellowColour}5.${endColour} Conexión SSH con Hydra"
    echo -e "${yellowColour}6.${endColour} ${turquoiseColour}Escaneo${endColour}"
    echo -e "${redColour}0.${endColour} Salir"
    echo

    read -p "Opción: " option
    echo

    case $option in

	"-h"|"help"|"?")
	    
            mostrar_ayuda
            ;;
	 
        1)
            echo -e "${greenColour}Opción 1: Conexión SSH con contraseña.${endColour}"
            connect_ssh_with_password
            ;;
        2)
            echo -e "${greenColour}Opción 2: Conexión SSH con contraseña obteniendo shell en bash.${endColour}"
            connect_ssh_with_shell
            ;;
        3)
            echo -e "${greenColour}Opción 3: Conexión SSH con clave privada.${endColour}"
            connect_ssh_with_key
            ;;
        4)
            echo -e "${greenColour}Opción 4: Conexión SSH con clave pública.${endColour}"
            connect_ssh_with_public_key 
            ;;
	5)
            echo -e "${greenColour}Opción 5: Conexión SSH con Hydra.${endColour}"
            hydra_ssh
            ;;
        6)
            # Submenú de Escaneo
            while true; do
                echo -e "${greenColour}Submenú de Escaneo${endColour}"
                echo -e "${blueColour}Seleccione una opción:${endColour}"
                echo -e "${yellowColour}1.${endColour} Escaneo de puertos SSH"
                echo -e "${yellowColour}2.${endColour} Escaneo de claves públicas SSH"
		echo -e "${yellowColour}3.${endColour} ${turquoiseColour}Escaneo de ssh-audit${endColour}"
                echo -e "${redColour}0.${endColour} Volver al menú principal"
                echo

                read -p "Opción: " nmap_option
                echo

                case $nmap_option in

		    
		    "-h"|"help"|"?")
			
			mostrar_ayuda
			;;
	 
                    1)
                        echo -e "${greenColour}Opción 1: Escaneo de puertos SSH.${endColour}"
                        nmap_port_scan_ssh
                        ;;
                    2)
                        echo -e "${greenColour}Opción 2: Escaneo de claves públicas SSH.${endColour}"
			enum_ssh_public_keys
                        ;;

		    3)
			 # Submenú de EscaneoSSH Audit
			while true; do
			    echo -e "${greenColour}Submenú de SSH Audit${endColour}"
			    echo -e "${blueColour}Seleccione una opción:${endColour}"
			    echo -e "${yellowColour}1.${endColour} Escaneo general"
			    echo -e "${yellowColour}2.${endColour} Escaneo info"
			    echo -e "${yellowColour}3.${endColour} Escaneo versión"
			    echo -e "${yellowColour}4.${endColour} Escaneo fingerprints"
			    echo -e "${redColour}0.${endColour} Volver al submenú escaneo"
       			    echo

			    read -p "Opción: " audit_option
			    echo

			    case $audit_option in

				"-h"|"help"|"?")
				    
				    mostrar_ayuda
				    ;;
	 
				1)
				    echo -e "${greenColour}Opción 1: Escaneo general${endColour}"
				    ssh_audit_scan
				    ;;
				2)
				    echo -e "${greenColour}Opción 2: Escaneo info.${endColour}"
				    show_ssh_info
				    ;;

				3)
				    echo -e "${greenColour}Opción 3: Escaneo versión.${endColour}"
				    show_ssh_version
				    ;;
				4)
				    echo -e "${greenColour}Opción 4: Escaneo fingerprints.${endColour}"
				    show_ssh_fingerprints
				    ;;
				0)
				    echo -e "${redColour}Volviendo al submenú escaneo...${endColour}"
				    break
				    ;;
				
				*)
				    echo -e "${redColour}Opción inválida.${endColour}"
				    ;;
			     esac
			     echo
			done
			;;


		    
                    0)
                        echo -e "${redColour}Volviendo al menú principal...${endColour}"
                        break
                        ;;
                    *)
                        echo -e "${redColour}Opción inválida.${endColour}"
                        ;;
                esac

                echo
            done
            ;;
        0)
            echo -e "${redColour}Saliendo...${endColour}"
            break
            ;;
        *)
            echo -e "${redColour}Opción inválida.${endColour}"
            ;;
    esac

    echo
done
