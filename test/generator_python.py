#!/usr/bin/env python3
"""
Generador de problemes PDDL per la pràctica d'assignació d'habitacions d'hotel
Genera problemes aleatoris de mida variable per experimentar amb el rendiment
"""

import random
import argparse
from typing import List, Tuple

class ReservaGenerator:
    def __init__(self, seed=None):
        if seed:
            random.seed(seed)
        self.orientacions = ["nord", "sud", "est", "oest"]
    
    def generar_problema(self, num_habitacions: int, num_reserves: int, 
                        dies_max: int = 30, output_file: str = "problem-generated.pddl"):
        """
        Genera un problema PDDL aleatori
        
        Args:
            num_habitacions: Nombre d'habitacions (1-20)
            num_reserves: Nombre de reserves (1-50)
            dies_max: Dies del mes (màxim 30)
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
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(f"(define (problem hotel-generated-{len(habitacions)}h-{len(reserves)}r)\n")
            f.write("    (:domain hotel-reservations)\n\n")
            
            # Objects
            f.write("    (:objects\n")
            
            # Habitacions
            f.write("        ;; Habitacions\n")
            hab_names = " ".join([h[0] for h in habitacions])
            f.write(f"        {hab_names} - habitacio\n\n")
            
            # Reserves
            f.write("        ;; Reserves\n")
            res_names = " ".join([r[0] for r in reserves])
            f.write(f"        {res_names} - reserva\n\n")
            
            # Dies
            f.write("        ;; Dies\n")
            dies_str = " ".join([f"d{i}" for i in range(1, dies_max + 1)])
            # Dividir en línies de 10 dies
            dies_list = [f"d{i}" for i in range(1, dies_max + 1)]
            for i in range(0, len(dies_list), 10):
                chunk = " ".join(dies_list[i:i+10])
                f.write(f"        {chunk}\n")
            f.write("         - dia\n\n")
            
            # Orientacions
            f.write("        ;; Orientacions\n")
            f.write("        nord sud est oest - orientacio\n")
            f.write("    )\n\n")
            
            # Init
            f.write("    (:init\n")
            
            # Habitacions
            f.write("        ;; === HABITACIONS ===\n")
            for h_name, capacitat, orientacio in habitacions:
                f.write(f"        (= (capacitat-habitacio {h_name}) {capacitat})\n")
                f.write(f"        (te-orientacio {h_name} {orientacio})\n\n")
            
            # Reserves
            f.write("        ;; === RESERVES ===\n")
            for r_name, persones, dia_inici, dia_final, orientacio in reserves:
                f.write(f"        ;; {r_name}: {persones} persones, dies {dia_inici}-{dia_final}, prefereix {orientacio}\n")
                f.write(f"        (= (persones-reserva {r_name}) {persones})\n")
                
                # Dies de la reserva
                dies_reserva = " ".join([f"(dia-reserva {r_name} d{d})" for d in range(dia_inici, dia_final + 1)])
                f.write(f"        {dies_reserva}\n")
                f.write(f"        (prefereix-orientacio {r_name} {orientacio})\n\n")
            
            # Habitacions lliures
            f.write("        ;; === HABITACIONS LLIURES (tots els dies) ===\n")
            for h_name, _, _ in habitacions:
                f.write(f"        ;; {h_name}\n")
                for i in range(1, dies_max + 1, 10):
                    chunk = " ".join([f"(habitacio-lliure {h_name} d{d})" for d in range(i, min(i+10, dies_max+1))])
                    f.write(f"        {chunk}\n")
                f.write("\n")
            
            # Mètriques
            f.write("        ;; === INICIALITZACIÓ MÈTRIQUES ===\n")
            f.write("        (= (reserves-assignades) 0)\n")
            f.write("        (= (orientacions-correctes) 0)\n")
            f.write("        (= (desperdici-total) 0)\n")
            f.write("        (= (habitacions-obertes-total) 0)\n\n")
            
            # Pesos
            f.write("        ;; === PESOS OPTIMITZACIÓ ===\n")
            f.write("        (= (pes-reserves) 1000)\n")
            f.write("        (= (pes-habitacions) 100)\n")
            f.write("        (= (pes-desperdici) 10)\n")
            f.write("        (= (pes-orientacio) 1)\n")
            f.write("    )\n\n")
            
            # Goal
            f.write("    (:goal (and\n")
            f.write("        (>= (reserves-assignades) 0)\n")
            f.write("    ))\n\n")
            
            # Metric
            f.write("    (:metric minimize (+ \n")
            f.write(f"        (* (pes-reserves) (- {len(reserves)} (reserves-assignades)))\n")
            f.write("        (* (pes-habitacions) (habitacions-obertes-total))\n")
            f.write("        (* (pes-desperdici) (desperdici-total))\n")
            f.write(f"        (* (pes-orientacio) (- {len(reserves)} (orientacions-correctes)))\n")
            f.write("    ))\n")
            f.write(")\n")
        
        print(f"✓ Problema generat: {output_file}")
        print(f"  - {len(habitacions)} habitacions")
        print(f"  - {len(reserves)} reserves")
        print(f"  - {dies_max} dies")


def generar_suite_proves():
    """Genera una suite completa de proves de mida creixent"""
    
    generator = ReservaGenerator(seed=42)
    
    configs = [
        (3, 3, 10, "problem-petit.pddl"),
        (4, 6, 15, "problem-mitja.pddl"),
        (6, 10, 20, "problem-gran.pddl"),
        (8, 15, 25, "problem-molt-gran.pddl"),
        (10, 20, 30, "problem-extrem.pddl"),
    ]
    
    print("\n=== Generant suite de proves ===\n")
    
    for num_hab, num_res, dies, filename in configs:
        generator.generar_problema(num_hab, num_res, dies, filename)
    
    print("\n✓ Suite de proves generada correctament!")


def main():
    parser = argparse.ArgumentParser(
        description='Generador de problemes PDDL per assignació d\'habitacions d\'hotel'
    )
    
    parser.add_argument('-H', '--habitacions', type=int, default=5,
                       help='Nombre d\'habitacions (default: 5)')
    parser.add_argument('-r', '--reserves', type=int, default=8,
                       help='Nombre de reserves (default: 8)')
    parser.add_argument('-d', '--dies', type=int, default=30,
                       help='Dies del mes (default: 30, màxim: 30)')
    parser.add_argument('-o', '--output', type=str, default='problem-generated.pddl',
                       help='Fitxer de sortida (default: problem-generated.pddl)')
    parser.add_argument('-s', '--seed', type=int, default=None,
                       help='Llavor aleatòria per reproducibilitat')
    parser.add_argument('--suite', action='store_true',
                       help='Genera una suite completa de proves')
    
    args = parser.parse_args()
    
    if args.suite:
        generar_suite_proves()
    else:
        generator = ReservaGenerator(seed=args.seed)
        generator.generar_problema(
            args.habitacions, 
            args.reserves, 
            min(args.dies, 30),
            args.output
        )


if __name__ == "__main__":
    main()
