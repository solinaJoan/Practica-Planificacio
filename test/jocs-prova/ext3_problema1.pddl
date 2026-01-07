(define (problem hotel-generated-6h-11r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 2) ; Habitació h1: Fins a 2 persones
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones
    (= (capacitat h6) 3) ; Habitació h6: Fins a 3 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 24-29
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29)

    ;; Reserva r2: 4 persones, dies 3-6
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d3) (dia-reserva r2 d4) (dia-reserva r2 d5) (dia-reserva r2 d6)

    ;; Reserva r3: 1 persones, dies 18-23
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23)

    ;; Reserva r4: 1 persones, dies 2-8
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d2) (dia-reserva r4 d3) (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8)

    ;; Reserva r5: 1 persones, dies 6-19
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16) (dia-reserva r5 d17) (dia-reserva r5 d18) (dia-reserva r5 d19)

    ;; Reserva r6: 1 persones, dies 2-8
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d2) (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5) (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8)

    ;; Reserva r7: 4 persones, dies 7-18
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d7) (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18)

    ;; Reserva r8: 3 persones, dies 19-24
    (= (num-persones r8) 3)
    (pendent r8)
    (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24)

    ;; Reserva r9: 3 persones, dies 16-26
    (= (num-persones r9) 3)
    (pendent r9)
    (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23) (dia-reserva r9 d24) (dia-reserva r9 d25) (dia-reserva r9 d26)

    ;; Reserva r10: 2 persones, dies 19-21
    (= (num-persones r10) 2)
    (pendent r10)
    (dia-reserva r10 d19) (dia-reserva r10 d20) (dia-reserva r10 d21)

    ;; Reserva r11: 2 persones, dies 5-13
    (= (num-persones r11) 2)
    (pendent r11)
    (dia-reserva r11 d5) (dia-reserva r11 d6) (dia-reserva r11 d7) (dia-reserva r11 d8) (dia-reserva r11 d9) (dia-reserva r11 d10) (dia-reserva r11 d11) (dia-reserva r11 d12) (dia-reserva r11 d13)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize
    (+
      (places-lliures)
      (* 100 (reserves-assignades))
    )
  )
)
