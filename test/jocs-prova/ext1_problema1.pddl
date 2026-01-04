(define (problem hotel-generated-4h-15r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 11-17
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17)

    ;; Reserva r2: 2 persones, dies 8-18
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18)

    ;; Reserva r3: 1 persones, dies 3-14
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d3) (dia-reserva r3 d4) (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12) (dia-reserva r3 d13) (dia-reserva r3 d14)

    ;; Reserva r4: 3 persones, dies 3-17
    (= (num-persones r4) 3)
    (pendent r4)
    (dia-reserva r4 d3) (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17)

    ;; Reserva r5: 3 persones, dies 3-3
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d3)

    ;; Reserva r6: 2 persones, dies 13-25
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25)

    ;; Reserva r7: 1 persones, dies 6-15
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d6) (dia-reserva r7 d7) (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15)

    ;; Reserva r8: 4 persones, dies 2-9
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d2) (dia-reserva r8 d3) (dia-reserva r8 d4) (dia-reserva r8 d5) (dia-reserva r8 d6) (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9)

    ;; Reserva r9: 2 persones, dies 13-23
    (= (num-persones r9) 2)
    (pendent r9)
    (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23)

    ;; Reserva r10: 4 persones, dies 27-30
    (= (num-persones r10) 4)
    (pendent r10)
    (dia-reserva r10 d27) (dia-reserva r10 d28) (dia-reserva r10 d29) (dia-reserva r10 d30)

    ;; Reserva r11: 2 persones, dies 17-29
    (= (num-persones r11) 2)
    (pendent r11)
    (dia-reserva r11 d17) (dia-reserva r11 d18) (dia-reserva r11 d19) (dia-reserva r11 d20) (dia-reserva r11 d21) (dia-reserva r11 d22) (dia-reserva r11 d23) (dia-reserva r11 d24) (dia-reserva r11 d25) (dia-reserva r11 d26) (dia-reserva r11 d27) (dia-reserva r11 d28) (dia-reserva r11 d29)

    ;; Reserva r12: 4 persones, dies 8-14
    (= (num-persones r12) 4)
    (pendent r12)
    (dia-reserva r12 d8) (dia-reserva r12 d9) (dia-reserva r12 d10) (dia-reserva r12 d11) (dia-reserva r12 d12) (dia-reserva r12 d13) (dia-reserva r12 d14)

    ;; Reserva r13: 4 persones, dies 25-27
    (= (num-persones r13) 4)
    (pendent r13)
    (dia-reserva r13 d25) (dia-reserva r13 d26) (dia-reserva r13 d27)

    ;; Reserva r14: 1 persones, dies 22-26
    (= (num-persones r14) 1)
    (pendent r14)
    (dia-reserva r14 d22) (dia-reserva r14 d23) (dia-reserva r14 d24) (dia-reserva r14 d25) (dia-reserva r14 d26)

    ;; Reserva r15: 2 persones, dies 2-11
    (= (num-persones r15) 2)
    (pendent r15)
    (dia-reserva r15 d2) (dia-reserva r15 d3) (dia-reserva r15 d4) (dia-reserva r15 d5) (dia-reserva r15 d6) (dia-reserva r15 d7) (dia-reserva r15 d8) (dia-reserva r15 d9) (dia-reserva r15 d10) (dia-reserva r15 d11)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize (reserves-assignades))
)
