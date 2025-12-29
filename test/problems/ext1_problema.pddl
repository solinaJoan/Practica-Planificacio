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

    ;; === HABITACIONS ===
    (= (capacitat h1) 1) ; Habitació h1: Fins a 1 persones
    (= (capacitat h2) 1) ; Habitació h2: Fins a 1 persones
    (= (capacitat h3) 3) ; Habitació h3: Fins a 3 persones
    (= (capacitat h4) 1) ; Habitació h4: Fins a 1 persones
    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones

    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 6-10
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d6) (dia-reserva r1 d7) (dia-reserva r1 d8) (dia-reserva r1 d9) (dia-reserva r1 d10)

    ;; Reserva r2: 2 persones, dies 4-14
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d4) (dia-reserva r2 d5) (dia-reserva r2 d6) (dia-reserva r2 d7) (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14)

    ;; Reserva r3: 1 persones, dies 2-13
    (= (num-persones r3) 1)
    (pendent r3)
    (dia-reserva r3 d2) (dia-reserva r3 d3) (dia-reserva r3 d4) (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10) (dia-reserva r3 d11) (dia-reserva r3 d12) (dia-reserva r3 d13)

    ;; Reserva r4: 4 persones, dies 9-12
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12)

    ;; Reserva r5: 3 persones, dies 2-9
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d2) (dia-reserva r5 d3) (dia-reserva r5 d4) (dia-reserva r5 d5) (dia-reserva r5 d6) (dia-reserva r5 d7) (dia-reserva r5 d8) (dia-reserva r5 d9)

    ;; Reserva r6: 4 persones, dies 18-22
    (= (num-persones r6) 4)
    (pendent r6)
    (dia-reserva r6 d18) (dia-reserva r6 d19) (dia-reserva r6 d20) (dia-reserva r6 d21) (dia-reserva r6 d22)

    ;; Reserva r7: 1 persones, dies 11-21
    (= (num-persones r7) 1)
    (pendent r7)
    (dia-reserva r7 d11) (dia-reserva r7 d12) (dia-reserva r7 d13) (dia-reserva r7 d14) (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21)

    ;; Reserva r8: 1 persones, dies 10-16
    (= (num-persones r8) 1)
    (pendent r8)
    (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize (reserves-assignades))
)
