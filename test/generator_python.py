#!/usr/bin/env python3
"""
Generador de problemes PDDL per la pràctica d'assignació d'habitacions d'hotel
Genera problemes aleatoris de mida variable per experimentar amb el rendiment
"""

import os
import random
import argparse
from typing import List, Tuple

class ReservaGenerator:
    def __init__(self, seed=None, extensio: int = 5):
        if seed:
            random.seed(seed)
        self.extensio = extensio
        self.orientacions = ["nord", "sud", "est", "oest"]
        self.metriques_costos = {
            1: [
                "(= (reserves-assignades) 0)",
            ],
            2: [
                "(= (reserves-assignades) 0)",
                "(= (orientacions-incorrectes) 0)",
            ],
            3: [
                "(= (reserves-assignades) 0)",
                "(= (places-lliures) 0)",
            ],
            4: [
                "(= (reserves-assignades) 0)",
                "(= (places-lliures) 0)",
                "(= (habitacions-obertes) 0)",
            ],
            5: []  # No s'escriu res
        }
        self.metrics = {
            1: [
                "  (:metric minimize (reserves-assignades))"
            ],
            2: [
                "  (:metric minimize\n"
                "    (+\n"
                "      (orientacions-incorrectes)\n" 
                "      (* 100 (reserves-assignades))\n"
                "    )\n"
                "  )",
            ],
            3: [
                "  (:metric minimize\n"
                "    (+\n"
                "      (places-lliures)\n" 
                "      (* 100 (reserves-assignades))\n"
                "    )\n"
                "  )",
            ],
            4: [
                "  (:metric minimize\n"
                "    (+\n"
                "      (places-lliures)\n" 
                "      (+ \n"
                "        (* 100 (habitacions-obertes))\n"
                "        (* 1000 (reserves-assignades))\n"
                "      )\n"
                "    )\n"
                "  )",
            ],
            5: []  # No s'escriu res

        }

    def generar_problema(self, num_habitacions: int, num_reserves: int, 
                        dies_max: int = 30, output_file: str = "problem-generated.pddl"):
        """
        Genera un problema PDDL aleatori
        
        Args:
            num_habitacions: Nombre d'habitacions (1-20)
            num_reserves: Nombre de reserves (1-50)
            output_file: Nom del fitxer de sortida
        """
        
        # Generar habitacions amb capacitats i orientacions aleatòries
        habitacions = []
        for i in range(1, num_habitacions + 1):
            capacitat = random.randint(1, 4)
            orientacio = random.choice(self.orientacions)
            habitacions.append((f"h{i}", capacitat, orientacio))
        
        # Generar reserves amb períodes aleatoris
        reserves = []
        for i in range(1, num_reserves + 1):
            persones = random.randint(1, 4)
            
            # Generar període de reserva (entre 1 i 15 dies)
            duracio = random.randint(1, min(15, dies_max))
            dia_inici = random.randint(1, dies_max - duracio + 1)
            dia_final = dia_inici + duracio - 1
            
            orientacio_pref = random.choice(self.orientacions)
            
            reserves.append((f"r{i}", persones, dia_inici, dia_final, orientacio_pref))
        
        # Escriure el fitxer PDDL
        self._escriure_pddl(habitacions, reserves, dies_max, output_file)
        
        return habitacions, reserves
    
    def _escriure_pddl(self, habitacions: List[Tuple], reserves: List[Tuple], 
                       dies_max: int, output_file: str):
        """Escriu el fitxer PDDL"""
        
        # Crear directori si no existeix
        output_dir = os.path.dirname(output_file)
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)

        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(f"(define (problem hotel-generated-{len(habitacions)}h-{len(reserves)}r)\n")
            f.write("  (:domain hotel-reserves)\n\n")
            
            # Objects
            f.write("  (:objects\n")
            
            # Habitacions
            f.write("    ;; Habitacions de l'hotel\n")
            hab_names = " ".join([h[0] for h in habitacions])
            f.write(f"    {hab_names} - habitacio\n\n")
            
            # Reserves
            f.write("    ;; Reserves a processar\n")
            res_names = " ".join([r[0] for r in reserves])
            f.write(f"    {res_names} - reserva\n\n")
            
            # Dies
            f.write("    ;; Dies del mes (1 al 30) \n")
            dies_str = " ".join([f"d{i}" for i in range(1, dies_max + 1)])
            f.write(f"    {dies_str} - dia\n")
            
            if self.extensio == 2:
                # Orientacions
                f.write("    ;; Orientacions\n")
                f.write("    nord sud est oest - orientacio\n")

            f.write("  )\n\n")   
            
            # Init
            f.write("  (:init\n")

            # Costs
            metric_costs =  self.metriques_costos.get(self.extensio, [])
            if metric_costs:
                f.write("    ;; === INICIALITZACIÓ MÈTRIQUES ===\n")
                for c in metric_costs:
                    f.write(f"    {c}\n")
                f.write("\n")

            # Habitacions
            f.write("    ;; === HABITACIONS ===\n")
            for h_name, capacitat, orientacio in habitacions:
                f.write(f"    (= (capacitat {h_name}) {capacitat}) ; Habitació {h_name}: Fins a {capacitat} persones\n")
                if self.extensio == 2:
                    f.write(f"    (te-orientacio {h_name} {orientacio})\n\n")
                # else: f.write(f"\n") 
            f.write(f"\n")

            # Reserves
            f.write("    ;; === RESERVES ===\n")
            for r_name, persones, dia_inici, dia_final, orientacio in reserves:
                f.write(f"    ;; Reserva {r_name}: {persones} persones, dies {dia_inici}-{dia_final}")

                if self.extensio == 2:
                    f.write(f", prefereix {orientacio}\n")
                else: f.write(f"\n")
                        
                f.write(f"    (= (num-persones {r_name}) {persones})\n")
                f.write(f"    (pendent {r_name})\n")
                if self.extensio == 3:
                    f.write(f"        (prefereix-orientacio {r_name} {orientacio})\n\n")
                
                # Dies de la reserva
                dies_reserva = " ".join([f"(dia-reserva {r_name} d{d})" for d in range(dia_inici, dia_final + 1)])
                f.write(f"    {dies_reserva}\n\n")
                
            f.write("  )\n\n")    
            
            # Goal
            f.write("  (:goal\n")
            if self.extensio == 5:
                f.write("    ;; Totes les reserves estan servides\n")
                f.write("    (forall (?r - reserva) (servida ?r))\n")
            else:
                f.write("    ;; Totes les reserves han estat processades\n")
                f.write("    (forall (?r - reserva) (not (pendent ?r)))\n")
            f.write("  )\n")

            # Metric
            metric_lines = self.metrics.get(self.extensio,[])
            if metric_lines:
                f.write("\n  ;; Minimitzar el cost\n")
                for line in metric_lines:
                    f.write(f"{line}\n")
            f.write(")\n")
        
        print(f"  Problema generat: {output_file}")
        print(f"  - {len(habitacions)} habitacions")
        print(f"  - {len(reserves)} reserves")


def generar_suite_proves():
    """Genera una suite completa de proves de mida creixent"""
    
    generator = ReservaGenerator(seed=42, extensio=4)
    
    configs = [
        (3, 3, 30, "./test/experiments/problem_1.pddl"),
        (4, 6, 30, "./test/experiments/problem_2.pddl"),
        (6, 10, 30, "./test/experiments/problem_3.pddl"),
        (8, 15, 30, "./test/experiments/problem_4.pddl"),
        (10, 20, 30, "./test/experiments/problem_5.pddl"),
    ]
    
    print("\n=== Generant suite de proves ===\n")
    
    for num_hab, num_res, dies, filename in configs:
        generator.generar_problema(num_hab, num_res, dies, filename)
    
    print("\n  Suite de proves generada correctament!")


def main():
    parser = argparse.ArgumentParser(
        description='Generador de problemes PDDL per assignació d\'habitacions d\'hotel'
    )
    
    parser.add_argument('-H', '--habitacions', type=int, default=5,
                       help='Nombre d\'habitacions (default: 5)')
    parser.add_argument('-r', '--reserves', type=int, default=8,
                       help='Nombre de reserves (default: 8)')
    parser.add_argument('-o', '--output', type=str, default='XXX_problema.pddl',
                       help='Fitxer de sortida (default: XXX_problema.pddl), on XXX és l\'extensió que es vol executar')
    parser.add_argument('-s', '--seed', type=int, default=None,
                       help='Llavor aleatòria per reproducibilitat')
    parser.add_argument('--suite', action='store_true', 
                        help='Genera una suite completa de proves')
    parser.add_argument('-e', '--extensio', type=int, default=5,           
                        help='Extensió del problema (default: 5)' )
    
    args = parser.parse_args()
    
    if args.suite:
        generar_suite_proves()
    else:
        generator = ReservaGenerator(seed=args.seed, extensio=args.extensio)
        
        if args.output == 'XXX_problema.pddl':
            if args.extensio != 5: 
                args.output = str(f"ext{args.extensio}_problema.pddl")
            else: args.output = "nivell_basic_problema.pddl"
            
        generator.generar_problema(
            args.habitacions, 
            args.reserves, 
            30,
            str(f"test/problems/{args.output}")
        )


if __name__ == "__main__":
    main()
