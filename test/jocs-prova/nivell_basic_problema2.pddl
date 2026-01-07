(define (problem hotel-generated-6h-7r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === HABITACIONS ===
    (= (capacitat h1) 4) ; Habitació h1: Fins a 4 persones
    (= (capacitat h2) 2) ; Habitació h2: Fins a 2 persones
    (= (capacitat h3) 1) ; Habitació h3: Fins a 1 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones
    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones
    (= (capacitat h6) 4) ; Habitació h6: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 19-29
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29)

    ;; Reserva r2: 2 persones, dies 22-28
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26) (dia-reserva r2 d27) (dia-reserva r2 d28)

    ;; Reserva r3: 4 persones, dies 7-11
    (= (num-persones r3) 4)
    (pendent r3)
    (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11)

    ;; Reserva r4: 4 persones, dies 8-19
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19)

    ;; Reserva r5: 4 persones, dies 20-25
    (= (num-persones r5) 4)
    (pendent r5)
    (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24) (dia-reserva r5 d25)

    ;; Reserva r6: 2 persones, dies 11-25
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25)

    ;; Reserva r7: 3 persones, dies 12-23
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )
)
