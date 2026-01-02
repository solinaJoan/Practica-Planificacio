(define (problem hotel-generated-4h-11r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 - reserva

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
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 3) ; Habitació h4: Fins a 3 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 18-27
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27)

    ;; Reserva r2: 3 persones, dies 2-2
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d2)

    ;; Reserva r3: 2 persones, dies 17-17
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d17)

    ;; Reserva r4: 2 persones, dies 20-21
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d20) (dia-reserva r4 d21)

    ;; Reserva r5: 2 persones, dies 4-10
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d4) (dia-reserva r5 d5) (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10)

    ;; Reserva r6: 1 persones, dies 3-12
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5) (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12)

    ;; Reserva r7: 3 persones, dies 9-23
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23)

    ;; Reserva r8: 3 persones, dies 9-12
    (= (num-persones r8) 3)
    (pendent r8)
    (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12)

    ;; Reserva r9: 2 persones, dies 10-20
    (= (num-persones r9) 2)
    (pendent r9)
    (dia-reserva r9 d10) (dia-reserva r9 d11) (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20)

    ;; Reserva r10: 3 persones, dies 3-17
    (= (num-persones r10) 3)
    (pendent r10)
    (dia-reserva r10 d3) (dia-reserva r10 d4) (dia-reserva r10 d5) (dia-reserva r10 d6) (dia-reserva r10 d7) (dia-reserva r10 d8) (dia-reserva r10 d9) (dia-reserva r10 d10) (dia-reserva r10 d11) (dia-reserva r10 d12) (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17)

    ;; Reserva r11: 4 persones, dies 19-28
    (= (num-persones r11) 4)
    (pendent r11)
    (dia-reserva r11 d19) (dia-reserva r11 d20) (dia-reserva r11 d21) (dia-reserva r11 d22) (dia-reserva r11 d23) (dia-reserva r11 d24) (dia-reserva r11 d25) (dia-reserva r11 d26) (dia-reserva r11 d27) (dia-reserva r11 d28)

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
