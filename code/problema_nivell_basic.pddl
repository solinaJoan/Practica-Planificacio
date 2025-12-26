(define (problem hotel-ejemplo-basico)
  (:domain hotel-reservas)
  
  (:objects
    ;; Habitaciones del hotel
    hab1 hab2 hab3 - habitacion
    
    ;; Reservas a procesar
    res1 res2 res3 - reserva
    
    ;; Días del mes (1 al 30) - definimos solo los necesarios para el ejemplo
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 
    d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 - dia
  )
  
  (:init
    ;; Capacidades de las habitaciones
    (= (capacidad hab1) 2)  ; Habitación 1: hasta 2 personas
    (= (capacidad hab2) 3)  ; Habitación 2: hasta 3 personas
    (= (capacidad hab3) 4)  ; Habitación 3: hasta 4 personas
    
    ;; Reserva 1: 2 personas, días 1-5
    (= (num-personas res1) 2)
    (pendiente res1)
    (dia-reserva res1 d1)
    (dia-reserva res1 d2)
    (dia-reserva res1 d3)
    (dia-reserva res1 d4)
    (dia-reserva res1 d5)
    
    ;; Reserva 2: 3 personas, días 10-15
    (= (num-personas res2) 3)
    (pendiente res2)
    (dia-reserva res2 d10)
    (dia-reserva res2 d11)
    (dia-reserva res2 d12)
    (dia-reserva res2 d13)
    (dia-reserva res2 d14)
    (dia-reserva res2 d15)
    
    ;; Reserva 3: 1 persona, días 3-7
    (= (num-personas res3) 1)
    (pendiente res3)
    (dia-reserva res3 d3)
    (dia-reserva res3 d4)
    (dia-reserva res3 d5)
    (dia-reserva res3 d6)
    (dia-reserva res3 d7)
  )
  
  (:goal
    ;; Todas las reservas deben estar servidas
    (forall (?r - reserva) (servida ?r))
  )
)