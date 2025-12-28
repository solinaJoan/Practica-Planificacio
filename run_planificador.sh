#!/bin/bash

# Carpeta base
PDDL_DIR="code/PDDL"
PLANNER="./code/metricff.exe"

# Extensions disponibles
echo "Quina extensió vols executar?"
echo "  1) nivell_basic"
echo "  2) ext1"
echo "  3) ext2"
echo "  4) ext3"
echo "  5) ext4"
echo

read -p "Introdueix una opció (1-5): " opcio

case $opcio in
  1) EXT="nivell_basic" ;;
  2) EXT="Extensió 1" ;;
  3) EXT="Extensió 2" ;;
  4) EXT="Extensió 3" ;;
  5) EXT="Extensió 4" ;;
  *)
    echo "Opció no vàlida."
    exit 1
    ;;
esac

DOMINI="${EXT}_domini.pddl"
PROBLEMA="${EXT}_problema.pddl"

# Comprovacions
if [ ! -f "$PDDL_DIR/$DOMINI" ]; then
  echo "Error: no existeix $PDDL_DIR/$DOMINI"
  exit 1
fi

if [ ! -f "$PDDL_DIR/$PROBLEMA" ]; then
  echo "Error: no existeix $PDDL_DIR/$PROBLEMA"
  exit 1
fi

if [ ! -x "$PLANNER" ]; then
  echo "Error: no es pot executar $PLANNER"
  exit 1
fi

echo
echo "Executant $EXT ..."
echo "----------------------------------------"

$PLANNER -p "$PDDL_DIR/" -O -o "$DOMINI" -f "$PROBLEMA"
