(define (problem hotel-generated-6h-7r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

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
    (= (capacitat h5) 4) ; Habitació h5: Fins a 4 persones
    (= (capacitat h6) 2) ; Habitació h6: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 2 persones, dies 24-27
    (= (num-persones r1) 2)
    (pendent r1)
    (dia-reserva r1 d24) (dia-reserva r1 d25) (dia-reserva r1 d26) (dia-reserva r1 d27)

    ;; Reserva r2: 4 persones, dies 13-27
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25) (dia-reserva r2 d26) (dia-reserva r2 d27)

    ;; Reserva r3: 2 persones, dies 17-19
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19)

    ;; Reserva r4: 1 persones, dies 2-14
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d2) (dia-reserva r4 d3) (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14)

    ;; Reserva r5: 2 persones, dies 6-16
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16)

    ;; Reserva r6: 1 persones, dies 13-19
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d13) (dia-reserva r6 d14) (dia-reserva r6 d15) (dia-reserva r6 d16) (dia-reserva r6 d17) (dia-reserva r6 d18) (dia-reserva r6 d19)

    ;; Reserva r7: 3 persones, dies 1-9
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d1) (dia-reserva r7 d2) (dia-reserva r7 d3) (dia-reserva r7 d4) (dia-reserva r7 d5) (dia-reserva r7 d6) (dia-reserva r7 d7) (dia-reserva r7 d8) (dia-reserva r7 d9)

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
