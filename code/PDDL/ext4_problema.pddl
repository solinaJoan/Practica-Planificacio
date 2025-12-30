(define (problem hotel-ejemplo-basico)
  (:domain hotel-reserves)
  
  (:objects
    ;; Habitaciones de l'hotel
    hab1 hab2 hab3 - habitacio
    
    ;; Reserves a procesar
    res1 res2 res3 - reserva
    
    ;; Dies del mes (1 al 30) 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 
    d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 
    d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )
  
  (:init
    ;; Inicialitzar el cost total
    (= (reserves-assignades) 0)
    (= (places-lliures) 0)
    (= (habitacions-obertes) 0)
    
    ;; === HABITACIONS ===
    (= (capacitat hab1) 2)  ; Habitació 1: fins a  2 persones
    (= (capacitat hab2) 3)  ; Habitació 2: fins a  3 persones
    (= (capacitat hab3) 4)  ; Habitació 3: fins a  4 persones
    
    ;; Reserva 1: 2 persones, dies 1-5
    (= (num-persones res1) 2)
    (pendent res1)
    (dia-reserva res1 d1)
    (dia-reserva res1 d2)
    (dia-reserva res1 d3)
    (dia-reserva res1 d4)
    (dia-reserva res1 d5)
    
    ;; Reserva 2: 3 persones, dies 10-15
    (= (num-persones res2) 3)
    (pendent res2)
    (dia-reserva res2 d10)
    (dia-reserva res2 d11)
    (dia-reserva res2 d12)
    (dia-reserva res2 d13)
    (dia-reserva res2 d14)
    (dia-reserva res2 d15)
    
    ;; Reserva 3: 1 persona, dies 3-7
    (= (num-persones res3) 1)
    (pendent res3)
    (dia-reserva res3 d3)
    (dia-reserva res3 d4)
    (dia-reserva res3 d5)
    (dia-reserva res3 d6)
    (dia-reserva res3 d7)
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