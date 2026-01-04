# Nivell Bàsic (2 problemes NO TRIVIALS)

## Problema 1: Solapaments complexos amb solució

```bash
python problem_generator.py -e 5 -H 5 -r 12 -s 100 -o nivell_basic_problema1.pddl
```

**Paràmetres:**

- 5 habitacions, 12 reserves
- Seed 100

**Objectiu:** Provar un escenari complex on hi ha moltes reserves amb intervals que es solapen parcialment. El planificador ha de trobar una assignació vàlida fent "tetris temporal" per encaixar totes les reserves. No és trivial perquè requereix explorar múltiples combinacions d'assignacions per trobar-ne una on cap habitació tingui solapaments.

**Per què NO és trivial:** Amb 12 reserves i 5 habitacions, hi ha molta pressió sobre l'espai temporal. Algunes reserves llargues bloquejaran habitacions durant molts dies, forçant el planificador a assignar estratègicament les reserves curtes als forats temporals que queden.

## Problema 2: Capacitats ajustades

```bash
python problem_generator.py -e 5 -H 4 -r 10 -s 200 -o nivell_basic_problema2.pddl
```

**Paràmetres:**

- 4 habitacions, 10 reserves
- Seed 200

**Objectiu:** Escenari on les capacitats de les habitacions i el nombre de persones de les reserves són variades (1-4). Algunes reserves només poden anar a habitacions específiques per capacitat, el que redueix l'espai de cerca i fa que el problema tingui poques solucions vàlides.

**Per què NO és trivial:** La combinació de restriccions de capacitat + restriccions temporals crea un problema molt més restringit. No n'hi ha prou amb trobar dates lliures, també cal que l'habitació tingui la capacitat adequada.


# Extensió 1 - Optimitzar reserves assignades (2 problemes NO TRIVIALS)


## Problema 1: Demanda >> Oferta amb patró temporal


```bash
python problem_generator.py -e 1 -H 4 -r 15 -s 300 -o ext1_problema1.pddl
```

**Paràmetres:**

- 4 habitacions, 15 reserves
- Seed 300

**Objectiu:** Escenari amb demanda molt superior a l'oferta. El planificador ha de decidir quines reserves descartar per maximitzar el nombre d'assignades. No totes les combinacions de 4 reserves assignades són igual de "fàcils" de trobar - algunes reserves poden bloquejar molts dies mentre que d'altres són curtes.

**Per què NO és trivial:** El planificador ha d'explorar l'espai de decisions de quines reserves descartar. Descartar una reserva llarga pot permetre assignar 2-3 reserves curtes, per tant hi ha trade-offs no òbvies. A més, l'ordre en què es descarten reserves afecta les opcions posteriors.

**Resultat esperat:** Observar que el planificador tria descartar reserves llargues o amb dates conflictives per maximitzar el total assignat.


## Problema 2: Capacitats incompatibles


```bash
python problem_generator.py -e 1 -H 5 -r 12 -s 400 -o ext1_problema2.pddl
```

**Paràmetres:**

- 5 habitacions, 12 reserves
- Seed 400 (ajustat per generar més reserves grans)

**Objectiu:** Generar un escenari on algunes reserves amb 4 persones només poden anar a habitacions de capacitat 4 (que poden ser escasses), forçant a descartar reserves per incompatibilitat de capacitat, no només per solapament temporal.

**Per què NO és trivial:** Combina dos tipus de restriccions que forcen descarts: temporals i de capacitat. El planificador ha de gestionar la competència per habitacions grans.

# Extensió 2 - Optimitzar orientacions (2 problemes NO TRIVIALS)

## Problema 1: Conflicte multi-dimensió


```bash
python problem_generator.py -e 2 -H 6 -r 10 -s 500 -o ext2_problema1.pddl
```

**Paràmetres:**

- 6 habitacions, 10 reserves
- Seed 500

**Objectiu:** Escenari on el planificador ha de triar entre:

- Assignar una reserva a una habitació amb capacitat justa però orientació incorrecta
- Assignar-la a una habitació amb més capacitat (més desperdici implícit) però orientació correcta
- Descartar la reserva

**Per què NO és trivial:** Els pesos (pes 100 per descart, pes 1 per orientació incorrecta ) forcen el planificador a prioritzar assignar amb orientació incorrecta abans que descartar, però també ha de gestionar solapaments temporals. No és una simple optimització local.
​

**Resultat esperat:** Veure com el planificador tria assignar reserves amb orientació incorrecta quan l'alternativa és descartar-les, però tria orientacions correctes quan hi ha múltiples opcions vàlides.

## Problema 2: Orientacions desbalancejades


```bash
python problem_generator.py -e 2 -H 7 -r 12 -s 600 -o ext2_problema2.pddl
```

**Paràmetres:**

- 7 habitacions, 12 reserves
- Seed 600

**Objectiu:** Generar un escenari on les habitacions tenen una distribució desbalancejada d'orientacions (ex: 4 habitacions orientació nord, 2 sud, 1 est, 0 oest) i les reserves també prefereixen certes orientacions més que altres. Forçar el planificador a fer assignacions subòptimes en orientació.

**Per què NO és trivial:** La distribució desigual crea "colls d'ampolla" - si moltes reserves volen nord però hi ha solapaments temporals entre elles, algunes hauran d'acceptar altres orientacions.


# Extensió 3 - Minimitzar desperdici de places (2 problemes NO TRIVIALS)


## Problema 1: Matching òptim vs. temporal

```bash
python problem_generator.py -e 3 -H 6 -r 11 -s 700 -o ext3_problema1.pddl
```

**Paràmetres:**

- 6 habitacions, 11 reserves
- Seed 700

**Objectiu:** Escenari on el planificador ha de triar entre:

- Assignar una reserva de 2 persones a una habitació de 2 places (0 desperdici) que està parcialment ocupada
- Assignar-la a una habitació de 4 places (2 places desperdiciades) que està completament lliure durant el període

**Per què NO és trivial:** El pes relatiu entre desperdici de places (pes 1) i reserves assignades (pes 100 ) significa que si la primera opció crea conflictes que forcen a descartar altres reserves, pot ser millor acceptar el desperdici. El planificador ha de raonejar globalment, no localment.
​

**Resultat esperat:** Observar situacions on acceptar cert desperdici de places permet assignar més reserves en total, aconseguint un cost global menor.

## Problema 2: Capacitats molt diverses


```bash
python problem_generator.py -e 3 -H 8 -r 14 -s 800 -o ext3_problema2.pddl
```

**Paràmetres:**

- 8 habitacions, 14 reserves
- Seed 800

**Objectiu:** Generar habitacions amb tota la gamma de capacitats (múltiples habitacions de 1, 2, 3 i 4 places) i reserves també amb tots els tamanys. El planificador ha de fer matching òptim minimitzant el desperdici global.

**Per què NO és trivial:** Amb moltes opcions de matching possibles, el planificador ha d'explorar l'espai de solucions per trobar la combinació que minimitza el desperdici total mantenint totes (o el màxim de) reserves assignades. Una decisió d'assignació primerenca pot "bloquejar" matchings millors posteriors.

# Extensió 4 - Minimitzar habitacions obertes (2 problemes NO TRIVIALS)


## Problema 1: Reutilització vs. desperdici


```bash
python problem_generator.py -e 4 -H 10 -r 12 -s 900 -o ext4_problema1.pddl
```

**Paràmetres:**

- 10 habitacions disponibles, 12 reserves
- Seed 900

**Objectiu:** Amb moltes habitacions disponibles, el planificador ha de triar entre:

- Reutilitzar una habitació ja oberta per una nova reserva (0 cost d'obertura) però amb més desperdici de places

- Obrir una nova habitació (cost 100 ) amb millor matching de capacitat
​

**Per què NO és trivial:** Els tres criteris (reserves assignades pes 1000, habitacions obertes pes 100, desperdici pes 1 ) creen una jerarquia complexa. El planificador ha de raonejar sobre trade-offs: val la pena obrir una nova habitació per estalviar 10 places desperdiciades? NO. I per assignar 1 reserva més? SÍ.
​

**Resultat esperat:** Veure com el planificador concentra reserves en poques habitacions, acceptant cert desperdici de places, i només obre noves habitacions quan és estrictament necessari per assignar més reserves.

## Problema 2: Patró temporal fragmentat


```bash
python problem_generator.py -e 4 -H 12 -r 16 -s 1000 -o ext4_problema2.pddl
```

**Paràmetres:**

- 12 habitacions, 16 reserves
- Seed 1000

**Objectiu:** Generar reserves amb intervals temporals molt fragmentats (moltes reserves curtes en diferents moments del mes). El planificador ha de decidir si val la pena fer "tetris temporal" complex per reutilitzar habitacions o és més simple obrir-ne de noves.

**Per què NO és trivial:** Amb reserves fragmentades temporalment, hi ha moltes oportunitats de reutilitzar habitacions (els "forats" entre reserves es poden omplir), però trobar l'assignació òptima requereix exploració exhaustiva. És un problema de "bin packing" temporal multi-dimensió (temps + capacitat + cost d'obertura).

**Resultat esperat:** Observar patrons d'assignació on el planificador aprofita els forats temporals per reutilitzar habitacions, minimitzant el nombre total d'habitacions obertes.

