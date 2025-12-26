#!/bin/bash

# Script per executar experiments amb metric-ff
# Mesura el temps d'execució per problemes de mida creixent

# Colors per output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  Experiments amb Metric-FF${NC}"
echo -e "${BLUE}======================================${NC}\n"

# Verificar que metric-ff està instal·lat
if ! command -v metric-ff &> /dev/null; then
    echo -e "${RED}ERROR: metric-ff no està instal·lat o no està al PATH${NC}"
    echo "Descarrega'l de: http://fai.cs.uni-saarland.de/hoffmann/metric-ff.html"
    exit 1
fi

# Crear directori per resultats
mkdir -p results
RESULTS_FILE="results/experiments_$(date +%Y%m%d_%H%M%S).txt"

echo -e "${GREEN}Resultats es guardaran a: ${RESULTS_FILE}${NC}\n"

# Capçalera del fitxer de resultats
echo "======================================" > $RESULTS_FILE
echo "  RESULTATS EXPERIMENTS METRIC-FF" >> $RESULTS_FILE
echo "  Data: $(date)" >> $RESULTS_FILE
echo "======================================" >> $RESULTS_FILE
echo "" >> $RESULTS_FILE

# Funció per executar un problema
run_problem() {
    local problem_file=$1
    local problem_name=$(basename $problem_file .pddl)
    
    echo -e "${YELLOW}Executant: ${problem_name}${NC}"
    
    # Executar metric-ff i capturar temps
    START=$(date +%s.%N)
    
    # Redirigir output a fitxer temporal
    TEMP_OUTPUT="results/${problem_name}_output.txt"
    metric-ff -o domain.pddl -f $problem_file > $TEMP_OUTPUT 2>&1
    
    END=$(date +%s.%N)
    ELAPSED=$(echo "$END - $START" | bc)
    
    # Extreure informació de la solució
    PLAN_LENGTH=$(grep "step" $TEMP_OUTPUT | wc -l)
    SOLUTION_FOUND=$(grep -c "found legal plan" $TEMP_OUTPUT)
    
    # Guardar resultats
    echo "----------------------------------------" >> $RESULTS_FILE
    echo "Problema: $problem_name" >> $RESULTS_FILE
    echo "Temps d'execució: ${ELAPSED}s" >> $RESULTS_FILE
    
    if [ $SOLUTION_FOUND -gt 0 ]; then
        echo -e "${GREEN}✓ Solució trobada en ${ELAPSED}s (${PLAN_LENGTH} accions)${NC}"
        echo "Solució trobada: SÍ" >> $RESULTS_FILE
        echo "Longitud del pla: $PLAN_LENGTH accions" >> $RESULTS_FILE
    else
        echo -e "${RED}✗ No s'ha trobat solució${NC}"
        echo "Solució trobada: NO" >> $RESULTS_FILE
    fi
    
    # Copiar output complet
    cat $TEMP_OUTPUT >> $RESULTS_FILE
    echo "" >> $RESULTS_FILE
    
    # Retornar temps i longitud per estadístiques
    echo "$ELAPSED $PLAN_LENGTH"
}

# Executar problemes d'exemple
echo -e "\n${BLUE}=== Problemes d'exemple ===${NC}\n"

if [ -f "problem-basic.pddl" ]; then
    run_problem "problem-basic.pddl"
fi

if [ -f "problem-complex.pddl" ]; then
    run_problem "problem-complex.pddl"
fi

# Executar suite de proves si existeix
echo -e "\n${BLUE}=== Suite de proves ===${NC}\n"

for problem in problem-petit.pddl problem-mitja.pddl problem-gran.pddl problem-molt-gran.pddl problem-extrem.pddl; do
    if [ -f "$problem" ]; then
        run_problem "$problem"
        sleep 1
    fi
done

# Executar tots els problemes generats
echo -e "\n${BLUE}=== Problemes generats ===${NC}\n"

for problem in problem-generated*.pddl; do
    if [ -f "$problem" ]; then
        run_problem "$problem"
        sleep 1
    fi
done

# Resum final
echo -e "\n${BLUE}======================================${NC}"
echo -e "${GREEN}✓ Experiments completats!${NC}"
echo -e "${BLUE}======================================${NC}"
echo -e "\nResultats guardats a: ${GREEN}${RESULTS_FILE}${NC}"
echo -e "Traces individuals a: ${GREEN}results/*_output.txt${NC}\n"

# Generar gràfica de temps (opcional)
echo -e "${YELLOW}Tip: Pots analitzar els temps amb:${NC}"
echo -e "  grep 'Temps d'execució' $RESULTS_FILE\n"
