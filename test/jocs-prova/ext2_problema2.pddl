(define (problem hotel-generated-7h-12r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
    ;; Orientacions
    nord sud est oest - orientacio
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (orientacions-incorrectes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (te-orientacio h1 est)

    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (te-orientacio h2 sud)

    (= (capacitat h3) 1) ; Habitació h3: Fins a 1 persones
    (te-orientacio h3 oest)

    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (te-orientacio h4 oest)

    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones
    (te-orientacio h5 nord)

    (= (capacitat h6) 1) ; Habitació h6: Fins a 1 persones
    (te-orientacio h6 nord)

    (= (capacitat h7) 4) ; Habitació h7: Fins a 4 persones
    (te-orientacio h7 est)


    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 6-7, prefereix nord
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d6) (dia-reserva r1 d7)

    ;; Reserva r2: 1 persones, dies 24-26, prefereix sud
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26)

    ;; Reserva r3: 1 persones, dies 18-24, prefereix sud
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24)

    ;; Reserva r4: 4 persones, dies 14-14, prefereix oest
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d14)

    ;; Reserva r5: 3 persones, dies 20-21, prefereix est
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d20) (dia-reserva r5 d21)

    ;; Reserva r6: 1 persones, dies 21-29, prefereix nord
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d21) (dia-reserva r6 d22) (dia-reserva r6 d23) (dia-reserva r6 d24) (dia-reserva r6 d25) (dia-reserva r6 d26) (dia-reserva r6 d27) (dia-reserva r6 d28) (dia-reserva r6 d29)

    ;; Reserva r7: 4 persones, dies 1-13, prefereix sud
    (= (num-persones r7) 4)
    (pendent r7)
    (dia-reserva r7 d1) (dia-reserva r7 d2) (dia-reserva r7 d3) (dia-reserva r7 d4) (dia-reserva r7 d5) (dia-reserva r7 d6) (dia-reserva r7 d7) (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13)

    ;; Reserva r8: 4 persones, dies 21-23, prefereix nord
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23)

    ;; Reserva r9: 4 persones, dies 12-24, prefereix oest
    (= (num-persones r9) 4)
    (pendent r9)
    (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16) (dia-reserva r9 d17) (dia-reserva r9 d18) (dia-reserva r9 d19) (dia-reserva r9 d20) (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23) (dia-reserva r9 d24)

    ;; Reserva r10: 2 persones, dies 3-3, prefereix sud
    (= (num-persones r10) 2)
    (pendent r10)
    (dia-reserva r10 d3)

    ;; Reserva r11: 2 persones, dies 15-23, prefereix est
    (= (num-persones r11) 2)
    (pendent r11)
    (dia-reserva r11 d15) (dia-reserva r11 d16) (dia-reserva r11 d17) (dia-reserva r11 d18) (dia-reserva r11 d19) (dia-reserva r11 d20) (dia-reserva r11 d21) (dia-reserva r11 d22) (dia-reserva r11 d23)

    ;; Reserva r12: 3 persones, dies 6-16, prefereix oest
    (= (num-persones r12) 3)
    (pendent r12)
    (dia-reserva r12 d6) (dia-reserva r12 d7) (dia-reserva r12 d8) (dia-reserva r12 d9) (dia-reserva r12 d10) (dia-reserva r12 d11) (dia-reserva r12 d12) (dia-reserva r12 d13) (dia-reserva r12 d14) (dia-reserva r12 d15) (dia-reserva r12 d16)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize
    (+
      (orientacions-incorrectes)
      (* 100 (reserves-assignades))
    )
  )
)
