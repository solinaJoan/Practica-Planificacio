(define (problem hotel-generated-5h-8r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
    ;; Orientacions
    nord sud est oest - orientacio
  )

  (:init
    ;; === INICIALITZACIÓ MÈTRIQUES ===
    (= (reserves-assignades) 0)
    (= (orientacions-incorrectes) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 4) ; Habitació h1: Fins a 4 persones
    (te-orientacio h1 est)

    (= (capacitat h2) 3) ; Habitació h2: Fins a 3 persones
    (te-orientacio h2 est)

    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (te-orientacio h3 est)

    (= (capacitat h4) 4) ; Habitació h4: Fins a 4 persones
    (te-orientacio h4 est)

    (= (capacitat h5) 2) ; Habitació h5: Fins a 2 persones
    (te-orientacio h5 oest)


    ;; === RESERVES ===
    ;; Reserva r1: 3 persones, dies 10-24, prefereix est
    (= (num-persones r1) 3)
    (pendent r1)
    (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22) (dia-reserva r1 d23) (dia-reserva r1 d24)

    ;; Reserva r2: 1 persones, dies 8-17, prefereix sud
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d8) (dia-reserva r2 d9) (dia-reserva r2 d10) (dia-reserva r2 d11) (dia-reserva r2 d12) (dia-reserva r2 d13) (dia-reserva r2 d14) (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17)

    ;; Reserva r3: 2 persones, dies 5-10, prefereix nord
    (= (num-persones r3) 2)
    (pendent r3)
    (dia-reserva r3 d5) (dia-reserva r3 d6) (dia-reserva r3 d7) (dia-reserva r3 d8) (dia-reserva r3 d9) (dia-reserva r3 d10)

    ;; Reserva r4: 1 persones, dies 3-13, prefereix sud
    (= (num-persones r4) 1)
    (pendent r4)
    (dia-reserva r4 d3) (dia-reserva r4 d4) (dia-reserva r4 d5) (dia-reserva r4 d6) (dia-reserva r4 d7) (dia-reserva r4 d8) (dia-reserva r4 d9) (dia-reserva r4 d10) (dia-reserva r4 d11) (dia-reserva r4 d12) (dia-reserva r4 d13)

    ;; Reserva r5: 1 persones, dies 9-13, prefereix nord
    (= (num-persones r5) 1)
    (pendent r5)
    (dia-reserva r5 d9) (dia-reserva r5 d10) (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13)

    ;; Reserva r6: 1 persones, dies 3-14, prefereix nord
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5) (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11) (dia-reserva r6 d12) (dia-reserva r6 d13) (dia-reserva r6 d14)

    ;; Reserva r7: 3 persones, dies 21-27, prefereix sud
    (= (num-persones r7) 3)
    (pendent r7)
    (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25) (dia-reserva r7 d26) (dia-reserva r7 d27)

    ;; Reserva r8: 3 persones, dies 2-16, prefereix oest
    (= (num-persones r8) 3)
    (pendent r8)
    (dia-reserva r8 d2) (dia-reserva r8 d3) (dia-reserva r8 d4) (dia-reserva r8 d5) (dia-reserva r8 d6) (dia-reserva r8 d7) (dia-reserva r8 d8) (dia-reserva r8 d9) (dia-reserva r8 d10) (dia-reserva r8 d11) (dia-reserva r8 d12) (dia-reserva r8 d13) (dia-reserva r8 d14) (dia-reserva r8 d15) (dia-reserva r8 d16)

  )

  (:goal
    ;; Totes les reserves han estat processades
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Minimitzar el cost
  (:metric minimize
    (+
      (orientacions-incorrectes)
      (* 100 (reserves-assignades))
    )
  )
)
