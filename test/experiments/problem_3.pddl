(define (problem hotel-generated-6h-10r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 1) ; Habitació h1: Fins a 1 persones
    (= (capacitat h2) 3) ; Habitació h2: Fins a 3 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones
    (= (capacitat h6) 2) ; Habitació h6: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 22-25
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25)

    ;; Reserva r2: 1 persones, dies 21-30
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d21) (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26) (dia-reserva r2 d27) (dia-reserva r2 d28) (dia-reserva r2 d29) (dia-reserva r2 d30)

    ;; Reserva r3: 2 persones, dies 15-17
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17)

    ;; Reserva r4: 3 persones, dies 8-22
    (= (num-persones r4) 3)
    (pendent r4)
    (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22)

    ;; Reserva r5: 1 persones, dies 27-30
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d27) (dia-reserva r5 d28) (dia-reserva r5 d29) (dia-reserva r5 d30)

    ;; Reserva r6: 3 persones, dies 9-15
    (= (num-persones r6) 3)
    (pendent r6)
    (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15)

    ;; Reserva r7: 2 persones, dies 11-25
    (= (num-persones r7) 2)
    (pendent r7)
    (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25)

    ;; Reserva r8: 4 persones, dies 21-27
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27)

    ;; Reserva r9: 2 persones, dies 5-9
    (= (num-persones r9) 2)
    (pendent r9)
    (dia-reserva r9 d5) (dia-reserva r9 d6) (dia-reserva r9 d7) (dia-reserva r9 d8) (dia-reserva r9 d9)

    ;; Reserva r10: 3 persones, dies 19-30
    (= (num-persones r10) 3)
    (pendent r10)
    (dia-reserva r10 d19) (dia-reserva r10 d20) (dia-reserva r10 d21) (dia-reserva r10 d22) (dia-reserva r10 d23) (dia-reserva r10 d24) (dia-reserva r10 d25) (dia-reserva r10 d26) (dia-reserva r10 d27) (dia-reserva r10 d28) (dia-reserva r10 d29) (dia-reserva r10 d30)

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
