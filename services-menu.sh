#!/bin/bash

# Función para mostrar el menú principal
mostrar_menu() {
  echo "---------------------------"
  echo "   Menú de Utilidades Bash"
  echo "---------------------------"
  echo "1. Listar contenido de directorio"
  echo "2. Crear archivo con texto"
  echo "3. Comparar archivos"
  echo "4. Ejemplo de awk"
  echo "5. Ejemplo de grep"
  echo "6. Salir"
  echo "---------------------------"
  read -p "Selecciona una opción: " opcion
}

# Función para listar el contenido de un directorio
listar_directorio() {
  read -p "Ruta del directorio: " dir
  if [ -d "$dir" ]; then
    ls -lha "$dir"
  else
    echo "Error: El directorio no existe."
  fi
}

# Función para crear un archivo con texto
crear_archivo() {
  read -p "Nombre del archivo: " archivo
  read -p "Texto a escribir: " texto
  echo "$texto" > "$archivo"
  echo "Archivo '$archivo' creado."
}

# Función para comparar dos archivos
comparar_archivos() {
  read -p "Primer archivo: " archivo1
  read -p "Segundo archivo: " archivo2
  if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
    diff "$archivo1" "$archivo2"
  else
    echo "Error: Uno o ambos archivos no existen."
  fi
}

# Función para demostrar el uso de awk
ejemplo_awk() {
  echo "Datos: Nombre Edad"
  echo "Juan 25"
  echo "Ana 30"
  echo "Nombres:"
  echo -e "Nombre Edad\nJuan 25\nAna 30" | awk '{print $1}'
}

# Función para demostrar el uso de grep
ejemplo_grep() {
  read -p "Palabra a buscar: " palabra
  read -p "Archivo: " archivo
  if [ -f "$archivo" ]; then
    grep "$palabra" "$archivo"
  else
    echo "Error: El archivo no existe."
  fi
}

# Bucle principal del programa
while true; do
  mostrar_menu
  case $opcion in
    1) listar_directorio ;;
    2) crear_archivo ;;
    3) comparar_archivos ;;
    4) ejemplo_awk ;;
    5) ejemplo_grep ;;
    6) echo "Saliendo..."; break ;;
    *) echo "Opción inválida.";;
  esac
  echo ""
done
