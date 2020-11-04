#######################################################################
# mkcpp: crea estructura de directorios para proyectos c++
#
# created by: Jaime Feldman 2020 MIT Licence.
#######################################################################

#!/bin/bash

red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
Yellow='\033[1;33m'
Magenta='\033[1;35m'
NOC='\033[0m'

#######################################################################
#  Configuración 
#######################################################################

# Ruta del repiositorio local de plantillas.
repositorio="/Users/jaime/git/cpp.templates"
Makefile="/Users/jaime/git/cpp.templates/Makefile"
Launcher="/Users/jaime/git/cpp.templates/Launcher.cpp"

echo
echo -n "Creando estructura de directorios para proyecto en C++......."
if [ -d src ]; then
        echo -e "[${blue}NO${NOC}]"
    else
      mkdir -p src/class 
      mkdir obj
      mkdir bin
      echo -e "[${green}OK${NOC}]"
fi 


echo -n "Verificando repositorio local................................" 
if [ -d ${repositorio} ]; then
    echo -e "[${green}OK${NOC}]"
    echo -n "Copiando Makefile............................................"
    if [ -f ${Makefile} ]; then
        if [ -f "Makefile" ]; then
            echo -e "[${blue}NO${NOC}]"
        else
            cp ${Makefile} .
            if [ "$?" -ne "0" ]; then
                echo -e "[${red}FAIL${NOC}]"
            else
                echo -e "[${green}OK${NOC}]"
            
            fi
        fi
    fi
    echo -n "Copiando Launcher.cpp........................................"
    if [ -f ${Launcher} ]; then
        if [ -f "src/Launcher.cpp" ]; then
            echo -e "[${blue}NO${NOC}]"
        else
            cp ${Launcher} src/
            if [ "$?" -ne "0" ]; then
                echo -e "[${red}FAIL${NOC}]"
            else
                echo -e "[${green}OK${NOC}]"
            fi
        fi
    fi
else
    echo -e "[${red}FAIL${NOC}]"
    echo -n "Verificando la existencia del directorio git................."
    if [ -d /Users/jaime/git ]; then
        echo -e "[${green}OK${NOC}]"
    else 
        echo -e "[${red}FAIL${NOC}]"
        echo -n "Creando el directorio ~git..............................."
        mkdir ~/git
        echo -e "[${green}OK${NOC}]"
    fi

    echo -n "Clonando repositoiro desde github............................"
    git clone https://github.com/jaimefeldman/cpp.templates.git ~/git/cpp.templates > /dev/null 2>&1
    echo -e "[${green}OK${NOC}]"
    echo -n "Copiando archivos al proyecto................................"
    cp ${Launcher} src/
    cp ${Makefile} .
    echo -e "[${green}OK${NOC}]"
fi
echo
