(define (problem hotel-generated-5h-8r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === HABITACIONS ===
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (= (capacitat h2) 2) ; Habitació h2: Fins a 2 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 3) ; Habitació h4: Fins a 3 persones
    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 14-25
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25)

    ;; Reserva r2: 2 persones, dies 11-22
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22)

    ;; Reserva r3: 4 persones, dies 8-18
    (= (num-persones r3) 4)
    (pendent r3)
    (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12) (dia-reserva r3 d13) (dia-reserva r3 d14) (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18)

    ;; Reserva r4: 2 persones, dies 4-15
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15)

    ;; Reserva r5: 1 persones, dies 10-12
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12)

    ;; Reserva r6: 2 persones, dies 9-20
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20)

    ;; Reserva r7: 2 persones, dies 26-26
    (= (num-persones r7) 2)
    (pendent r7)
    (dia-reserva r7 d26)

    ;; Reserva r8: 1 persones, dies 24-30
    (= (num-persones r8) 1)
    (pendent r8)
    (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27) (dia-reserva r8 d28) (dia-reserva r8 d29) (dia-reserva r8 d30)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )
)
