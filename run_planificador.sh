#!/bin/bash

# Carpeta base
PDDL_DIR="code/PDDL"
PLANNER="./code/metricff.exe"

# Extensions disponibles
echo "Quina extensió vols executar?"
echo "  1) Extensió 1"
echo "  2) Extensió 2"
echo "  3) Extensió 3"
echo "  4) Extensió 4"
echo "  5) Nivell Bàsic"
echo

read -p "Introdueix una opció (1-5): " opcio

case $opcio in
  1) EXT="ext1" ;;
  2) EXT="ext2" ;;
  3) EXT="ext3" ;;
  4) EXT="ext4" ;;
  5) EXT="nivell_basic" ;;
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
