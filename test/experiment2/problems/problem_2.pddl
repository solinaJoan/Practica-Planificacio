(define (problem hotel-generated-4h-5r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 - reserva

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
    (= (capacitat h2) 4) ; Habitació h2: Fins a 4 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 2) ; Habitació h4: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 13-14
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d13) (dia-reserva r1 d14)

    ;; Reserva r2: 3 persones, dies 12-25
    (= (num-persones r2) 3)
    (pendent r2)
    (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22) (dia-reserva r2 d23) (dia-reserva r2 d24) (dia-reserva r2 d25)

    ;; Reserva r3: 1 persones, dies 15-26
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d15) (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24) (dia-reserva r3 d25) (dia-reserva r3 d26)

    ;; Reserva r4: 4 persones, dies 18-19
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d18) (dia-reserva r4 d19)

    ;; Reserva r5: 3 persones, dies 7-16
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16)

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
