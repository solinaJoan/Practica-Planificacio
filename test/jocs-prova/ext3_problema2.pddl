(define (problem hotel-generated-8h-14r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 4) ; Habitació h1: Fins a 4 persones
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones
    (= (capacitat h6) 2) ; Habitació h6: Fins a 2 persones
    (= (capacitat h7) 4) ; Habitació h7: Fins a 4 persones
    (= (capacitat h8) 3) ; Habitació h8: Fins a 3 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 2-7
    (= (num-persones r1) 3)
    (pendent r1)
        (prefereix-orientacio r1 sud)

    (dia-reserva r1 d2) (dia-reserva r1 d3) (dia-reserva r1 d4) (dia-reserva r1 d5) (dia-reserva r1 d6) (dia-reserva r1 d7)

    ;; Reserva r2: 2 persones, dies 19-26
    (= (num-persones r2) 2)
    (pendent r2)
        (prefereix-orientacio r2 sud)

    (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26)

    ;; Reserva r3: 1 persones, dies 1-12
    (= (num-persones r3) 1)
    (pendent r3)
        (prefereix-orientacio r3 sud)

    (dia-reserva r3 d1) (dia-reserva r3 d2) (dia-reserva r3 d3) (dia-reserva r3 d4) (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12)

    ;; Reserva r4: 2 persones, dies 20-22
    (= (num-persones r4) 2)
    (pendent r4)
        (prefereix-orientacio r4 sud)

    (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22)

    ;; Reserva r5: 1 persones, dies 8-22
    (= (num-persones r5) 1)
    (pendent r5)
        (prefereix-orientacio r5 est)

    (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16) (dia-reserva r5 d17) (dia-reserva r5 d18) (dia-reserva r5 d19) (dia-reserva r5 d20) (dia-reserva r5 d21) (dia-reserva r5 d22)

    ;; Reserva r6: 4 persones, dies 11-20
    (= (num-persones r6) 4)
    (pendent r6)
        (prefereix-orientacio r6 est)

    (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20)

    ;; Reserva r7: 3 persones, dies 21-21
    (= (num-persones r7) 3)
    (pendent r7)
        (prefereix-orientacio r7 oest)

    (dia-reserva r7 d21)

    ;; Reserva r8: 4 persones, dies 14-27
    (= (num-persones r8) 4)
    (pendent r8)
        (prefereix-orientacio r8 oest)

    (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27)

    ;; Reserva r9: 2 persones, dies 17-17
    (= (num-persones r9) 2)
    (pendent r9)
        (prefereix-orientacio r9 nord)

    (dia-reserva r9 d17)

    ;; Reserva r10: 3 persones, dies 11-17
    (= (num-persones r10) 3)
    (pendent r10)
        (prefereix-orientacio r10 oest)

    (dia-reserva r10 d11) (dia-reserva r10 d12) (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17)

    ;; Reserva r11: 4 persones, dies 3-9
    (= (num-persones r11) 4)
    (pendent r11)
        (prefereix-orientacio r11 oest)

    (dia-reserva r11 d3) (dia-reserva r11 d4) (dia-reserva r11 d5) (dia-reserva r11 d6) (dia-reserva r11 d7) (dia-reserva r11 d8) (dia-reserva r11 d9)

    ;; Reserva r12: 1 persones, dies 12-23
    (= (num-persones r12) 1)
    (pendent r12)
        (prefereix-orientacio r12 est)

    (dia-reserva r12 d12) (dia-reserva r12 d13) (dia-reserva r12 d14) (dia-reserva r12 d15) (dia-reserva r12 d16) (dia-reserva r12 d17) (dia-reserva r12 d18) (dia-reserva r12 d19) (dia-reserva r12 d20) (dia-reserva r12 d21) (dia-reserva r12 d22) (dia-reserva r12 d23)

    ;; Reserva r13: 3 persones, dies 18-23
    (= (num-persones r13) 3)
    (pendent r13)
        (prefereix-orientacio r13 oest)

    (dia-reserva r13 d18) (dia-reserva r13 d19) (dia-reserva r13 d20) (dia-reserva r13 d21) (dia-reserva r13 d22) (dia-reserva r13 d23)

    ;; Reserva r14: 2 persones, dies 16-16
    (= (num-persones r14) 2)
    (pendent r14)
        (prefereix-orientacio r14 est)

    (dia-reserva r14 d16)

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
