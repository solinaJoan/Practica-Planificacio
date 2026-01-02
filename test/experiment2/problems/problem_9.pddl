(define (problem hotel-generated-4h-12r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 - reserva

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
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 15-17
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17)

    ;; Reserva r2: 1 persones, dies 18-28
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26) (dia-reserva r2 d27) (dia-reserva r2 d28)

    ;; Reserva r3: 1 persones, dies 5-19
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12) (dia-reserva r3 d13) (dia-reserva r3 d14) (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19)

    ;; Reserva r4: 1 persones, dies 4-18
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18)

    ;; Reserva r5: 3 persones, dies 20-24
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22) (dia-reserva r5 d23) (dia-reserva r5 d24)

    ;; Reserva r6: 3 persones, dies 22-25
    (= (num-persones r6) 3)
    (pendent r6)
    (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25)

    ;; Reserva r7: 4 persones, dies 2-6
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d2) (dia-reserva r7 d3) (dia-reserva r7 d4) (dia-reserva r7 d5) (dia-reserva r7 d6)

    ;; Reserva r8: 4 persones, dies 9-22
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22)

    ;; Reserva r9: 1 persones, dies 25-30
    (= (num-persones r9) 1)
    (pendent r9)
    (dia-reserva r9 d25) (dia-reserva r9 d26) (dia-reserva r9 d27) (dia-reserva r9 d28) (dia-reserva r9 d29) (dia-reserva r9 d30)

    ;; Reserva r10: 3 persones, dies 24-26
    (= (num-persones r10) 3)
    (pendent r10)
    (dia-reserva r10 d24) (dia-reserva r10 d25) (dia-reserva r10 d26)

    ;; Reserva r11: 4 persones, dies 1-9
    (= (num-persones r11) 4)
    (pendent r11)
    (dia-reserva r11 d1) (dia-reserva r11 d2) (dia-reserva r11 d3) (dia-reserva r11 d4) (dia-reserva r11 d5) (dia-reserva r11 d6) (dia-reserva r11 d7) (dia-reserva r11 d8) (dia-reserva r11 d9)

    ;; Reserva r12: 1 persones, dies 5-19
    (= (num-persones r12) 1)
    (pendent r12)
    (dia-reserva r12 d5) (dia-reserva r12 d6) (dia-reserva r12 d7) (dia-reserva r12 d8) (dia-reserva r12 d9) (dia-reserva r12 d10) (dia-reserva r12 d11) (dia-reserva r12 d12) (dia-reserva r12 d13) (dia-reserva r12 d14) (dia-reserva r12 d15) (dia-reserva r12 d16) (dia-reserva r12 d17) (dia-reserva r12 d18) (dia-reserva r12 d19)

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
