(define (problem hotel-generated-8h-4r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 2) ; Habitació h1: Fins a 2 persones
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 4) ; Habitació h3: Fins a 4 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones
    (= (capacitat h6) 3) ; Habitació h6: Fins a 3 persones
    (= (capacitat h7) 1) ; Habitació h7: Fins a 1 persones
    (= (capacitat h8) 4) ; Habitació h8: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 24-24
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d24)

    ;; Reserva r2: 2 persones, dies 4-12
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d4) (dia-reserva r2 d5) (dia-reserva r2 d6) (dia-reserva r2 d7) (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12)

    ;; Reserva r3: 2 persones, dies 12-14
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d12) (dia-reserva r3 d13) (dia-reserva r3 d14)

    ;; Reserva r4: 1 persones, dies 11-20
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13) (dia-reserva r4 d14) (dia-reserva r4 d15) (dia-reserva r4 d16) (dia-reserva r4 d17) (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20)

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
