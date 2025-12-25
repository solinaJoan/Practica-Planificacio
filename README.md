# Pràctica de Planificació - Intel·ligència Artificial
## Sistema d'Assignació de Reserves d'Hotel amb PDDL

**Grup:** Anel Ademovich, Aleix Pitarch i Joan Solina  


## Objectius Aconseguits

### Extensions Implementades

- ✅ **Nivell Bàsic**: Assignació sense solapaments
- ✅ **Extensió 1**: Optimització de reserves assignades
- ✅ **Extensió 2**: Preferències d'orientació
- ✅ **Extensió 3**: Minimització del desperdici de places
- ✅ **Extensió 4**: Optimització d'habitacions obertes

### Punts Extra

- ✅ **+1 punt**: Generador automàtic de problemes aleatoris
- ✅ **+1 punt**: Experimentació amb temps d'execució creixent


---

## Instal·lació i Execució

### Prerequisits

1. **Metric-FF** (planificador PDDL)
   ```bash
   # Descarregar i compilar
   wget http://fai.cs.uni-saarland.de/hoffmann/metric-ff.html
   tar -xzf Metric-FF-v2.1.tgz
   cd Metric-FF-v2.1
   make
   sudo cp ff /usr/local/bin/metric-ff
   ```

2. **Python 3.6+** (per al generador)
   ```bash
   python3 --version
   ```

### Execució Ràpida

```bash
# Executar problema bàsic
metric-ff -o domain.pddl -f problem-basic.pddl

# Executar problema complex
metric-ff -o domain.pddl -f problem-complex.pddl

# Generar problemes aleatoris
python3 generator.py --suite

# Executar tots els experiments
chmod +x run_experiments.sh
./run_experiments.sh

```

---
## Generador de Problemes

### Ús Bàsic

```bash
# Generar un problema personalitzat
python3 generator.py -H 5 -r 10 -d 30 -o problem-custom.pddl

# Generar suite completa de proves
python3 generator.py --suite
```

### Paràmetres

- `-H, --habitacions`: Nombre d'habitacions (default: 5)
- `-r, --reserves`: Nombre de reserves (default: 8)
- `-d, --dies`: Dies del mes (màxim: 30)
- `-o, --output`: Fitxer de sortida
- `-s, --seed`: Llavor aleatòria per reproducibilitat
- `--suite`: Genera múltiples problemes de mida creixent

### Suite de Proves Generada

| Fitxer | Habitacions | Reserves | Dies |
|--------|-------------|----------|------|
| problem-petit.pddl | 3 | 3 | 10 |
| problem-mitja.pddl | 4 | 6 | 15 |
| problem-gran.pddl | 6 | 10 | 20 |
| problem-molt-gran.pddl | 8 | 15 | 25 |
| problem-extrem.pddl | 10 | 20 | 30 |

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

