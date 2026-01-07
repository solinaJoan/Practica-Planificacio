(define (problem hotel-extension1-no-trivial)
  (:domain hotel-reserves)

  (:objects
    ;; Habitaciones
    h1 h2 h3 - habitacio

    ;; Reservas
    r1 r2 r3 r4 r5 r6 - reserva

    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    ;; Contador de reservas asignadas
    (= (reserves-assignades) 0)

    ;; === HABITACIONS ===
    (= (capacitat h1) 1)
    (= (capacitat h2) 2)
    (= (capacitat h3) 3)

    ;; === RESERVES ===

    ;; r1: 1 persona, días 1-4
    (= (num-persones r1) 1)
    (pendent r1)
    (dia-reserva r1 d1)
    (dia-reserva r1 d2)
    (dia-reserva r1 d3)
    (dia-reserva r1 d4)

    ;; r2: 2 personas, días 3-7
    (= (num-persones r2) 2)
    (pendent r2)
    (dia-reserva r2 d3)
    (dia-reserva r2 d4)
    (dia-reserva r2 d5)
    (dia-reserva r2 d6)
    (dia-reserva r2 d7)

    ;; r3: 3 personas, días 5-10
    (= (num-persones r3) 3)
    (pendent r3)
    (dia-reserva r3 d5)
    (dia-reserva r3 d6)
    (dia-reserva r3 d7)
    (dia-reserva r3 d8)
    (dia-reserva r3 d9)
    (dia-reserva r3 d10)

    ;; r4: 4 personas, días 1-10
    (= (num-persones r4) 4)
    (pendent r4)
    (dia-reserva r4 d1)
    (dia-reserva r4 d2)
    (dia-reserva r4 d3)
    (dia-reserva r4 d4)
    (dia-reserva r4 d5)
    (dia-reserva r4 d6)
    (dia-reserva r4 d7)
    (dia-reserva r4 d8)
    (dia-reserva r4 d9)
    (dia-reserva r4 d10)

    ;; r5: 2 personas, días 8-12
    (= (num-persones r5) 2)
    (pendent r5)
    (dia-reserva r5 d8)
    (dia-reserva r5 d9)
    (dia-reserva r5 d10)
    (dia-reserva r5 d11)
    (dia-reserva r5 d12)

    ;; r6: 1 persona, días 6-9
    (= (num-persones r6) 1)
    (pendent r6)
    (dia-reserva r6 d6)
    (dia-reserva r6 d7)
    (dia-reserva r6 d8)
    (dia-reserva r6 d9)
  )

  (:goal
    ;; Todas las reservas deben estar procesadas (asignadas o rechazadas)
    (forall (?r - reserva) (not (pendent ?r)))
  )

  ;; Optimizar el número de reservas asignadas
  (:metric minimize (reserves-assignades))
)
