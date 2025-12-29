(define (problem hotel-generated-5h-8r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 2) ; Habitació h1: Fins a 2 persones
    (= (capacitat h2) 2) ; Habitació h2: Fins a 2 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 3) ; Habitació h4: Fins a 3 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 19-29
    (= (num-persones r1) 1)
    (pendent r1)
        (prefereix-orientacio r1 est)

    (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29)

    ;; Reserva r2: 3 persones, dies 6-8
    (= (num-persones r2) 3)
    (pendent r2)
        (prefereix-orientacio r2 oest)

    (dia-reserva r2 d6) (dia-reserva r2 d7) (dia-reserva r2 d8)

    ;; Reserva r3: 1 persones, dies 28-28
    (= (num-persones r3) 1)
    (pendent r3)
        (prefereix-orientacio r3 nord)

    (dia-reserva r3 d28)

    ;; Reserva r4: 2 persones, dies 10-22
    (= (num-persones r4) 2)
    (pendent r4)
        (prefereix-orientacio r4 sud)

    (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22)

    ;; Reserva r5: 4 persones, dies 25-30
    (= (num-persones r5) 4)
    (pendent r5)
        (prefereix-orientacio r5 est)

    (dia-reserva r5 d25) (dia-reserva r5 d26) (dia-reserva r5 d27) (dia-reserva r5 d28) (dia-reserva r5 d29) (dia-reserva r5 d30)

    ;; Reserva r6: 4 persones, dies 2-5
    (= (num-persones r6) 4)
    (pendent r6)
        (prefereix-orientacio r6 nord)

    (dia-reserva r6 d2) (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5)

    ;; Reserva r7: 2 persones, dies 4-13
    (= (num-persones r7) 2)
    (pendent r7)
        (prefereix-orientacio r7 est)

    (dia-reserva r7 d4) (dia-reserva r7 d5) (dia-reserva r7 d6) (dia-reserva r7 d7) (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13)

    ;; Reserva r8: 1 persones, dies 14-14
    (= (num-persones r8) 1)
    (pendent r8)
        (prefereix-orientacio r8 est)

    (dia-reserva r8 d14)

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
