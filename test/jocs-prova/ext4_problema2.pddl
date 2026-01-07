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
    (= (capacitat h1) 1) ; Habitació h1: Fins a 1 persones
    (= (capacitat h2) 2) ; Habitació h2: Fins a 2 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones
    (= (capacitat h6) 1) ; Habitació h6: Fins a 1 persones

    ;; === RESERVES ===
    ;; Reserva r1: 2 persones, dies 2-10
    (= (num-persones r1) 2)
    (pendent r1)
    (dia-reserva r1 d2) (dia-reserva r1 d3) (dia-reserva r1 d4) (dia-reserva r1 d5) (dia-reserva r1 d6) (dia-reserva r1 d7) (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10)

    ;; Reserva r2: 4 persones, dies 16-20
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20)

    ;; Reserva r3: 2 persones, dies 6-10
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10)

    ;; Reserva r4: 4 persones, dies 10-23
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22) (dia-reserva r4 d23)

    ;; Reserva r5: 2 persones, dies 1-10
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d1) (dia-reserva r5 d2) (dia-reserva r5 d3) (dia-reserva r5 d4) (dia-reserva r5 d5) (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10)

    ;; Reserva r6: 3 persones, dies 2-6
    (= (num-persones r6) 3)
    (pendent r6)
    (dia-reserva r6 d2) (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5) (dia-reserva r6 d6)

    ;; Reserva r7: 1 persones, dies 10-17
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17)

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
