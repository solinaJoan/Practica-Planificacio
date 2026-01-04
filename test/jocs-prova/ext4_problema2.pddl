(define (problem hotel-generated-12h-16r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 - reserva

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
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 1) ; Habitació h3: Fins a 1 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones
    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones
    (= (capacitat h6) 2) ; Habitació h6: Fins a 2 persones
    (= (capacitat h7) 4) ; Habitació h7: Fins a 4 persones
    (= (capacitat h8) 3) ; Habitació h8: Fins a 3 persones
    (= (capacitat h9) 4) ; Habitació h9: Fins a 4 persones
    (= (capacitat h10) 1) ; Habitació h10: Fins a 1 persones
    (= (capacitat h11) 2) ; Habitació h11: Fins a 2 persones
    (= (capacitat h12) 4) ; Habitació h12: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 18-30
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29) (dia-reserva r1 d30)

    ;; Reserva r2: 2 persones, dies 6-14
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d6) (dia-reserva r2 d7) (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14)

    ;; Reserva r3: 3 persones, dies 10-12
    (= (num-persones r3) 3)
    (pendent r3)
    (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12)

    ;; Reserva r4: 1 persones, dies 1-6
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d1) (dia-reserva r4 d2) (dia-reserva r4 d3) (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6)

    ;; Reserva r5: 3 persones, dies 18-26
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d18) (dia-reserva r5 d19) (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24) (dia-reserva r5 d25) (dia-reserva r5 d26)

    ;; Reserva r6: 2 persones, dies 10-24
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24)

    ;; Reserva r7: 3 persones, dies 8-18
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18)

    ;; Reserva r8: 3 persones, dies 16-25
    (= (num-persones r8) 3)
    (pendent r8)
    (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25)

    ;; Reserva r9: 3 persones, dies 15-21
    (= (num-persones r9) 3)
    (pendent r9)
    (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21)

    ;; Reserva r10: 4 persones, dies 9-18
    (= (num-persones r10) 4)
    (pendent r10)
    (dia-reserva r10 d9) (dia-reserva r10 d10) (dia-reserva r10 d11) (dia-reserva r10 d12) (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17) (dia-reserva r10 d18)

    ;; Reserva r11: 3 persones, dies 2-2
    (= (num-persones r11) 3)
    (pendent r11)
    (dia-reserva r11 d2)

    ;; Reserva r12: 4 persones, dies 3-13
    (= (num-persones r12) 4)
    (pendent r12)
    (dia-reserva r12 d3) (dia-reserva r12 d4) (dia-reserva r12 d5) (dia-reserva r12 d6) (dia-reserva r12 d7) (dia-reserva r12 d8) (dia-reserva r12 d9) (dia-reserva r12 d10) (dia-reserva r12 d11) (dia-reserva r12 d12) (dia-reserva r12 d13)

    ;; Reserva r13: 3 persones, dies 1-14
    (= (num-persones r13) 3)
    (pendent r13)
    (dia-reserva r13 d1) (dia-reserva r13 d2) (dia-reserva r13 d3) (dia-reserva r13 d4) (dia-reserva r13 d5) (dia-reserva r13 d6) (dia-reserva r13 d7) (dia-reserva r13 d8) (dia-reserva r13 d9) (dia-reserva r13 d10) (dia-reserva r13 d11) (dia-reserva r13 d12) (dia-reserva r13 d13) (dia-reserva r13 d14)

    ;; Reserva r14: 2 persones, dies 5-8
    (= (num-persones r14) 2)
    (pendent r14)
    (dia-reserva r14 d5) (dia-reserva r14 d6) (dia-reserva r14 d7) (dia-reserva r14 d8)

    ;; Reserva r15: 3 persones, dies 10-15
    (= (num-persones r15) 3)
    (pendent r15)
    (dia-reserva r15 d10) (dia-reserva r15 d11) (dia-reserva r15 d12) (dia-reserva r15 d13) (dia-reserva r15 d14) (dia-reserva r15 d15)

    ;; Reserva r16: 2 persones, dies 13-27
    (= (num-persones r16) 2)
    (pendent r16)
    (dia-reserva r16 d13) (dia-reserva r16 d14) (dia-reserva r16 d15) (dia-reserva r16 d16) (dia-reserva r16 d17) (dia-reserva r16 d18) (dia-reserva r16 d19) (dia-reserva r16 d20) (dia-reserva r16 d21) (dia-reserva r16 d22) (dia-reserva r16 d23) (dia-reserva r16 d24) (dia-reserva r16 d25) (dia-reserva r16 d26) (dia-reserva r16 d27)

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
