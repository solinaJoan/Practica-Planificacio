(define (problem hotel-generated-5h-12r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === HABITACIONS ===
    (= (capacitat h1) 2) ; Habitació h1: Fins a 2 persones
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 2-6
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d2) (dia-reserva r1 d3) (dia-reserva r1 d4) (dia-reserva r1 d5) (dia-reserva r1 d6)

    ;; Reserva r2: 3 persones, dies 10-13
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13)

    ;; Reserva r3: 2 persones, dies 7-9
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9)

    ;; Reserva r4: 3 persones, dies 14-24
    (= (num-persones r4) 3)
    (pendent r4)
    (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22) (dia-reserva r4 d23) (dia-reserva r4 d24)

    ;; Reserva r5: 4 persones, dies 18-25
    (= (num-persones r5) 4)
    (pendent r5)
    (dia-reserva r5 d18) (dia-reserva r5 d19) (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24) (dia-reserva r5 d25)

    ;; Reserva r6: 4 persones, dies 28-30
    (= (num-persones r6) 4)
    (pendent r6)
    (dia-reserva r6 d28) (dia-reserva r6 d29) (dia-reserva r6 d30)

    ;; Reserva r7: 2 persones, dies 20-20
    (= (num-persones r7) 2)
    (pendent r7)
    (dia-reserva r7 d20)

    ;; Reserva r8: 2 persones, dies 6-18
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d6) (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18)

    ;; Reserva r9: 2 persones, dies 1-14
    (= (num-persones r9) 2)
    (pendent r9)
    (dia-reserva r9 d1) (dia-reserva r9 d2) (dia-reserva r9 d3) (dia-reserva r9 d4) (dia-reserva r9 d5) (dia-reserva r9 d6) (dia-reserva r9 d7) (dia-reserva r9 d8) (dia-reserva r9 d9) (dia-reserva r9 d10) (dia-reserva r9 d11) (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14)

    ;; Reserva r10: 4 persones, dies 13-25
    (= (num-persones r10) 4)
    (pendent r10)
    (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17) (dia-reserva r10 d18) (dia-reserva r10 d19) (dia-reserva r10 d20) (dia-reserva r10 d21) (dia-reserva r10 d22) (dia-reserva r10 d23) (dia-reserva r10 d24) (dia-reserva r10 d25)

    ;; Reserva r11: 1 persones, dies 8-17
    (= (num-persones r11) 1)
    (pendent r11)
    (dia-reserva r11 d8) (dia-reserva r11 d9) (dia-reserva r11 d10) (dia-reserva r11 d11) (dia-reserva r11 d12) (dia-reserva r11 d13) (dia-reserva r11 d14) (dia-reserva r11 d15) (dia-reserva r11 d16) (dia-reserva r11 d17)

    ;; Reserva r12: 3 persones, dies 22-30
    (= (num-persones r12) 3)
    (pendent r12)
    (dia-reserva r12 d22) (dia-reserva r12 d23) (dia-reserva r12 d24) (dia-reserva r12 d25) (dia-reserva r12 d26) (dia-reserva r12 d27) (dia-reserva r12 d28) (dia-reserva r12 d29) (dia-reserva r12 d30)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )
)
