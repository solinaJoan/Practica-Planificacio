(define (problem hotel-generated-4h-10r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva

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
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones

    ;; === RESERVES ===
    ;; Reserva r1: 1 persones, dies 4-14
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d4) (dia-reserva r1 d5) (dia-reserva r1 d6) (dia-reserva r1 d7) (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14)

    ;; Reserva r2: 4 persones, dies 11-22
    (= (num-persones r2) 4)
    (pendent r2)
    (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20) (dia-reserva r2 d21) (dia-reserva r2 d22)

    ;; Reserva r3: 2 persones, dies 7-10
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10)

    ;; Reserva r4: 2 persones, dies 6-12
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12)

    ;; Reserva r5: 4 persones, dies 3-6
    (= (num-persones r5) 4)
    (pendent r5)
    (dia-reserva r5 d3) (dia-reserva r5 d4) (dia-reserva r5 d5) (dia-reserva r5 d6)

    ;; Reserva r6: 1 persones, dies 21-21
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d21)

    ;; Reserva r7: 1 persones, dies 8-22
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d8) (dia-reserva r7 d9) (dia-reserva r7 d10) (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22)

    ;; Reserva r8: 4 persones, dies 16-23
    (= (num-persones r8) 4)
    (pendent r8)
    (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23)

    ;; Reserva r9: 4 persones, dies 2-16
    (= (num-persones r9) 4)
    (pendent r9)
    (dia-reserva r9 d2) (dia-reserva r9 d3) (dia-reserva r9 d4) (dia-reserva r9 d5) (dia-reserva r9 d6) (dia-reserva r9 d7) (dia-reserva r9 d8) (dia-reserva r9 d9) (dia-reserva r9 d10) (dia-reserva r9 d11) (dia-reserva r9 d12) (dia-reserva r9 d13) (dia-reserva r9 d14) (dia-reserva r9 d15) (dia-reserva r9 d16)

    ;; Reserva r10: 4 persones, dies 13-13
    (= (num-persones r10) 4)
    (pendent r10)
    (dia-reserva r10 d13)

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
