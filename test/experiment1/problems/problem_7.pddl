(define (problem hotel-generated-10h-4r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 - habitacio

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
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones
    (= (capacitat h6) 3) ; Habitació h6: Fins a 3 persones
    (= (capacitat h7) 2) ; Habitació h7: Fins a 2 persones
    (= (capacitat h8) 4) ; Habitació h8: Fins a 4 persones
    (= (capacitat h9) 4) ; Habitació h9: Fins a 4 persones
    (= (capacitat h10) 2) ; Habitació h10: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 14-24
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24)

    ;; Reserva r2: 4 persones, dies 15-21
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21)

    ;; Reserva r3: 1 persones, dies 13-13
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d13)

    ;; Reserva r4: 1 persones, dies 7-10
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10)

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
