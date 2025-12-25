(define (problem hotel-basic-1)
    (:domain hotel-reservations)
    
    (:objects
        ;; Habitacions
        h1 h2 h3 - habitacio
        
        ;; Reserves
        r1 r2 r3 - reserva
        
        ;; Dies (1-10 per simplicitat en aquest exemple)
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - dia
        
        ;; Orientacions
        nord sud est oest - orientacio
    )
    
    (:init
        ;; === HABITACIONS ===
        ;; Habitació 1: capacitat 2, orientació nord
        (= (capacitat-habitacio h1) 2)
        (te-orientacio h1 nord)
        
        ;; Habitació 2: capacitat 3, orientació sud
        (= (capacitat-habitacio h2) 3)
        (te-orientacio h2 sud)
        
        ;; Habitació 3: capacitat 4, orientació est
        (= (capacitat-habitacio h3) 4)
        (te-orientacio h3 est)
        
        ;; === RESERVES ===
        ;; Reserva 1: 2 persones, dies 1-3, prefereix nord
        (= (persones-reserva r1) 2)
        (dia-reserva r1 d1)
        (dia-reserva r1 d2)
        (dia-reserva r1 d3)
        (prefereix-orientacio r1 nord)
        
        ;; Reserva 2: 3 persones, dies 5-7, prefereix sud
        (= (persones-reserva r2) 3)
        (dia-reserva r2 d5)
        (dia-reserva r2 d6)
        (dia-reserva r2 d7)
        (prefereix-orientacio r2 sud)
        
        ;; Reserva 3: 1 persona, dies 2-4, prefereix est
        (= (persones-reserva r3) 1)
        (dia-reserva r3 d2)
        (dia-reserva r3 d3)
        (dia-reserva r3 d4)
        (prefereix-orientacio r3 est)
        
        ;; === TOTS ELS DIES ESTAN LLIURES INICIALMENT ===
        (habitacio-lliure h1 d1) (habitacio-lliure h1 d2) (habitacio-lliure h1 d3)
        (habitacio-lliure h1 d4) (habitacio-lliure h1 d5) (habitacio-lliure h1 d6)
        (habitacio-lliure h1 d7) (habitacio-lliure h1 d8) (habitacio-lliure h1 d9)
        (habitacio-lliure h1 d10)
        
        (habitacio-lliure h2 d1) (habitacio-lliure h2 d2) (habitacio-lliure h2 d3)
        (habitacio-lliure h2 d4) (habitacio-lliure h2 d5) (habitacio-lliure h2 d6)
        (habitacio-lliure h2 d7) (habitacio-lliure h2 d8) (habitacio-lliure h2 d9)
        (habitacio-lliure h2 d10)
        
        (habitacio-lliure h3 d1) (habitacio-lliure h3 d2) (habitacio-lliure h3 d3)
        (habitacio-lliure h3 d4) (habitacio-lliure h3 d5) (habitacio-lliure h3 d6)
        (habitacio-lliure h3 d7) (habitacio-lliure h3 d8) (habitacio-lliure h3 d9)
        (habitacio-lliure h3 d10)
        
        ;; === INICIALITZACIÓ DE MÈTRIQUES ===
        (= (reserves-assignades) 0)
        (= (orientacions-correctes) 0)
        (= (desperdici-total) 0)
        (= (habitacions-obertes-total) 0)
        
        ;; === PESOS PER OPTIMITZACIÓ (Extensió 4) ===
        ;; Prioritat: reserves > habitacions > desperdici > orientació
        (= (pes-reserves) 1000)
        (= (pes-habitacions) 100)
        (= (pes-desperdici) 10)
        (= (pes-orientacio) 1)
    )
    
    (:goal (and
        ;; NIVELL BÀSIC: Totes les reserves assignades
        ;; (reserva-assignada r1)
        ;; (reserva-assignada r2)
        ;; (reserva-assignada r3)
        
        ;; EXTENSIÓ 1+: No cal especificar goal, optimitzem la métrica
        (>= (reserves-assignades) 0)
    ))
    
    ;; EXTENSIÓ 4: Funció a MINIMITZAR
    ;; Combina tots els criteris amb els seus pesos
    (:metric minimize (+ 
        ;; Penalitzem NO assignar reserves (pes més alt)
        (* (pes-reserves) (- 3 (reserves-assignades)))
        
        ;; Penalitzem obrir habitacions (pes alt)
        (* (pes-habitacions) (habitacions-obertes-total))
        
        ;; Penalitzem desperdici de places (pes mitjà)
        (* (pes-desperdici) (desperdici-total))
        
        ;; Bonifiquem orientacions correctes (pes baix)
        (* (pes-orientacio) (- 3 (orientacions-correctes)))
    ))
)
