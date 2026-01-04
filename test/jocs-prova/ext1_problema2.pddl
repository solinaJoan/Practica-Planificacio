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
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 3) ; Habitació h5: Fins a 3 persones

    ;; === RESERVES ===
    ;; Reserva r1: 2 persones, dies 14-24
    (= (num-persones r1) 2)
    (pendent r1)
    (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24)

    ;; Reserva r2: 1 persones, dies 8-21
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21)

    ;; Reserva r3: 4 persones, dies 20-24
    (= (num-persones r3) 4)
    (pendent r3)
    (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24)

    ;; Reserva r4: 4 persones, dies 8-22
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22)

    ;; Reserva r5: 1 persones, dies 11-12
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d11) (dia-reserva r5 d12)

    ;; Reserva r6: 1 persones, dies 14-26
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25) (dia-reserva r6 d26)

    ;; Reserva r7: 1 persones, dies 4-4
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d4)

    ;; Reserva r8: 2 persones, dies 11-19
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19)

    ;; Reserva r9: 3 persones, dies 13-18
    (= (num-persones r9) 3)
    (pendent r9)
    (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18)

    ;; Reserva r10: 1 persones, dies 8-21
    (= (num-persones r10) 1)
    (pendent r10)
    (dia-reserva r10 d8) (dia-reserva r10 d9) (dia-reserva r10 d10) (dia-reserva r10 d11) (dia-reserva r10 d12) (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17) (dia-reserva r10 d18) (dia-reserva r10 d19) (dia-reserva r10 d20) (dia-reserva r10 d21)

    ;; Reserva r11: 4 persones, dies 23-27
    (= (num-persones r11) 4)
    (pendent r11)
    (dia-reserva r11 d23) (dia-reserva r11 d24) (dia-reserva r11 d25) (dia-reserva r11 d26) (dia-reserva r11 d27)

    ;; Reserva r12: 3 persones, dies 16-26
    (= (num-persones r12) 3)
    (pendent r12)
    (dia-reserva r12 d16) (dia-reserva r12 d17) (dia-reserva r12 d18) (dia-reserva r12 d19) (dia-reserva r12 d20) (dia-reserva r12 d21) (dia-reserva r12 d22) (dia-reserva r12 d23) (dia-reserva r12 d24) (dia-reserva r12 d25) (dia-reserva r12 d26)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize (reserves-assignades))
)
