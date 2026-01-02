(define (problem hotel-generated-4h-9r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 - reserva

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
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 15-29
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29)

    ;; Reserva r2: 2 persones, dies 3-6
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d3) (dia-reserva r2 d4) (dia-reserva r2 d5) (dia-reserva r2 d6)

    ;; Reserva r3: 1 persones, dies 18-27
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24) (dia-reserva r3 d25) (dia-reserva r3 d26) (dia-reserva r3 d27)

    ;; Reserva r4: 2 persones, dies 3-3
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d3)

    ;; Reserva r5: 2 persones, dies 29-30
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d29) (dia-reserva r5 d30)

    ;; Reserva r6: 3 persones, dies 17-18
    (= (num-persones r6) 3)
    (pendent r6)
    (dia-reserva r6 d17) (dia-reserva r6 d18)

    ;; Reserva r7: 3 persones, dies 16-26
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25) (dia-reserva r7 d26)

    ;; Reserva r8: 2 persones, dies 19-30
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27) (dia-reserva r8 d28) (dia-reserva r8 d29) (dia-reserva r8 d30)

    ;; Reserva r9: 2 persones, dies 16-28
    (= (num-persones r9) 2)
    (pendent r9)
    (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23) (dia-reserva r9 d24) (dia-reserva r9 d25) (dia-reserva r9 d26) (dia-reserva r9 d27) (dia-reserva r9 d28)

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
