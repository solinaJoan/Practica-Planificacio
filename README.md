# Pràctica de Planificació - Intel·ligència Artificial
## Sistema d'Assignació de Reserves d'Hotel amb PDDL

**Grup:** Anel Ademovich, Aleix Pitarch i Joan Solina  


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


## Execució

1. **Planificador PDDL**
Per executar les diferents extensions i problemes que hem creat, hem fet un script que et demana quina extensió volem executar.

```bash
   # Executar
   ./run_planificador.sh
```

2. **Generador de problemes** 
El generador de problemes crea diferents problemes per les diferents extensions. Pot modificar el nombre d'habitacions, el nombre de reserves... S'executa de la seguent manera.

```bash
# Generar un problema personalitzat
python3 generator.py -H 5 -r 10 -d 30 -o problem-custom.pddl
```
Crea els problemes a la carpeta test/problemes.

Per fer l'experimentació, hem generat diferents problemes de mida creixent. Per reproduir l'experimentació, hem d'executar:
```bash
# Generar suite completa de proves
python3 generator.py --suite
```
I ens generarà 5 fitxers amb diferents mides a test/experimentacio

### Paràmetres
- `-H, --habitacions`: Nombre d'habitacions (default: 5)
- `-r, --reserves`: Nombre de reserves (default: 8)
- `-d, --dies`: Dies del mes (màxim: 30)
- `-o, --output`: Fitxer de sortida. Si no l'especifiquem el fitxer de sortida és XXX_problem.pddl, on XXX és el valor de l'extensió a la que creem el problema
- `-s, --seed`: Llavor aleatòria per reproducibilitat
- `--suite`: Genera múltiples problemes de mida creixent

### Suite de Proves Generada

| Fitxer           | Habitacions | Reserves | Dies |
|---------------- -|-------------|----------|------|
| problem_1.pddl   | 3           | 3        | 10   |
| problem_2.pddl   | 4           | 6        | 15   |
| problem_3_.pddl  | 6           | 10       | 20   |
| problem_4_.pddl  | 8           | 15       | 25   |
| problem_5_.pddl  | 10          | 20       | 30   |


<!-- 
---

## Jocs de Prova

### Problem-basic.pddl

**Objectiu**: Verificar assignació bàsica sense solapaments

**Configuració:**
- 3 habitacions (capacitats: 2, 3, 4)
- 3 reserves amb preferències
- 10 dies

**Resultat esperat:**
- Totes les reserves assignades
- Preferències d'orientació complides
- Mínim desperdici de places

### Problem-complex.pddl

**Objectiu**: Provar solapaments i optimització

**Configuració:**
- 6 habitacions (capacitats variades: 1-4)
- 8 reserves amb solapaments temporals
- 30 dies complets

**Resultat esperat:**
- Màxim de reserves assignades
- Mínim nombre d'habitacions obertes
- Resolució de conflictes de solapament

---

## Experiments i Resultats

### Metodologia

1. Generar problemes de mida creixent
2. Executar metric-ff per cada problema
3. Mesurar temps d'execució
4. Analitzar creixement de complexitat

### Execució

```bash
./run_experiments.sh
```

### Anàlisi de Resultats

Els resultats es guarden a `results/experiments_[timestamp].txt` amb:
- Temps d'execució per cada problema
- Longitud del pla (nombre d'accions)
- Traces completes del planificador

**Exemple d'output:**

```
Problema: problem-petit
Temps d'execució: 0.123s
Solució trobada: SÍ
Longitud del pla: 3 accions

Problema: problem-mitja
Temps d'execució: 0.456s
Solució trobada: SÍ
Longitud del pla: 6 accions
```
 -->
