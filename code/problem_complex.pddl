(define (problem hotel-complex-1)
    (:domain hotel-reservations)
    
    (:objects
        ;; 6 Habitacions de diferents capacitats
        h1 h2 h3 h4 h5 h6 - habitacio
        
        ;; 8 Reserves amb solapaments i conflictes
        r1 r2 r3 r4 r5 r6 r7 r8 - reserva
        
        ;; Dies del mes (30 dies)
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
        d11 d12 d13 d14 d15 d16 d17 d18 d19 d20
        d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
        
        ;; Orientacions
        nord sud est oest - orientacio
    )
    
    (:init
        ;; === HABITACIONS ===
        (= (capacitat-habitacio h1) 1)
        (te-orientacio h1 nord)
        
        (= (capacitat-habitacio h2) 2)
        (te-orientacio h2 sud)
        
        (= (capacitat-habitacio h3) 2)
        (te-orientacio h3 est)
        
        (= (capacitat-habitacio h4) 3)
        (te-orientacio h4 oest)
        
        (= (capacitat-habitacio h5) 4)
        (te-orientacio h5 nord)
        
        (= (capacitat-habitacio h6) 4)
        (te-orientacio h6 sud)
        
        ;; === RESERVES ===
        ;; r1: 2 persones, dies 1-5, prefereix nord
        (= (persones-reserva r1) 2)
        (dia-reserva r1 d1) (dia-reserva r1 d2) (dia-reserva r1 d3)
        (dia-reserva r1 d4) (dia-reserva r1 d5)
        (prefereix-orientacio r1 nord)
        
        ;; r2: 1 persona, dies 3-7 (solapa amb r1), prefereix sud
        (= (persones-reserva r2) 1)
        (dia-reserva r2 d3) (dia-reserva r2 d4) (dia-reserva r2 d5)
        (dia-reserva r2 d6) (dia-reserva r2 d7)
        (prefereix-orientacio r2 sud)
        
        ;; r3: 4 persones, dies 1-10, prefereix est
        (= (persones-reserva r3) 4)
        (dia-reserva r3 d1) (dia-reserva r3 d2) (dia-reserva r3 d3)
        (dia-reserva r3 d4) (dia-reserva r3 d5) (dia-reserva r3 d6)
        (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9)
        (dia-reserva r3 d10)
        (prefereix-orientacio r3 est)
        
        ;; r4: 3 persones, dies 8-12, prefereix oest
        (= (persones-reserva r4) 3)
        (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10)
        (dia-reserva r4 d11) (dia-reserva r4 d12)
        (prefereix-orientacio r4 oest)
        
        ;; r5: 2 persones, dies 10-15, prefereix nord
        (= (persones-reserva r5) 2)
        (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12)
        (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15)
        (prefereix-orientacio r5 nord)
        
        ;; r6: 1 persona, dies 20-25, prefereix sud
        (= (persones-reserva r6) 1)
        (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22)
        (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25)
        (prefereix-orientacio r6 sud)
        
        ;; r7: 4 persones, dies 22-28, prefereix nord
        (= (persones-reserva r7) 4)
        (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24)
        (dia-reserva r7 d25) (dia-reserva r7 d26) (dia-reserva r7 d27)
        (dia-reserva r7 d28)
        (prefereix-orientacio r7 nord)
        
        ;; r8: 2 persones, dies 26-30, prefereix est
        (= (persones-reserva r8) 2)
        (dia-reserva r8 d26) (dia-reserva r8 d27) (dia-reserva r8 d28)
        (dia-reserva r8 d29) (dia-reserva r8 d30)
        (prefereix-orientacio r8 est)
        
        ;; === HABITACIONS LLIURES (tots els dies) ===
        ;; h1
        (habitacio-lliure h1 d1) (habitacio-lliure h1 d2) (habitacio-lliure h1 d3)
        (habitacio-lliure h1 d4) (habitacio-lliure h1 d5) (habitacio-lliure h1 d6)
        (habitacio-lliure h1 d7) (habitacio-lliure h1 d8) (habitacio-lliure h1 d9)
        (habitacio-lliure h1 d10) (habitacio-lliure h1 d11) (habitacio-lliure h1 d12)
        (habitacio-lliure h1 d13) (habitacio-lliure h1 d14) (habitacio-lliure h1 d15)
        (habitacio-lliure h1 d16) (habitacio-lliure h1 d17) (habitacio-lliure h1 d18)
        (habitacio-lliure h1 d19) (habitacio-lliure h1 d20) (habitacio-lliure h1 d21)
        (habitacio-lliure h1 d22) (habitacio-lliure h1 d23) (habitacio-lliure h1 d24)
        (habitacio-lliure h1 d25) (habitacio-lliure h1 d26) (habitacio-lliure h1 d27)
        (habitacio-lliure h1 d28) (habitacio-lliure h1 d29) (habitacio-lliure h1 d30)
        
        ;; h2
        (habitacio-lliure h2 d1) (habitacio-lliure h2 d2) (habitacio-lliure h2 d3)
        (habitacio-lliure h2 d4) (habitacio-lliure h2 d5) (habitacio-lliure h2 d6)
        (habitacio-lliure h2 d7) (habitacio-lliure h2 d8) (habitacio-lliure h2 d9)
        (habitacio-lliure h2 d10) (habitacio-lliure h2 d11) (habitacio-lliure h2 d12)
        (habitacio-lliure h2 d13) (habitacio-lliure h2 d14) (habitacio-lliure h2 d15)
        (habitacio-lliure h2 d16) (habitacio-lliure h2 d17) (habitacio-lliure h2 d18)
        (habitacio-lliure h2 d19) (habitacio-lliure h2 d20) (habitacio-lliure h2 d21)
        (habitacio-lliure h2 d22) (habitacio-lliure h2 d23) (habitacio-lliure h2 d24)
        (habitacio-lliure h2 d25) (habitacio-lliure h2 d26) (habitacio-lliure h2 d27)
        (habitacio-lliure h2 d28) (habitacio-lliure h2 d29) (habitacio-lliure h2 d30)
        
        ;; h3
        (habitacio-lliure h3 d1) (habitacio-lliure h3 d2) (habitacio-lliure h3 d3)
        (habitacio-lliure h3 d4) (habitacio-lliure h3 d5) (habitacio-lliure h3 d6)
        (habitacio-lliure h3 d7) (habitacio-lliure h3 d8) (habitacio-lliure h3 d9)
        (habitacio-lliure h3 d10) (habitacio-lliure h3 d11) (habitacio-lliure h3 d12)
        (habitacio-lliure h3 d13) (habitacio-lliure h3 d14) (habitacio-lliure h3 d15)
        (habitacio-lliure h3 d16) (habitacio-lliure h3 d17) (habitacio-lliure h3 d18)
        (habitacio-lliure h3 d19) (habitacio-lliure h3 d20) (habitacio-lliure h3 d21)
        (habitacio-lliure h3 d22) (habitacio-lliure h3 d23) (habitacio-lliure h3 d24)
        (habitacio-lliure h3 d25) (habitacio-lliure h3 d26) (habitacio-lliure h3 d27)
        (habitacio-lliure h3 d28) (habitacio-lliure h3 d29) (habitacio-lliure h3 d30)
        
        ;; h4
        (habitacio-lliure h4 d1) (habitacio-lliure h4 d2) (habitacio-lliure h4 d3)
        (habitacio-lliure h4 d4) (habitacio-lliure h4 d5) (habitacio-lliure h4 d6)
        (habitacio-lliure h4 d7) (habitacio-lliure h4 d8) (habitacio-lliure h4 d9)
        (habitacio-lliure h4 d10) (habitacio-lliure h4 d11) (habitacio-lliure h4 d12)
        (habitacio-lliure h4 d13) (habitacio-lliure h4 d14) (habitacio-lliure h4 d15)
        (habitacio-lliure h4 d16) (habitacio-lliure h4 d17) (habitacio-lliure h4 d18)
        (habitacio-lliure h4 d19) (habitacio-lliure h4 d20) (habitacio-lliure h4 d21)
        (habitacio-lliure h4 d22) (habitacio-lliure h4 d23) (habitacio-lliure h4 d24)
        (habitacio-lliure h4 d25) (habitacio-lliure h4 d26) (habitacio-lliure h4 d27)
        (habitacio-lliure h4 d28) (habitacio-lliure h4 d29) (habitacio-lliure h4 d30)
        
        ;; h5
        (habitacio-lliure h5 d1) (habitacio-lliure h5 d2) (habitacio-lliure h5 d3)
        (habitacio-lliure h5 d4) (habitacio-lliure h5 d5) (habitacio-lliure h5 d6)
        (habitacio-lliure h5 d7) (habitacio-lliure h5 d8) (habitacio-lliure h5 d9)
        (habitacio-lliure h5 d10) (habitacio-lliure h5 d11) (habitacio-lliure h5 d12)
        (habitacio-lliure h5 d13) (habitacio-lliure h5 d14) (habitacio-lliure h5 d15)
        (habitacio-lliure h5 d16) (habitacio-lliure h5 d17) (habitacio-lliure h5 d18)
        (habitacio-lliure h5 d19) (habitacio-lliure h5 d20) (habitacio-lliure h5 d21)
        (habitacio-lliure h5 d22) (habitacio-lliure h5 d23) (habitacio-lliure h5 d24)
        (habitacio-lliure h5 d25) (habitacio-lliure h5 d26) (habitacio-lliure h5 d27)
        (habitacio-lliure h5 d28) (habitacio-lliure h5 d29) (habitacio-lliure h5 d30)
        
        ;; h6
        (habitacio-lliure h6 d1) (habitacio-lliure h6 d2) (habitacio-lliure h6 d3)
        (habitacio-lliure h6 d4) (habitacio-lliure h6 d5) (habitacio-lliure h6 d6)
        (habitacio-lliure h6 d7) (habitacio-lliure h6 d8) (habitacio-lliure h6 d9)
        (habitacio-lliure h6 d10) (habitacio-lliure h6 d11) (habitacio-lliure h6 d12)
        (habitacio-lliure h6 d13) (habitacio-lliure h6 d14) (habitacio-lliure h6 d15)
        (habitacio-lliure h6 d16) (habitacio-lliure h6 d17) (habitacio-lliure h6 d18)
        (habitacio-lliure h6 d19) (habitacio-lliure h6 d20) (habitacio-lliure h6 d21)
        (habitacio-lliure h6 d22) (habitacio-lliure h6 d23) (habitacio-lliure h6 d24)
        (habitacio-lliure h6 d25) (habitacio-lliure h6 d26) (habitacio-lliure h6 d27)
        (habitacio-lliure h6 d28) (habitacio-lliure h6 d29) (habitacio-lliure h6 d30)
        
        ;; === INICIALITZACIÓ MÈTRIQUES ===
        (= (reserves-assignades) 0)
        (= (orientacions-correctes) 0)
        (= (desperdici-total) 0)
        (= (habitacions-obertes-total) 0)
        
        ;; === PESOS OPTIMITZACIÓ ===
        (= (pes-reserves) 1000)
        (= (pes-habitacions) 100)
        (= (pes-desperdici) 10)
        (= (pes-orientacio) 1)
    )
    
    (:goal (and
        (>= (reserves-assignades) 0)
    ))
    
    (:metric minimize (+ 
        (* (pes-reserves) (- 8 (reserves-assignades)))
        (* (pes-habitacions) (habitacions-obertes-total))
        (* (pes-desperdici) (desperdici-total))
        (* (pes-orientacio) (- 8 (orientacions-correctes)))
    ))
)
