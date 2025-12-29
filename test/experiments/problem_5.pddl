(define (problem hotel-generated-10h-20r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 - reserva

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
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones
    (= (capacitat h6) 3) ; Habitació h6: Fins a 3 persones
    (= (capacitat h7) 2) ; Habitació h7: Fins a 2 persones
    (= (capacitat h8) 4) ; Habitació h8: Fins a 4 persones
    (= (capacitat h9) 4) ; Habitació h9: Fins a 4 persones
    (= (capacitat h10) 2) ; Habitació h10: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 14-24
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24)

    ;; Reserva r2: 4 persones, dies 15-21
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21)

    ;; Reserva r3: 1 persones, dies 13-13
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d13)

    ;; Reserva r4: 1 persones, dies 7-10
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10)

    ;; Reserva r5: 4 persones, dies 14-16
    (= (num-persones r5) 4)
    (pendent r5)
    (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16)

    ;; Reserva r6: 3 persones, dies 8-15
    (= (num-persones r6) 3)
    (pendent r6)
    (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15)

    ;; Reserva r7: 4 persones, dies 18-30
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25) (dia-reserva r7 d26) (dia-reserva r7 d27) (dia-reserva r7 d28) (dia-reserva r7 d29) (dia-reserva r7 d30)

    ;; Reserva r8: 1 persones, dies 18-28
    (= (num-persones r8) 1)
    (pendent r8)
    (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27) (dia-reserva r8 d28)

    ;; Reserva r9: 1 persones, dies 8-22
    (= (num-persones r9) 1)
    (pendent r9)
    (dia-reserva r9 d8) (dia-reserva r9 d9) (dia-reserva r9 d10) (dia-reserva r9 d11) (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22)

    ;; Reserva r10: 4 persones, dies 16-23
    (= (num-persones r10) 4)
    (pendent r10)
    (dia-reserva r10 d16) (dia-reserva r10 d17) (dia-reserva r10 d18) (dia-reserva r10 d19) (dia-reserva r10 d20) (dia-reserva r10 d21) (dia-reserva r10 d22) (dia-reserva r10 d23)

    ;; Reserva r11: 4 persones, dies 2-16
    (= (num-persones r11) 4)
    (pendent r11)
    (dia-reserva r11 d2) (dia-reserva r11 d3) (dia-reserva r11 d4) (dia-reserva r11 d5) (dia-reserva r11 d6) (dia-reserva r11 d7) (dia-reserva r11 d8) (dia-reserva r11 d9) (dia-reserva r11 d10) (dia-reserva r11 d11) (dia-reserva r11 d12) (dia-reserva r11 d13) (dia-reserva r11 d14) (dia-reserva r11 d15) (dia-reserva r11 d16)

    ;; Reserva r12: 4 persones, dies 13-13
    (= (num-persones r12) 4)
    (pendent r12)
    (dia-reserva r12 d13)

    ;; Reserva r13: 4 persones, dies 14-18
    (= (num-persones r13) 4)
    (pendent r13)
    (dia-reserva r13 d14) (dia-reserva r13 d15) (dia-reserva r13 d16) (dia-reserva r13 d17) (dia-reserva r13 d18)

    ;; Reserva r14: 2 persones, dies 10-13
    (= (num-persones r14) 2)
    (pendent r14)
    (dia-reserva r14 d10) (dia-reserva r14 d11) (dia-reserva r14 d12) (dia-reserva r14 d13)

    ;; Reserva r15: 1 persones, dies 18-27
    (= (num-persones r15) 1)
    (pendent r15)
    (dia-reserva r15 d18) (dia-reserva r15 d19) (dia-reserva r15 d20) (dia-reserva r15 d21) (dia-reserva r15 d22) (dia-reserva r15 d23) (dia-reserva r15 d24) (dia-reserva r15 d25) (dia-reserva r15 d26) (dia-reserva r15 d27)

    ;; Reserva r16: 3 persones, dies 2-2
    (= (num-persones r16) 3)
    (pendent r16)
    (dia-reserva r16 d2)

    ;; Reserva r17: 2 persones, dies 17-17
    (= (num-persones r17) 2)
    (pendent r17)
    (dia-reserva r17 d17)

    ;; Reserva r18: 2 persones, dies 20-21
    (= (num-persones r18) 2)
    (pendent r18)
    (dia-reserva r18 d20) (dia-reserva r18 d21)

    ;; Reserva r19: 2 persones, dies 4-10
    (= (num-persones r19) 2)
    (pendent r19)
    (dia-reserva r19 d4) (dia-reserva r19 d5) (dia-reserva r19 d6) (dia-reserva r19 d7) (dia-reserva r19 d8) (dia-reserva r19 d9) (dia-reserva r19 d10)

    ;; Reserva r20: 1 persones, dies 3-12
    (= (num-persones r20) 1)
    (pendent r20)
    (dia-reserva r20 d3) (dia-reserva r20 d4) (dia-reserva r20 d5) (dia-reserva r20 d6) (dia-reserva r20 d7) (dia-reserva r20 d8) (dia-reserva r20 d9) (dia-reserva r20 d10) (dia-reserva r20 d11) (dia-reserva r20 d12)

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
