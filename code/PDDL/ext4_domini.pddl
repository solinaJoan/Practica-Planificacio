(define (domain hotel-reserves)
  (:requirements :adl :typing :fluents)
  
  (:types
    habitacio reserva dia - object
  )
  
  (:predicates
    ;; Estat de les reserves
    (pendent ?r - reserva)
    (assignada ?r - reserva ?h - habitacio)
    
    ;; Predicats per les habitacions
    (ocupada ?h - habitacio ?d - dia)
    (habitacio-oberta ?h - habitacio)

    ;; Dies que pertanyen a una reserva
    (dia-reserva ?r - reserva ?d - dia)
  )
  
  (:functions
    ;; Capacitat de cada habitació
    (capacitat ?h - habitacio)
    
    ;; Número de persones a cada reserva
    (num-persones ?r - reserva)
    
    ;; Cost total (per optimitzar)
    (reserves-assignades)
    (places-lliures)
    (habitacions-obertes)
  )
  
  (:action assignar-reserva
    :parameters (?r - reserva ?h - habitacio)
    :precondition (and 
      ;; La reserva està pendent
      (pendent ?r)
      
      ;; L'habitació té capacitat suficient
      (>= (capacitat ?h) (num-persones ?r))
      
      ;; L'habitació no està ocupada cap dia de la reserva
      (forall (?d - dia)
        (imply (dia-reserva ?r ?d)
               (not (ocupada ?h ?d))))
    )
    :effect (and
      ;; Assignar la reserva
      (assignada ?r ?h)
      (not (pendent ?r))
      
      ;; Marcar tots els dies de la reserva com ocupats
      (forall (?d - dia)
        (when (dia-reserva ?r ?d)
              (ocupada ?h ?d)))

      ;; Penalitzar per les places lliures que queden a l'habitació
      (increase (places-lliures) (- (capacitat ?h) (num-persones ?r)))

      ;; Penalitzar si obrim una habitació nova
      (when (not (habitacio-oberta ?h))
        (and
          (habitacio-oberta ?h)
          (increase (habitacions-obertes) 1)
        )
      )
    )
  )
  
  ;; Acció per deixar una reserva sense assignar
  (:action descartar-reserva
    :parameters (?r - reserva)
    :precondition (pendent ?r)
    :effect (and
      ;; No marquem com servida, simplement la treiem de pendents
      (not (pendent ?r))
      (increase (reserves-assignades) 1)
    )
  )
)