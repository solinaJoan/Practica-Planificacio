(define (problem hotel-generated-4h-4r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

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
    (= (capacitat h1) 1) ; Habitació h1: Fins a 1 persones
    (= (capacitat h2) 3) ; Habitació h2: Fins a 3 persones
    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones

    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 1-1
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d1)

    ;; Reserva r2: 2 persones, dies 17-20
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20)

    ;; Reserva r3: 2 persones, dies 18-29
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d18) (dia-reserva r3 d19) (dia-reserva r3 d20) (dia-reserva r3 d21) (dia-reserva r3 d22) (dia-reserva r3 d23) (dia-reserva r3 d24) (dia-reserva r3 d25) (dia-reserva r3 d26) (dia-reserva r3 d27) (dia-reserva r3 d28) (dia-reserva r3 d29)

    ;; Reserva r4: 2 persones, dies 19-26
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22) (dia-reserva r4 d23) (dia-reserva r4 d24) (dia-reserva r4 d25) (dia-reserva r4 d26)

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
