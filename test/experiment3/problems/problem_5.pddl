(define (problem hotel-generated-7h-8r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 - habitacio

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
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 3) ; Habitació h5: Fins a 3 persones
    (= (capacitat h6) 1) ; Habitació h6: Fins a 1 persones
    (= (capacitat h7) 2) ; Habitació h7: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 6-18
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d6) (dia-reserva r1 d7) (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18)

    ;; Reserva r2: 3 persones, dies 1-8
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d1) (dia-reserva r2 d2) (dia-reserva r2 d3) (dia-reserva r2 d4) (dia-reserva r2 d5) (dia-reserva r2 d6) (dia-reserva r2 d7) (dia-reserva r2 d8)

    ;; Reserva r3: 3 persones, dies 10-24
    (= (num-persones r3) 3)
    (pendent r3)
    (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12) (dia-reserva r3 d13) (dia-reserva r3 d14) (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24)

    ;; Reserva r4: 1 persones, dies 19-22
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22)

    ;; Reserva r5: 1 persones, dies 16-27
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d16) (dia-reserva r5 d17) (dia-reserva r5 d18) (dia-reserva r5 d19) (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24) (dia-reserva r5 d25) (dia-reserva r5 d26) (dia-reserva r5 d27)

    ;; Reserva r6: 2 persones, dies 22-24
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24)

    ;; Reserva r7: 2 persones, dies 17-21
    (= (num-persones r7) 2)
    (pendent r7)
    (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21)

    ;; Reserva r8: 2 persones, dies 7-21
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21)

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
