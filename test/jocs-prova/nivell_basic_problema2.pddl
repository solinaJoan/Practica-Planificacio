(define (problem hotel-generated-4h-10r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === HABITACIONS ===
    (= (capacitat h1) 1) ; Habitació h1: Fins a 1 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 9-16
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d9) (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16)

    ;; Reserva r2: 4 persones, dies 7-10
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d7) (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10)

    ;; Reserva r3: 3 persones, dies 13-24
    (= (num-persones r3) 3)
    (pendent r3)
    (dia-reserva r3 d13) (dia-reserva r3 d14) (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24)

    ;; Reserva r4: 1 persones, dies 14-21
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21)

    ;; Reserva r5: 4 persones, dies 21-25
    (= (num-persones r5) 4)
    (pendent r5)
    (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24) (dia-reserva r5 d25)

    ;; Reserva r6: 2 persones, dies 5-18
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d5) (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18)

    ;; Reserva r7: 4 persones, dies 28-30
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d28) (dia-reserva r7 d29) (dia-reserva r7 d30)

    ;; Reserva r8: 4 persones, dies 4-11
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d4) (dia-reserva r8 d5) (dia-reserva r8 d6) (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11)

    ;; Reserva r9: 3 persones, dies 4-16
    (= (num-persones r9) 3)
    (pendent r9)
    (dia-reserva r9 d4) (dia-reserva r9 d5) (dia-reserva r9 d6) (dia-reserva r9 d7) (dia-reserva r9 d8) (dia-reserva r9 d9) (dia-reserva r9 d10) (dia-reserva r9 d11) (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16)

    ;; Reserva r10: 2 persones, dies 2-12
    (= (num-persones r10) 2)
    (pendent r10)
    (dia-reserva r10 d2) (dia-reserva r10 d3) (dia-reserva r10 d4) (dia-reserva r10 d5) (dia-reserva r10 d6) (dia-reserva r10 d7) (dia-reserva r10 d8) (dia-reserva r10 d9) (dia-reserva r10 d10) (dia-reserva r10 d11) (dia-reserva r10 d12)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )
)
