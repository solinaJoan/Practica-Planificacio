# Pràctica de Planificació - Intel·ligència Artificial
## Sistema d'Assignació de Reserves d'Hotel amb PDDL

**Grup:** Anel Ademovic, Aleix Pitarch i Joan Solina  


## Objectius Aconseguits

### Extensions Implementades

- **Nivell Bàsic**: Assignació sense solapaments
- **Extensió 1**: Optimització de reserves assignades
- **Extensió 2**: Preferències d'orientació
- **Extensió 3**: Minimització del desperdici de places
- **Extensió 4**: Optimització d'habitacions obertes

### Punts Extra

- Generador automàtic de problemes aleatoris
- Experimentació amb problemes de mida creixent


<!-- ## Execució -->

## Planificador bàsic
La primera part de la pràctica és troba a code/PDDL. És el codi bàsic que hem fet servir per desenvolupar la pràctica. Conté tant el domini com el problema de les quatre extensions i el nivell bàsic El problema és constant i molt bàsic. L'explicarem amb més detall a l'apartat dels jocs de prova. 

Per executar les diferents extensions i problemes que hem creat, hem fet un script. Et fa decidir entre les diverses extensions que hem fet.

```bash
# Executar
./run_planificador.sh
```

## Jocs de Prova 

Hem fet servir diversos jocs de prova. Per desenvolupar la pràctica hem fet servir els jocs de prova per defecte, a la carpeta de code/PDDL. Tots tenen la mateixa configuració. 

**Configuració:**
- 3 habitacions (capacitats: 2, 3, 4)
- 3 reserves 
   - 2 persones, dies 1-5
   - 3 persones, dies 10-15
   - 1 persona, dies 3-7

Per l'experimentació en canvi, hem fet servir el generador de jocs de prova amb configuracions diferents a cada experiment.
Hem creat un programa `problem_generator.py` per crear diferents jocs de prova per les diferents extensions. Pot modificar el nombre d'habitacions, el nombre de reserves... S'executa de la seguent manera.

```bash
# Generar un problema personalitzat
python3 ./test/problem_generator.py -H 5 -r 10 -d 30 -o problem-custom.pddl
```

Per fer l'experimentació, hem creat un mode d'execució per generar diversos problemes a la vegada de mida creixent. S'executa de la seguent manera

```bash
# Generar suite completa de proves
python3 ./test/problem_generator.py --suite
```

Crea els jocs de prova a la carpeta test/jocs-de-prova. Si els creem amb mode `--suite`, els genera amb nom `problema_x.pddl` i si els creem manualment, posa el nom de l'extensió per la qual volem generar un problema (per defecte nivell_basic). 

**Paràmetres del generador de problemes**
- `-H, --habitacions`: Nombre d'habitacions (default: 5)
- `-r, --reserves`: Nombre de reserves (default: 8)
- `-o, --output`: Fitxer de sortida. Si no l'especifiquem el fitxer de sortida és XXX_problem.pddl, on XXX és el valor de l'extensió a la que creem el problema
- `-s, --seed`: Llavor aleatòria per reproducibilitat
- `-e`: Nombre de l'extensió per la qual volem fer el joc de prova
- `--suite`: Genera múltiples problemes de mida creixent

**Suite de Proves Generada**
| Fitxer                        | Habitacions | Reserves |
|-------------------------------|-------------|----------|
| problem_1.pddl                | 3           | 4        |
| problem_2.pddl                | 4           | 5        |
| problem_3_.pddl               | 5           | 6        |
| problem_4_.pddl               | 6           | 7        |
| problem_5_.pddl               | 7           | 8        |


## Experimentació i resultats

Finalment, hem fet un script que genera problemes de mida creixent fent servir el generador de problemes que hem creat, i emmagatzema els respectius temps d'execució i altres dades rellevants. Per executar-lo, hem d'executar:

```bash
# Executar
./run_experiments.sh
```

### Metodologia

1. Generar problemes de mida creixent, aprofitant el mode `--suite` del generador de problemes
2. Executar metricff per cada problema
3. Mesurar temps d'execució, mida del problema i altres variables
4. Analitzar creixement de complexitat

### Experiments

Hem dut a terme tres experiments, els resultats dels quals es troben a les respectives carpetes.

#### **Experiment 1**
El primer experiment està enfocat en veure com evolucions el temps respecte un problema en el que creixen el nombre d'habitacions.
L'hem fet amb la configuració següent: 
- 9 mostres
- Habitacions creixents, de 4 a 12
- Reserves constants, 4

#### **Experiment 2**
El segon experiment està enfocat en veure com evolucions el temps respecte un problema en el que creixen el nombre de reserves.
L'hem fet amb la configuració següent: 
- 9 mostres
- Habitacions constants, 4
- Reserves creixents, de 4 a 12

#### **Experiment 3**
Hem fet el tercer experiment per veure com evoluciona el temps respecte un problema creixent tant en nombre d'habitacions com en nombre de reserves.
L'hem fet amb la configuració següent: 
- Habitacions creixents, de 3 a 7
- Reserves creixents, de 4 a 8

### Anàlisi de Resultats

Els resultats es guarden a `test/experiments/results/resultat_experiments.txt` i a `test/experiments/results/taula_resum.csv` amb:
- Temps d'execució per cada problema
- Longitud i configuració del pla
- Traces completes del planificador

**Exemple d'output:**
```
Solution trobada: si
Nom del problema: HOTEL-GENERATED-5H-6R
Nombre d'habitacions: 5
Nombre de reserves: 6
Nombre de fets (facts): 240
Nombre d'estats creats: 614
Temps total(s): 0.32
Plan:
step    0: DESCARTAR-RESERVA R5
        1: ASSIGNAR-RESERVA R1 H1
        2: ASSIGNAR-RESERVA R3 H1
        3: ASSIGNAR-RESERVA R4 H1
        4: ASSIGNAR-RESERVA R2 H3
        5: ASSIGNAR-RESERVA R6 H3
```





