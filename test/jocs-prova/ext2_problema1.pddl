(define (problem hotel-generated-6h-10r)
  (:domain hotel-reserves)

  (:objects
    ;; Habitacions de l'hotel
    h1 h2 h3 h4 h5 h6 - habitacio

    ;; Reserves a processar
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva

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
    (te-orientacio h1 oest)

    (= (capacitat h2) 3) ; Habitació h2: Fins a 3 persones
    (te-orientacio h2 oest)

    (= (capacitat h3) 2) ; Habitació h3: Fins a 2 persones
    (te-orientacio h3 nord)

    (= (capacitat h4) 3) ; Habitació h4: Fins a 3 persones
    (te-orientacio h4 nord)

    (= (capacitat h5) 1) ; Habitació h5: Fins a 1 persones
    (te-orientacio h5 sud)

    (= (capacitat h6) 3) ; Habitació h6: Fins a 3 persones
    (te-orientacio h6 sud)


    ;; === RESERVES ===
    ;; Reserva r1: 4 persones, dies 10-22, prefereix nord
    (= (num-persones r1) 4)
    (pendent r1)
    (dia-reserva r1 d10) (dia-reserva r1 d11) (dia-reserva r1 d12) (dia-reserva r1 d13) (dia-reserva r1 d14) (dia-reserva r1 d15) (dia-reserva r1 d16) (dia-reserva r1 d17) (dia-reserva r1 d18) (dia-reserva r1 d19) (dia-reserva r1 d20) (dia-reserva r1 d21) (dia-reserva r1 d22)

    ;; Reserva r2: 1 persones, dies 15-20, prefereix est
    (= (num-persones r2) 1)
    (pendent r2)
    (dia-reserva r2 d15) (dia-reserva r2 d16) (dia-reserva r2 d17) (dia-reserva r2 d18) (dia-reserva r2 d19) (dia-reserva r2 d20)

    ;; Reserva r3: 3 persones, dies 16-18, prefereix nord
    (= (num-persones r3) 3)
    (pendent r3)
    (dia-reserva r3 d16) (dia-reserva r3 d17) (dia-reserva r3 d18)

    ;; Reserva r4: 2 persones, dies 18-23, prefereix sud
    (= (num-persones r4) 2)
    (pendent r4)
    (dia-reserva r4 d18) (dia-reserva r4 d19) (dia-reserva r4 d20) (dia-reserva r4 d21) (dia-reserva r4 d22) (dia-reserva r4 d23)

    ;; Reserva r5: 3 persones, dies 11-16, prefereix oest
    (= (num-persones r5) 3)
    (pendent r5)
    (dia-reserva r5 d11) (dia-reserva r5 d12) (dia-reserva r5 d13) (dia-reserva r5 d14) (dia-reserva r5 d15) (dia-reserva r5 d16)

    ;; Reserva r6: 2 persones, dies 3-11, prefereix nord
    (= (num-persones r6) 2)
    (pendent r6)
    (dia-reserva r6 d3) (dia-reserva r6 d4) (dia-reserva r6 d5) (dia-reserva r6 d6) (dia-reserva r6 d7) (dia-reserva r6 d8) (dia-reserva r6 d9) (dia-reserva r6 d10) (dia-reserva r6 d11)

    ;; Reserva r7: 2 persones, dies 15-27, prefereix oest
    (= (num-persones r7) 2)
    (pendent r7)
    (dia-reserva r7 d15) (dia-reserva r7 d16) (dia-reserva r7 d17) (dia-reserva r7 d18) (dia-reserva r7 d19) (dia-reserva r7 d20) (dia-reserva r7 d21) (dia-reserva r7 d22) (dia-reserva r7 d23) (dia-reserva r7 d24) (dia-reserva r7 d25) (dia-reserva r7 d26) (dia-reserva r7 d27)

    ;; Reserva r8: 2 persones, dies 16-30, prefereix oest
    (= (num-persones r8) 2)
    (pendent r8)
    (dia-reserva r8 d16) (dia-reserva r8 d17) (dia-reserva r8 d18) (dia-reserva r8 d19) (dia-reserva r8 d20) (dia-reserva r8 d21) (dia-reserva r8 d22) (dia-reserva r8 d23) (dia-reserva r8 d24) (dia-reserva r8 d25) (dia-reserva r8 d26) (dia-reserva r8 d27) (dia-reserva r8 d28) (dia-reserva r8 d29) (dia-reserva r8 d30)

    ;; Reserva r9: 4 persones, dies 21-23, prefereix oest
    (= (num-persones r9) 4)
    (pendent r9)
    (dia-reserva r9 d21) (dia-reserva r9 d22) (dia-reserva r9 d23)

    ;; Reserva r10: 3 persones, dies 9-17, prefereix nord
    (= (num-persones r10) 3)
    (pendent r10)
    (dia-reserva r10 d9) (dia-reserva r10 d10) (dia-reserva r10 d11) (dia-reserva r10 d12) (dia-reserva r10 d13) (dia-reserva r10 d14) (dia-reserva r10 d15) (dia-reserva r10 d16) (dia-reserva r10 d17)

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
