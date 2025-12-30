#!/bin/bash

# ======================================
# Script d'experimentació amb Metric-FF
# Extensió 4 - Hotel Reservations
# ======================================

# Colors per output
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  Experiments amb Metric-FF ${NC}"
echo -e "${BLUE}======================================${NC}\n"

# ===============================
# GENERAR PROBLEMES AUTOMÀTICAMENT
# ===============================
echo -e "Generant problemes amb problem_generator.py...${NC}"

if ! python3 ./test/problem_generator.py --suite > /dev/null 2>&1 ; then
    echo -e "${RED}ERROR: La generació de problemes ha fallat. S'atura l'experimentació.${NC}"
    exit 1
fi

echo -e "${GREEN}Problemes generats correctament.${NC}\n"

# Rutes fixes
METRIC_FF="./code/metricff.exe"
DOMAIN_FILE="./code/PDDL/ext4_domini.pddl"
PROBLEMS_DIR="./test/experiments/problems"
RESULTS_DIR="./test/experiments/results"

# Verificacions
if [ ! -x "$METRIC_FF" ]; then
    echo -e "${RED}ERROR: No s'ha trobat metric-ff a ${METRIC_FF}"
    echo "Assegura't que existeix i és executable"
    exit 1
fi

if [ ! -f "$DOMAIN_FILE" ]; then
    echo -e "${RED}ERROR: No s'ha trobat el domini: ${DOMAIN_FILE}"
    exit 1
fi

# Crear directori de resultats
mkdir -p "$RESULTS_DIR"

RESULTS_FILE="${RESULTS_DIR}/resultat_experiments.txt"
TABLE_FILE="${RESULTS_DIR}/taula_resum.csv"

# Capçalera del fitxer
{
echo "======================================"
echo "  RESULTATS EXPERIMENTS METRIC-FF"
echo "  Domini: Extensió 4"
echo "  Data: $(date)"
echo "======================================"
echo ""
} > "$RESULTS_FILE"

# Capçalera taula CSV
echo "Problema,N_Estats,N_Fets,N_Habitacions,N_Reserves,Temps (s)" > "$TABLE_FILE"

# Funció per executar un problema
run_problem() {
    local problem_file=$1
    local problem_name=$(basename "$problem_file" .pddl)

    echo -e "Executant: ${problem_name}"
    
    TEMP_OUTPUT="${RESULTS_DIR}/${problem_name}_output.txt"
    "$METRIC_FF" -O -o "$DOMAIN_FILE" -f "$problem_file" > "$TEMP_OUTPUT" 2>&1

    # Comprovar solució
    if grep -q "ff: found legal plan" "$TEMP_OUTPUT"; then
        SOLUTION_FOUND="si"
    else
        SOLUTION_FOUND="no"
    fi

    # 2. Nom del problema
    PROBLEM_NAME=$(grep "problem '" "$TEMP_OUTPUT" \
        | sed -n "s/.*problem '\(.*\)' defined.*/\1/p")

    # 3. Temps total
    TOTAL_TIME=$(grep "seconds total time" "$TEMP_OUTPUT" \
        | awk '{print $1}')

    # 4. Assignacions (plan)
    PLAN=$(awk '
    /^step[[:space:]]+[0-9]+:/ {inplan=1}
    inplan && (/^[[:space:]]+[0-9]+:/ || /^step[[:space:]]+[0-9]+:/) {print}
    inplan && !(/^[[:space:]]+[0-9]+:/ || /^step[[:space:]]+[0-9]+:/) && NR>1 {exit}
    ' "$TEMP_OUTPUT")


    # Extreure H i R del nom del problema
    HAB=$(echo "$PROBLEM_NAME" | sed -n 's/.*-\([0-9]\+\)H-.*/\1/p')
    RES=$(echo "$PROBLEM_NAME" | sed -n 's/.*-[0-9]\+H-\([0-9]\+\)R/\1/p')
    NUM_FACTS=$(grep "yielding" "$TEMP_OUTPUT" | awk '{print $6}')
    NUM_STATES=$(grep "evaluating" "$TEMP_OUTPUT" | awk '{print $5}')


    # Resultat
    {
        echo "Solution trobada: $SOLUTION_FOUND"
        echo "Nom del problema: $PROBLEM_NAME"
        echo "Nombre d'habitacions: $HAB"
        echo "Nombre de reserves: $RES"
        echo "Nombre d'estats: $NUM_STATES"
        echo "Nombre de fets (facts): $NUM_FACTS"
        echo "Temps total(s): $TOTAL_TIME"
        echo "Plan:"
        echo "$PLAN"
        echo ""
    } >> "$RESULTS_FILE"

    # Afegir fila a la taula CSV
    NUM_PROBLEM="${problem_name: -1}"
    echo "$NUM_PROBLEM,$NUM_STATES,$NUM_FACTS,$HAB,$RES,$TOTAL_TIME" >> "$TABLE_FILE"

    echo -e "Solució trobada: ${TOTAL_TIME}s"
}

# ===============================
# EXECUCIÓ EXPERIMENTS
# ===============================

echo -e "\n=== Executant problemes d'experimentació ===\n"

for PROBLEM_FILE in "$PROBLEMS_DIR"/problem_*.pddl; do
    if [ -f "$PROBLEM_FILE" ]; then
        run_problem "$PROBLEM_FILE"
        sleep 1
    else
        echo -e "${RED}No s'han trobat fitxers problem_*.pddl a ${PROBLEMS_DIR}"
        break
    fi
done

# ===============================
# FINAL
# ===============================

echo -e "\n======================================"
echo -e " Experiments completats correctament!"
echo -e "======================================"
echo -e "\nResultats: ${RESULTS_FILE}"
echo -e "Sortides individuals: ${RESULTS_DIR}/*_output.txt\n"
