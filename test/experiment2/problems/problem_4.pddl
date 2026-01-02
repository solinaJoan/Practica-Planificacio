(define (problem hotel-generated-4h-7r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 3) ; Habitació h1: Fins a 3 persones
    (= (capacitat h2) 3) ; Habitació h2: Fins a 3 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 15-29
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27) (dia-reserva r1 d28) (dia-reserva r1 d29)

    ;; Reserva r2: 3 persones, dies 8-10
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10)

    ;; Reserva r3: 4 persones, dies 13-27
    (= (num-persones r3) 4)
    (pendent r3)
    (dia-reserva r3 d13) (dia-reserva r3 d14) (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24) (dia-reserva r3 d25) (dia-reserva r3 d26) (dia-reserva r3 d27)

    ;; Reserva r4: 2 persones, dies 17-19
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19)

    ;; Reserva r5: 1 persones, dies 2-14
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d2) (dia-reserva r5 d3) (dia-reserva r5 d4) (dia-reserva r5 d5) (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14)

    ;; Reserva r6: 2 persones, dies 6-16
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16)

    ;; Reserva r7: 1 persones, dies 13-19
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19)

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
