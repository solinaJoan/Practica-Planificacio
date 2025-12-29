(define (problem hotel-generated-8h-15r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 4) ; Habitació h1: Fins a 4 persones
    (= (capacitat h2) 2) ; Habitació h2: Fins a 2 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones
    (= (capacitat h6) 4) ; Habitació h6: Fins a 4 persones
    (= (capacitat h7) 4) ; Habitació h7: Fins a 4 persones
    (= (capacitat h8) 4) ; Habitació h8: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 4-14
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d4) (dia-reserva r1 d5) (dia-reserva r1 d6) (dia-reserva r1 d7) (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14)

    ;; Reserva r2: 3 persones, dies 10-11
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d10) (dia-reserva r2 d11)

    ;; Reserva r3: 2 persones, dies 1-8
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d1) (dia-reserva r3 d2) (dia-reserva r3 d3) (dia-reserva r3 d4) (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8)

    ;; Reserva r4: 2 persones, dies 4-12
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12)

    ;; Reserva r5: 2 persones, dies 12-14
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14)

    ;; Reserva r6: 1 persones, dies 11-20
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20)

    ;; Reserva r7: 1 persones, dies 12-13
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d12) (dia-reserva r7 d13)

    ;; Reserva r8: 2 persones, dies 8-8
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d8)

    ;; Reserva r9: 1 persones, dies 16-27
    (= (num-persones r9) 1)
    (pendent r9)
    (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23) (dia-reserva r9 d24) (dia-reserva r9 d25) (dia-reserva r9 d26) (dia-reserva r9 d27)

    ;; Reserva r10: 2 persones, dies 22-24
    (= (num-persones r10) 2)
    (pendent r10)
    (dia-reserva r10 d22) (dia-reserva r10 d23) (dia-reserva r10 d24)

    ;; Reserva r11: 2 persones, dies 17-21
    (= (num-persones r11) 2)
    (pendent r11)
    (dia-reserva r11 d17) (dia-reserva r11 d18) (dia-reserva r11 d19) (dia-reserva r11 d20) (dia-reserva r11 d21)

    ;; Reserva r12: 2 persones, dies 7-21
    (= (num-persones r12) 2)
    (pendent r12)
    (dia-reserva r12 d7) (dia-reserva r12 d8) (dia-reserva r12 d9) (dia-reserva r12 d10) (dia-reserva r12 d11) (dia-reserva r12 d12) (dia-reserva r12 d13) (dia-reserva r12 d14) (dia-reserva r12 d15) (dia-reserva r12 d16) (dia-reserva r12 d17) (dia-reserva r12 d18) (dia-reserva r12 d19) (dia-reserva r12 d20) (dia-reserva r12 d21)

    ;; Reserva r13: 4 persones, dies 12-22
    (= (num-persones r13) 4)
    (pendent r13)
    (dia-reserva r13 d12) (dia-reserva r13 d13) (dia-reserva r13 d14) (dia-reserva r13 d15) (dia-reserva r13 d16) (dia-reserva r13 d17) (dia-reserva r13 d18) (dia-reserva r13 d19) (dia-reserva r13 d20) (dia-reserva r13 d21) (dia-reserva r13 d22)

    ;; Reserva r14: 4 persones, dies 8-9
    (= (num-persones r14) 4)
    (pendent r14)
    (dia-reserva r14 d8) (dia-reserva r14 d9)

    ;; Reserva r15: 1 persones, dies 1-6
    (= (num-persones r15) 1)
    (pendent r15)
    (dia-reserva r15 d1) (dia-reserva r15 d2) (dia-reserva r15 d3) (dia-reserva r15 d4) (dia-reserva r15 d5) (dia-reserva r15 d6)

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
