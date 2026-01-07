(define (problem hotel-generated-6h-8r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 2) ; Habitació h1: Fins a 2 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones
    (= (capacitat h6) 4) ; Habitació h6: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 8-19
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19)

    ;; Reserva r2: 4 persones, dies 11-19
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19)

    ;; Reserva r3: 1 persones, dies 22-30
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24) (dia-reserva r3 d25) (dia-reserva r3 d26) (dia-reserva r3 d27) (dia-reserva r3 d28) (dia-reserva r3 d29) (dia-reserva r3 d30)

    ;; Reserva r4: 1 persones, dies 17-25
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22) (dia-reserva r4 d23) (dia-reserva r4 d24) (dia-reserva r4 d25)

    ;; Reserva r5: 2 persones, dies 7-10
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10)

    ;; Reserva r6: 2 persones, dies 12-19
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19)

    ;; Reserva r7: 4 persones, dies 17-30
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25) (dia-reserva r7 d26) (dia-reserva r7 d27) (dia-reserva r7 d28) (dia-reserva r7 d29) (dia-reserva r7 d30)

    ;; Reserva r8: 4 persones, dies 4-15
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d4) (dia-reserva r8 d5) (dia-reserva r8 d6) (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize
    (+
      (places-lliures)
      (+ 
        (* 100 (habitacions-obertes))
        (* 1000 (reserves-assignades))
      )
    )
  )
)
